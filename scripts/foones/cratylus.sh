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
GIT_COMMITTER_NAME="$(git show -s --format=%cn)" GIT_COMMITTER_EMAIL="$(git show -s --format=%ce)" GIT_COMMITTER_DATE="$(git show -s --format=%ci)" \
git commit -q --amend --no-edit

git branch -m master main
git remote add origin https://github.com/thaliaarchi/foones-cratylus
