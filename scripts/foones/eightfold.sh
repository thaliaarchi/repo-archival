#!/bin/bash -e

. base.sh

mkdir -p foones
cd foones

clone_swh https://github.com/foones/eightfold f46c932ffb7e88346594ca667cc3758ef27a5692 eightfold-base
clone_submodule https://github.com/foones/lenguajes eightfold
cd eightfold
git filter-repo --quiet \
  --subdirectory-filter eightfold \
  --replace-message <(echo 'Added Lumpen==>Moved Makefile')

# Graft the earlier history of eightfold from SWH onto the root commit of the
# later history in the filtered lenguajes.
git remote add base ../eightfold-base
git fetch -q base
git replace --graft "$(git rev-list --max-parents=0 HEAD)" base/master
git filter-repo -f --quiet
git remote remove base
rm -rf ../eightfold-base

git branch -m master main
git remote add origin https://github.com/thaliaarchi/foones-eightfold
