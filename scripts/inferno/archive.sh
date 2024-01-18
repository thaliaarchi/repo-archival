#!/bin/bash -e

. base.sh

# Verify that HEAD is contained within the master branch of inferno-os.
git_verify_is_ancestor() {
  local repo="$1"
  pushd "$repo" > /dev/null
  git remote add inferno-os "$TOPLEVEL/git/github.com/inferno-os/inferno-os"
  git fetch -q inferno-os
  if git merge-base --is-ancestor HEAD inferno-os/master; then
    echo "inferno-os continues from $repo at commit"
    git log -1 --format='%H %ai %s'
  else
    echo "inferno-os does not contain the history of $repo" >&2
    exit 1
  fi
  git remote remove inferno-os
  popd > /dev/null
}

tag_head() {
  local repo="$1"
  git -C inferno-os tag "$repo" "$(git -C "$repo" rev-parse HEAD)"
}

tag_head_and_push() {
  local repo="$1"
  git -C inferno-os remote add tag-temp "../$repo"
  git -C inferno-os fetch -q tag-temp main
  tag_head "$repo"
  git -C inferno-os remote remove tag-temp
}

section() {
  local name="$1"
  echo_header "$name"
  if [[ -d $name ]]; then
    echo 'Already completed'
  else
    "$name"
  fi
}

inferno-1e0() {
  copy_submodule github.com/inferno-os/inferno-1e0
  # Two spurious commits add, then delete .gitignore
  git -C inferno-1e0 filter-repo --quiet --invert-path --path .gitignore
}

# Inferno 4E Mercurial repo
inferno-os-hg() {
  # https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/inferno-os/inferno-os-hg
  # https://bitbucket-archive.softwareheritage.org/projects/in/inferno-os/inferno-os-hg.html
  mkdir inferno-os-hg
  tar xf "$(get_cached_path https://bitbucket-archive.softwareheritage.org/new-static/dc/dc139a99-1421-4196-9b08-0479cdc057ae/dc139a99-1421-4196-9b08-0479cdc057ae-repository.tar.gz)" \
    --strip-components=1 \
    -C inferno-os-hg
  # The hg-to-git conversion by SWH does not match commit hashes. Luckily,
  # hg-fast-export produces the same hashes as appear on GitHub.
  hg_to_git inferno-os-hg
  git_verify_is_ancestor inferno-os-hg
  tag_head inferno-os-hg
}

# Inferno 4E Mercurial checkout with Unix executables
inferno-4e-20150328-unix() {
  tar xf "$(get_cached_path https://www.vitanuova.com/dist/4e/inferno-20150328.tgz)"
  fix_perms inferno
  mv inferno inferno-4e-20150328-unix
  hg_to_git inferno-4e-20150328-unix
  git_verify_is_ancestor inferno-4e-20150328-unix
  cd inferno-4e-20150328-unix
  git add -Af
  # HTTP Last-Modified: 2015-03-28 11:02:31 +0000
  # inferno/ modtime:   2015-03-28 10:58:34 +0000
  # Previous commit:    2015-03-28 10:58:16 +0000
  GIT_AUTHOR_NAME='Charles Forsyth' GIT_AUTHOR_EMAIL='charles.forsyth@gmail.com' GIT_AUTHOR_DATE='2015-03-28 10:58:34 +0000' \
  GIT_COMMITTER_NAME='Charles Forsyth' GIT_COMMITTER_EMAIL='charles.forsyth@gmail.com' GIT_COMMITTER_DATE='2015-03-28 10:58:34 +0000' \
  git commit -q -m 'Compile Unix executables' --trailer Source:https://www.vitanuova.com/dist/4e/inferno-20150328.tgz
  cd ..
  tag_head_and_push inferno-4e-20150328-unix
}

# Inferno 4E Mercurial checkout with Windows executables
inferno-4e-20091219-win() {
  unzip -q "$(get_cached_path https://www.vitanuova.com/dist/4e/inferno.zip)"
  mv inferno inferno-4e-20091219-win
  hg_to_git inferno-4e-20091219-win
  git_verify_is_ancestor inferno-4e-20091219-win
  cd inferno-4e-20091219-win
  # Ignore execute bit for all files, except for .exe.
  git config core.fileMode false
  git add -Af
  git diff --staged --diff-filter=A --name-only -z -- '*.exe' |
    xargs -0 git update-index --chmod=+x
  # HTTP Last-Modified: 2009-12-19 16:12:54 +0000
  # inferno/ modtime:   2009-12-19 15:41:26 +0000
  # Previous commit:    2009-12-19 14:29:25 +0000
  GIT_AUTHOR_NAME='forsyth' GIT_AUTHOR_EMAIL='forsyth@vitanuova.com' GIT_AUTHOR_DATE='2009-12-19 15:41:26 +0000' \
  GIT_COMMITTER_NAME='forsyth' GIT_COMMITTER_EMAIL='forsyth@vitanuova.com' GIT_COMMITTER_DATE='2009-12-19 15:41:26 +0000' \
  git commit -q -m 'Compile Windows executables' --trailer Source:https://www.vitanuova.com/dist/4e/inferno.zip
  cd ..
  tag_head_and_push inferno-4e-20091219-win
}

mkdir -p inferno
cd inferno

copy_submodule github.com/inferno-os/inferno-os
section inferno-1e0
section inferno-os-hg
section inferno-4e-20150328-unix
section inferno-4e-20091219-win
