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
git clone -q swh:1:rev:f46c932ffb7e88346594ca667cc3758ef27a5692.git eightfold
rm -rf swh:1:rev:f46c932ffb7e88346594ca667cc3758ef27a5692.git

cd eightfold
git branch -m master main
git remote set-url origin https://github.com/thaliaarchi/foones-eightfold
