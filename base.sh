#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
TOPLEVEL="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"

mkdir -p cache target
cd target

# Initialize a dummy repo in target/, to protect against accidentally modifying
# repo-archival.
if [[ ! -e .git ]]; then
  git init -q
fi

copy_submodule() {
  local submodule="$1"
  local dest="${2-"${submodule##*/}"}"
  git clone -q "$TOPLEVEL/git/$submodule/.git" "$dest"
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

# Convert a Mercurial repo to git using hg-fast-export
# https://github.com/frej/fast-export
hg_to_git() {
  local hg_repo="$1"
  local git_repo="$2"
  hg_repo="$(realpath "$hg_repo")"
  git init -q "$git_repo"
  pushd "$git_repo" > /dev/null
  git config core.ignoreCase false
  # hg-fast-export logs every revision; suppress stdout with chronic from
  # moreutils, unless it fails.
  chronic hg-fast-export -r "$hg_repo" -M main
  git checkout -q HEAD
  popd > /dev/null
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
    wget -q "$url" -O "$cached"
  fi
  echo "$cached"
}

get_cached() {
  local url="$1"
  local url_out="${url##*/}"
  local url_out="${url_out%%\?*}"
  local out="${2-"$url_out"}"
  cp -p "$(get_cached_path "$url")" "$out"
}

fix_perms() {
  # Allow the user to read and write and group/other to only read. Keep
  # executable bit as-is.
  chmod -R u+rwX,go+rX,go-w "$@"
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
  echo -e "${F_BOLD}${C_ORANGE1}$1${NO_FORMAT}"
}
