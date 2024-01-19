#!/bin/bash -e

. base.sh

# Kill sub-processes on exit
trap 'trap - SIGTERM && kill -- -$$' SIGINT SIGTERM EXIT

# See note in base.sh for pinned version of hg-fast-export.

repos=()

section() {
  local repo="$1"
  repos+=("$repo")
  if [[ -d $repo ]]; then
    echo_header "$repo" 'Already completed'
  else
    ( echo_header "$repo" && "$repo" 2>&1 ) | sponge &
  fi
}

unzip_tar() {
  local repo="$1"
  local root_dir="$2"
  local url="$3"
  mkdir "$repo.tmp"
  tar xf "$(get_cached_path "$url")" -C "$repo.tmp"
  mv "$repo.tmp/$root_dir" "$repo"
  rmdir "$repo.tmp"
}

unzip_zip() {
  local repo="$1"
  local root_dir="$2"
  local url="$3"
  mkdir "$repo.tmp"
  unzip -q "$(get_cached_path "$url")" -d "$repo.tmp"
  mv "$repo.tmp/$root_dir" "$repo"
  rmdir "$repo.tmp"
}

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

push_tag() {
  local repo="$1"
  git -C inferno-os remote add tag-temp "../$repo"
  git -C inferno-os fetch -q tag-temp main
  git -C inferno-os tag "$repo" "$(git -C "$repo" rev-parse HEAD)"
  git -C inferno-os remote remove tag-temp
}

inferno-1e0() {
  copy_submodule github.com/inferno-os/inferno-1e0
  # Two spurious commits add, then delete, .gitignore
  git -C inferno-1e0 filter-repo --quiet --invert-path --path .gitignore
}

inferno-1e0-src() {
  # HTTP Last-Modified: 2007-10-19 13:03:32 +0000
  # Modtimes:
  #   Many dirs:        2007-10-19 12:49:58 +0000 to 2007-10-19 12:52:22 +0000
  #   1e0/LICENSE:      2007-10-19 12:46:04 +0000
  #   Initial:          1997-05-16 13:57:23 +0000 to 1997-05-16 14:05:45 +0000
  local repo=inferno-1e0-src
  local source=https://web.archive.org/web/20110807071440/http://www.vitanuova.com/dist/old/1e/1e0.tgz
  unzip_tar $repo 1e0 $source
}

inferno-1e1-src() {
  # HTTP Last-Modified: 2007-10-19 13:25:48 +0000
  # Modtimes:
  #   Many dirs:        2007-10-19 13:08:13 +0000 to 2007-10-19 13:24:53 +0000
  #   1e1src/LICENSE:   2007-10-19 13:09:00 +0000
  #   Sporadic changes: 1996-10-21 14:44:24 +0000 to 1998-01-26 15:35:16 +0000
  #   Initial:          1996-10-20 23:26:42 +0000 to 1996-10-20 23:43:10 +0000
  local repo=inferno-1e1-src
  local source=https://web.archive.org/web/20110807071535/http://www.vitanuova.com/dist/old/1e/1e1src.tgz
  unzip_tar $repo 1e1src $source
}

inferno-2e-src() {
  # HTTP Last-Modified: 2007-10-19 12:23:28 +0000
  # Modtimes:
  #   2e/NOTICE:        2007-10-19 12:23:01 +0000
  #   Many dirs:        2000-01-28 19:48:28 +0000 to 2007-10-19 12:21:00 +0000
  #   2e/math/NOTICE:   2007-10-19 12:11:19 +0000
  #   2e/os/sa1100/mkfile: 2007-10-19 11:57:07 +0000
  #   2e/LICENCE:       2007-10-19 11:35:34 +0000
  #   Initial:          1999-07-13 14:44:09 +0000 to 1999-07-13 14:51:41 +0000
  local repo=inferno-2e-src
  local source=https://web.archive.org/web/20110514213516/http://www.vitanuova.com/dist/old/2e/2e.tgz
  unzip_tar $repo 2e $source
}

inferno-3e-src() {
  # HTTP Last-Modified: 2007-10-18 13:36:41 +0000
  # Modtimes:
  local repo=inferno-3e-src
  local source=https://web.archive.org/web/20110514214020/http://www.vitanuova.com/dist/old/3e/3e.tgz
  unzip_tar $repo 3e $source
}

inferno-3econtrib-src() {
  # HTTP Last-Modified: 2007-10-18 08:16:02 +0000
  # Modtimes:
  local repo=inferno-3econtrib-src
  local source=https://web.archive.org/web/20110514215522/http://www.vitanuova.com/dist/old/3e/3econtrib.tgz
  unzip_tar $repo 3econtrib $source
}

# Inferno 4E Mercurial repo
inferno-os-hg() {
  local repo=inferno-os-hg
  # https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/inferno-os/inferno-os-hg
  # https://bitbucket-archive.softwareheritage.org/projects/in/inferno-os/inferno-os-hg.html
  mkdir $repo
  tar xf "$(get_cached_path https://bitbucket-archive.softwareheritage.org/new-static/dc/dc139a99-1421-4196-9b08-0479cdc057ae/dc139a99-1421-4196-9b08-0479cdc057ae-repository.tar.gz)" \
    --strip-components=1 \
    -C $repo
  # The hg-to-git conversion by SWH does not match commit hashes. Luckily,
  # hg-fast-export produces the same hashes as appear on GitHub.
  hg_to_git $repo
  git_verify_is_ancestor $repo
}

