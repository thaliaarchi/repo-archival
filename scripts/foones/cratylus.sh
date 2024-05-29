#!/bin/bash -e

. base.sh

mkdir -p foones
cd foones

clone_swh https://github.com/foones/cratylus 92066f375c6363830e7e6f83be36b76cefa8d736 cratylus-base
clone_submodule https://github.com/foones/lenguajes cratylus
cd cratylus
git filter-repo --quiet --subdirectory-filter cratylus

# Graft the earlier history of cratylus from SWH onto the root commit of the
# later history in the filtered lenguajes.
git remote add base ../cratylus-base
git fetch -q base
git replace --graft "$(git rev-list --max-parents=0 HEAD)" base/master
git filter-repo -f --quiet
git remote remove base
rm -rf ../cratylus-base

# Restore the deleted .gitignore
git checkout HEAD~ -- .gitignore
amend_no_edit

git branch -m master main
git remote add origin https://github.com/thaliaarchi/foones-cratylus
