#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
TOPLEVEL="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"

# Set the timezone offset to UTC for deterministic zip extraction.
export TZ=UTC

mkdir -p cache target
cd target

# Initialize a dummy repo in target/, to protect against accidentally modifying
# repo-archival.
if [[ ! -e .git ]]; then
  git init -q
fi

submodule_path() {
  local url="${1#https://}"
  url="${url#http://}"
  echo "$TOPLEVEL/git/$url"
}

clone_submodule() {
  local url="${1#https://}"
  url="${url#http://}"
  local dest="${url##*/}"
  dest="${dest%.git}"
  dest="${2-"$dest"}"
  git clone -q --no-local "$TOPLEVEL/git/$url/.git" "$dest" "${@:3}"
}

request_swh() {
  local origin_url="$1"
  local revision="$2"
  local raw_url="https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:$revision/raw/"
  local raw_cached
  raw_cached="$(cache_path "$raw_url")"
  if [ ! -f "$raw_cached" ]; then
    if wget -q "$raw_url" -O "$raw_cached"; then
      echo "Downloaded $origin_url revision $revision from SWH"
    else
      local status=$?
      local resp
      rm "$raw_cached"
      if resp="$(curl -s -X POST "https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:$revision/")"; then
        local exception
        exception="$(jq -j '.status // .exception // .' <<< "$resp" || echo 'jq error')"
        echo "Requested $origin_url revision $revision ($exception) from SWH"
        if [[ $exception = Throttled ]]; then
          exit 1
        fi
      else
        echo "Failed to request $origin_url revision $revision from SWH"
      fi
      return $status
    fi
  fi
}