inferno-4e-20070510-unix() {
  local repo=inferno-4e-20070510-unix
  local source=https://web.archive.org/web/20070701073142/http://www.vitanuova.com/dist/4e/inferno-20070510.tgz
  unzip_tar $repo inferno-20070510 $source
  cd $repo
  copy_submodule github.com/inferno-os/inferno-os .git --bare
  git --git-dir=.git update-ref refs/heads/master dd7f661c1e9a0167d1d500b21866f267efa8dc5f
  git config core.bare false
  git branch -m master main
  git add -Af
  # HTTP Last-Modified: 2007-05-30 23:49:38 +0000
  # Latest modtime:     2007-05-30 23:47:35 +0000
  GIT_AUTHOR_NAME='Charles.Forsyth' GIT_AUTHOR_EMAIL='devnull@localhost' GIT_AUTHOR_DATE='2007-05-30 23:47:35 +0000' \
  GIT_COMMITTER_NAME='Charles.Forsyth' GIT_COMMITTER_EMAIL='devnull@localhost' GIT_COMMITTER_DATE='2007-05-30 23:47:35 +0000' \
  git commit -q -m '20070510-2347 add fonts' --trailer Source:$source
  cd ..
}

# Inferno 4E Mercurial checkout with Windows executables
inferno-4e-20091219-win() {
  local repo=inferno-4e-20091219-win
  local source=https://web.archive.org/web/20110514212006/http://www.vitanuova.com/dist/4e/inferno.zip
  unzip_zip $repo inferno $source
  hg_to_git $repo
  git_verify_is_ancestor $repo
  cd $repo
  # Ignore execute bit for all files, except for .exe.
  git config core.fileMode false
  git add -Af
  git diff --staged --diff-filter=A --name-only -z -- '*.exe' |
    xargs -0 git update-index --chmod=+x
  # HTTP Last-Modified: 2009-12-19 16:12:54 +0000
  # Root dir modtime:   2009-12-19 15:41:26 +0000
  # Previous commit:    2009-12-19 14:29:25 +0000
  GIT_AUTHOR_NAME='forsyth' GIT_AUTHOR_EMAIL='forsyth@vitanuova.com' GIT_AUTHOR_DATE='2009-12-19 15:41:26 +0000' \
  GIT_COMMITTER_NAME='forsyth' GIT_COMMITTER_EMAIL='forsyth@vitanuova.com' GIT_COMMITTER_DATE='2009-12-19 15:41:26 +0000' \
  git commit -q -m 'Compile Windows executables and add fonts' --trailer Source:$source
  cd ..
}

inferno-4e-20100120-unix() {
  local repo=inferno-4e-20100120-unix
  local source=https://web.archive.org/web/20110514214545/http://www.vitanuova.com/dist/4e/inferno-20100120.tgz
  unzip_tar $repo inferno $source
  hg_to_git $repo
  git_verify_is_ancestor $repo
  cd $repo
  git add -Af
  # HTTP Last-Modified: 2010-01-20 16:58:21 +0000
  # Latest modtime:     2010-01-20 16:48:30 +0000
  # Previous commit:    2010-01-20 16:10:53 +0000
  GIT_AUTHOR_NAME='forsyth' GIT_AUTHOR_EMAIL='forsyth@vitanuova.com' GIT_AUTHOR_DATE='2010-01-20 16:48:30 +0000' \
  GIT_COMMITTER_NAME='forsyth' GIT_COMMITTER_EMAIL='forsyth@vitanuova.com' GIT_COMMITTER_DATE='2010-01-20 16:48:30 +0000' \
  git commit -q -m 'Add fonts' --trailer Source:$source
  cd ..
}

# Inferno 4E Mercurial checkout with Unix executables
inferno-4e-20150328-unix() {
  local repo=inferno-4e-20150328-unix
  local source=https://web.archive.org/web/20150528191909/http://www.vitanuova.com/dist/4e/inferno-20150328.tgz
  unzip_tar $repo inferno $source
  fix_perms $repo
  hg_to_git $repo
  git_verify_is_ancestor $repo
  cd $repo
  git add -Af
  # HTTP Last-Modified: 2015-03-28 11:02:31 +0000
  # Latest modtime:     2015-03-28 10:58:34 +0000
  # Previous commit:    2015-03-28 10:58:16 +0000
  GIT_AUTHOR_NAME='Charles Forsyth' GIT_AUTHOR_EMAIL='charles.forsyth@gmail.com' GIT_AUTHOR_DATE='2015-03-28 10:58:34 +0000' \
  GIT_COMMITTER_NAME='Charles Forsyth' GIT_COMMITTER_EMAIL='charles.forsyth@gmail.com' GIT_COMMITTER_DATE='2015-03-28 10:58:34 +0000' \
  git commit -q -m 'Compile Unix executables' --trailer Source:$source
  cd ..
}

mkdir -p inferno
cd inferno

copy_submodule github.com/inferno-os/inferno-os
section inferno-1e0
section inferno-4e-20070510-unix
section inferno-4e-20091219-win
section inferno-4e-20100120-unix
section inferno-4e-20150328-unix
section inferno-os-hg
wait

for repo in "${repos[@]}"; do
  push_tag "$repo"
done
