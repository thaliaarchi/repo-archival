#!/bin/bash -e

. base.sh

mkdir -p foones
cd foones

# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://github.com/foones/eightfold
# $ curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:f46c932ffb7e88346594ca667cc3758ef27a5692/
tar xf ../../swh/github.com/foones/eightfold/swh_1_rev_f46c932ffb7e88346594ca667cc3758ef27a5692.git.tar
git clone -q swh:1:rev:f46c932ffb7e88346594ca667cc3758ef27a5692.git eightfold-base
rm -rf swh:1:rev:f46c932ffb7e88346594ca667cc3758ef27a5692.git

copy_submodule github.com/foones/lenguajes eightfold
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
