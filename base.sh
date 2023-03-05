#!/bin/bash -e

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
TOPLEVEL="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"

mkdir -p cache target
cd target

copy_submodule() {
  local submodule="git/$1"
  local dest="${2-"${submodule##*/}"}"

  echo "Copying submodule $submodule to target/$dest"
  if [[ -e $dest ]]; then
    echo "Destination exists: $dest" >&2
    return 1
  fi
  mkdir -p "$(dirname "$dest")"
  cp -rp "$TOPLEVEL/$submodule" "$dest"

  # If the submodule had its git dir absorbed, copy it from .git/modules
  local git_file git_dir
  git_file="$TOPLEVEL/$submodule/.git"
  git_dir="$(git --git-dir "$git_file" rev-parse --absolute-git-dir)"
  if [[ "$git_file" != "$git_dir" ]]; then
    rm -rf "$dest/.git"
    cp -rp "$git_dir" "$dest/.git"
    sed -i.bak '/worktree =/d' "$dest/.git/config"
    rm "$dest/.git/config.bak"
  fi

  # If the repo has a detached HEAD, attempt to checkout a branch pointing to it
  local current_branch branch_at_head
  current_branch="$(git --git-dir "$dest/.git" branch --show-current)"
  if [[ -z $current_branch ]]; then
    branch_at_head="$(git --git-dir "$dest/.git" for-each-ref refs/heads --points-at HEAD --format='%(refname:lstrip=2)' | head -n1)"
    if [[ -n "$branch_at_head" ]]; then
      git --git-dir "$dest/.git" checkout -q "$branch_at_head"
    else
      echo "$submodule: No branch points to HEAD. Maybe the submodule is out of sync?" >&2
      return 1
    fi
  fi

  # Allow running git filter-repo without --force
  mkdir -p "$dest/.git/filter-repo"
  touch "$dest/.git/filter-repo/already_ran"
}

merge_repo() {
  local repo="$1"
  git remote add "$repo" "../$repo"
  git fetch -q "$repo"
  git merge -q --allow-unrelated-histories --no-edit "$repo/main"
  git remote remove "$repo"
  rm -rf "../$repo"
}

wget-cache() {
  url="$1"
  url_out="${url##*/}"
  out="${2-"$url_out"}"
  cache="$TOPLEVEL/cache/$out"
  if [ ! -f "$cache" ]; then
    wget -q "$url" -O "$cache"
  fi
  cp -p "$cache" "$out"
}
