#!/bin/bash -e

. base.sh

mkdir -p foones
cd foones

# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://github.com/foones/cratylus
# $ curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:92066f375c6363830e7e6f83be36b76cefa8d736/
tar xf ../../swh/github.com/foones/cratylus/swh_1_rev_92066f375c6363830e7e6f83be36b76cefa8d736.git.tar
git clone -q swh:1:rev:92066f375c6363830e7e6f83be36b76cefa8d736.git cratylus-base
rm -rf swh:1:rev:92066f375c6363830e7e6f83be36b76cefa8d736.git

copy_submodule github.com/foones/lenguajes cratylus
cd cratylus
git filter-repo --quiet --subdirectory-filter cratylus

# Rewrite root commit of the filtered lenguajes to have cratylus from SWH as its
# parent. (git filter-repo cannot be used for this, because it would replace the
# root commit, instead of changing its parent.)
git remote add base ../cratylus-base
git fetch -q base
FILTER_BRANCH_SQUELCH_WARNING=1 \
git filter-branch --parent-filter "sed 's/^$/-p $(git rev-parse base/master)/'" master
git remote remove base
rm -rf ../cratylus-base

# Restore the deleted .gitignore
git checkout HEAD~ -- .gitignore
GIT_COMMITTER_NAME="$(git show -s --format=%cn)" GIT_COMMITTER_EMAIL="$(git show -s --format=%ce)" GIT_COMMITTER_DATE="$(git show -s --format=%cd)" \
git commit -q --amend --no-edit

git branch -m master main
git remote add origin https://github.com/thaliaarchi/foones-cratylus
