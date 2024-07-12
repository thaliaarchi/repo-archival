#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

archive="$(submodule_path https://github.com/larsbrinkhoff/emacs-history)"

mkdir gosling-emacs
cd gosling-emacs

convert_cvs() {
  local tar_path="$1" root="$2" repo="$3"
  tar xf "$archive/$tar_path"
  mkdir "$repo"
  cd "$repo"
  git init -q
  find "../$root" -name '*,v' |
    cvs-fast-export |
    git fast-import --quiet
  git checkout -q master
  git branch -m master main
  rm -rf "../$root"
  cd ..
}

convert_cvs reid.org/~brian/misc/gosling-emacs-1999.tar old-gosling-emacs reid-1999
convert_cvs reid.org/~brian/misc/gosling-emacs-2007.tar gosling-emacs     reid
git -C reid filter-repo --quiet --force --path-rename old-RCS/:

cd reid-1999
git remote add reid ../reid
git fetch -q reid
if ! git merge-base --is-ancestor HEAD reid/main; then
  echo "reid-1999 should be a subset of reid" >&2
  exit 1
fi
cd ..
rm -rf reid-1999

tar xf "$archive/der Mouse/gosling-emacs.tar"
git clone -q --no-local gosling-emacs.git der-mouse
git -C der-mouse remote remove origin
rm -rf gosling-emacs.git