clone_swh() {
  # https://archive.softwareheritage.org/browse/origin/directory/?origin_url=$url
  local origin_url="${1#https://}"
  local revision="$2"
  local dest="${3-"${origin_url##*/}"}"
  request_swh "$origin_url" "$revision"
  mkdir "$dest"
  tar xf "$(cache_path "https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:$revision/raw/")" \
    -C "$dest"
  mv "$dest/swh:1:rev:$revision.git" "$dest/.git"
  git --git-dir="$dest/.git" config core.bare false
  git -C "$dest" checkout -q
  mkdir -p "$dest/.git/filter-repo"
  touch "$dest/.git/filter-repo/already_ran"
}

clone_swh_bare() {
  local url="${1#https://}"
  local revision="$2"
  local dest="${3-"${url##*/}.git"}"
  tar xf "$(get_cached_path "https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:$revision/raw/")"
  mv "swh:1:rev:$revision.git" "$dest"
}

# Get the latest modified date of all staged Git files, excluding deletions.
git_latest_modified() {
  if [[ -z ${tcommit_stat:-} ]]; then
    if stat --version 2> /dev/null | grep -q 'GNU coreutils'; then
      tcommit_stat=(stat --format=%Y) # Detected GNU coreutils
    else
      tcommit_stat=(stat -f %m) # Fallback to BSD-style
    fi
  fi

  git diff --staged --diff-filter=d --name-only -z |
    xargs -0 "${tcommit_stat[@]}" |
    sort -rn |
    head -1
}

set_idents() {
  local idents="$1"

  # Split author and committer idents
  local pattern='^ *([^<>,]*<[^<>]*>)? *([^<>,]*)( *, *(([^<>,]*<[^<>]*>)? *([^<>,]*)))? *$'
  if [[ ! $idents =~ $pattern ]]; then
    echo "Invalid author/committer idents: '$idents'" >&2
    return 1
  fi
  local author_ident="${BASH_REMATCH[1]:-${AUTHOR:-}}"
  GIT_AUTHOR_DATE="${BASH_REMATCH[2]}"
  local committer_ident="${BASH_REMATCH[5]:-${BASH_REMATCH[1]:-${COMMITTER:-${AUTHOR:-}}}}"
  GIT_COMMITTER_DATE="${BASH_REMATCH[6]:-${BASH_REMATCH[2]}}"

  # Split the author fields
  local pattern='^ *([^<>]*) *<([^<>]*)> *$'
  if [[ ! $author_ident =~ $pattern ]]; then
    echo "Invalid author ident: '$author_ident'" >&2
    return 1
  fi
  GIT_AUTHOR_NAME="${BASH_REMATCH[1]}"
  GIT_AUTHOR_EMAIL="${BASH_REMATCH[2]}"
  # Split the committer fields
  if [[ ! $committer_ident =~ $pattern ]]; then
    echo "Invalid committer ident: '$committer_ident'" >&2
    return 1
  fi
  GIT_COMMITTER_NAME="${BASH_REMATCH[1]}"
  GIT_COMMITTER_EMAIL="${BASH_REMATCH[2]}"

  # Use the latest file modification time for 'latest'
  if [[ $GIT_AUTHOR_DATE = latest || $GIT_COMMITTER_DATE = latest ]]; then
    local latest_modified
    latest_modified="$(git_latest_modified)"
    if [[ $GIT_AUTHOR_DATE = latest ]]; then
      GIT_AUTHOR_DATE="$latest_modified"
    fi
    if [[ $GIT_COMMITTER_DATE = latest ]]; then
      GIT_COMMITTER_DATE="$latest_modified"
    fi
  fi

  export GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_AUTHOR_DATE \
         GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL GIT_COMMITTER_DATE
}

set_tag_ident() {
  local ident="$1"
  if [[ ! $ident =~ '<' ]]; then
    ident="${COMMITTER:-${AUTHOR:-}} $ident"
  fi
  local pattern='^ *([^<>]*) *<([^<>]*)> *([^<>]*) *$'
  if [[ ! $ident =~ $pattern ]]; then
    echo "Invalid tagger ident: '$ident'" >&2
    return 1
  fi
  GIT_COMMITTER_NAME="${BASH_REMATCH[1]}"
  GIT_COMMITTER_EMAIL="${BASH_REMATCH[2]}"
  GIT_COMMITTER_DATE="${BASH_REMATCH[3]}"
  if [[ $GIT_COMMITTER_DATE = latest ]]; then
    GIT_COMMITTER_DATE="$(git_latest_modified)"
  fi
  export GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL GIT_COMMITTER_DATE
}

commit() {
  local idents="$1" message="$2"
  set_idents "$idents"
  git commit -q -m "$message" "${@:3}"
  unset GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_AUTHOR_DATE \
        GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL GIT_COMMITTER_DATE
}

tag() {
  local ident="$1" tag="$2" message="$3"
  set_tag_ident "$ident"
  git tag "$tag" -a -m "$message" "${@:4}"
  unset GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL GIT_COMMITTER_DATE
}

amend_no_edit() {
  GIT_COMMITTER_NAME="$(git show -s --format=%cn)" \
  GIT_COMMITTER_EMAIL="$(git show -s --format=%ce)" \
  GIT_COMMITTER_DATE="$(git show -s --format=%ci)" \
  git commit -q --amend --no-edit
}

merge_repo() {
  local repo="$1"
  git remote add "$repo" "../$repo"
  git fetch -q "$repo"
  git merge -q --allow-unrelated-histories --no-edit "$repo/main"
  git remote remove "$repo"
  rm -rf "../$repo"
}

rebase_with_metadata() {
  git -c rebase.instructionFormat="%s%nexec GIT_COMMITTER_NAME='%cn' GIT_COMMITTER_EMAIL='%ce' GIT_COMMITTER_DATE='%ci' git commit -q --amend --no-edit --allow-empty --allow-empty-message" \
    rebase "$@"
}

# Break just before a date, to insert a commit into the sequence
rebase_break_before_date() {
  local date="$1"
  commit_before="$(
    ( git log --format='%ad %H'; echo "$date insert" ) |
    sort | grep -B1 insert | head -n1 | cut -c27-)"
  GIT_SEQUENCE_EDITOR="sed -i~ '1s/^/break\n/'" \
  rebase_with_metadata -i -q --committer-date-is-author-date "$commit_before"
}

# Convert a Mercurial repo in-place to git using hg-fast-export. It must be on
# exactly commit 723d8032ba69594f86e282cc3b0f31cbe19f19f8, because the next
# commit, 4c10270302979f76d3bf143a2c3b3374c1b36e2c breaks compatibility for at
# least Inferno conversions. Create an alias for hg-fast-export.sh as
# hg-fast-export.
# https://github.com/frej/fast-export
hg_to_git() {
  local repo="$1"
  repo="$(realpath "$repo")"
  local git_tmp="${repo}_git"
  local working_tree_count
  working_tree_count="$(\ls -f "$repo" | wc -l)"

  git init -q "$git_tmp"
  cd "$git_tmp"
  git config core.ignoreCase false
  # hg-fast-export logs every revision; suppress stdout with chronic from
  # moreutils, unless it fails.
  chronic hg-fast-export -r "$repo" -M main
  cd - > /dev/null

  mv "$git_tmp/.git" "$repo/"
  rmdir "$git_tmp"
  rm -r "$repo/.hg"
  # If the original working tree was empty (only . .. and .hg), checkout a fresh
  # tree; otherwise, use the existing one. Uses [ unquoted, to strip the spaces
  # from wc.
  if [ $working_tree_count = 3 ]; then
    git -C "$repo" checkout -q HEAD
  else
    git -C "$repo" reset -q --mixed HEAD
    # Mercurial tags are tracked in .hgtags, but hg-fast-export converts them to
    # git tags.
    rm -f "$repo/.hgtags"
  fi
}

ia_raw_url() {
  sed -E 's,(^https://web.archive.org/web/[0-9]+)/,\1id_/,' <<< "$1"
}

cache_path() {
  # Escape / in URLs. Does not sanitize for Windows paths.
  #   / -> (
  #   \ -> \\
  #   ( -> \(
  echo -n "$TOPLEVEL/cache/"
  sed -e 's/(/<ESCAPE_PAREN>/g' \
      -e 's/\//(/g; s/\\/\\\\/g' \
      -e 's/<ESCAPE_PAREN>/\\(/g' <<< "$1"
}

get_cached_path() {
  local url="$1"
  local cached
  url="$(ia_raw_url "$url")"
  cached="$(cache_path "$url")"
  if [ ! -f "$cached" ]; then
    local cmd=(wget -q "$url" -O "$cached")
    if [[ $url = http://annex.retroarchive.org/* ]]; then
      # Override user agent.
      # They 301 redirect wget and curl to http://www.google.com/.
      cmd=(wget --user-agent '' -q "$url" -O "$cached")
    fi
    if "${cmd[@]}"; then :
    else
      local status=$?
      rm "$cached"
      echo "get_cached_path: Failed to get $url" >&2
      return $status
    fi
  fi
  echo "$cached"
}

get_cached() {
  local url="$1"
  local url_out="${url##*/}"
  local url_out="${url_out%%\?*}"
  local out="${2-"$url_out"}"
  local cached_path
  if [[ -e "$out" ]]; then
    echo "get_cached $url: $out already exists" >&2
    exit 1
  fi
  cached_path="$(get_cached_path "$url")"
  mkdir -p "$(dirname "$out")"
  cp -p "$cached_path" "$out"
}

commit_archive() {
  local ident="$1" message="$2" url="$3"
  local strip='--strip-components=1' cached_path
  if [[ $3 = --nostrip ]]; then
    strip=
    url="$4"
  fi
  cached_path="$(get_cached_path "$url")"
  git rm -qr --ignore-unmatch .
  tar xf "$cached_path" $strip
  git add -Af
  commit "$ident" "$message" --trailer=Source:"$url"
}

fix_perms() {
  # Allow the user to read and write and group/other to only read. Keep
  # executable bit as-is.
  chmod -R u+rwX,go+rX,go-w "$@"
}

7z() {
  # 7z extracts in the local timezone; use UTC. Suppress logging, unless it
  # fails.
  TZ="${TZ-UTC}" chronic 7z "$@"
}

list_swh_branches() {
  local origin="$1"
  curl -s "$(curl -s "https://archive.softwareheritage.org/api/1/origin/$origin/visit/latest/" | jq -r .snapshot_url)" |
  jq -r '
    if .next_branch != null then "has another page of branches" | error end |
    .branches |
    .HEAD.target as $HEAD | del(.HEAD) |
    to_entries[] |
    if .value.target_type != "revision" then "branch is not a revision: \(.)" | error end |
    "\(.key | sub("^branch-tip/"; "")): \(.value.target)\(if $HEAD == .key then " (HEAD)" else "" end)"
  '
}

echo_header() {
  # https://colors.sh/
  local NO_FORMAT="\033[0m"
  local F_BOLD="\033[1m"
  local C_ORANGE1="\033[38;5;214m"
  local header="$1"
  local subheader="${2:+": $2"}"
  echo -e "${F_BOLD}${C_ORANGE1}$header${NO_FORMAT}$subheader"
}
