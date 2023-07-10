#!/bin/bash -e

. base.sh

mkdir -p foones
cd foones

# The repo was saved on the Software Heritage archive
# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://github.com/foones/eightfold
#
# To request a cooked git-bare archive for the latest revision on master:
# $ curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:f46c932ffb7e88346594ca667cc3758ef27a5692/
# (API docs: https://archive.softwareheritage.org/api/1/vault/git-bare/doc/)

tar xf ../../swh/github.com/foones/eightfold/swh_1_rev_f46c932ffb7e88346594ca667cc3758ef27a5692.git.tar
git clone -q swh:1:rev:f46c932ffb7e88346594ca667cc3758ef27a5692.git eightfold-base
rm -rf swh:1:rev:f46c932ffb7e88346594ca667cc3758ef27a5692.git

copy_submodule github.com/foones/lenguajes eightfold
cd eightfold
git filter-repo --quiet \
  --subdirectory-filter eightfold \
  --replace-message <(echo 'Added Lumpen==>Moved Makefile')

# Rewrite root commit of the filtered lenguajes to have eightfold from SWH as
# its parent. (git filter-repo cannot be used for this, because it would replace
# the root commit, instead of changing its parent.)
git remote add base ../eightfold-base
git fetch -q base
FILTER_BRANCH_SQUELCH_WARNING=1 \
git filter-branch --parent-filter "sed 's/^$/-p $(git rev-parse base/master)/'" master
git remote remove base
rm -rf ../eightfold-base

git branch -m master main
git remote add origin https://github.com/thaliaarchi/foones-eightfold
