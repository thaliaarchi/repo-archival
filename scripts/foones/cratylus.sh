#!/bin/bash -e

. base.sh

mkdir -p foones
cd foones

# The repo was saved on the Software Heritage archive
# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://github.com/foones/cratylus
#
# To request a cooked git-bare archive for the latest revision on master:
# $ curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:92066f375c6363830e7e6f83be36b76cefa8d736/
# (API docs: https://archive.softwareheritage.org/api/1/vault/git-bare/doc/)

tar xf ../../swh/github.com/foones/cratylus/swh_1_rev_92066f375c6363830e7e6f83be36b76cefa8d736.git.tar
git clone -q swh:1:rev:92066f375c6363830e7e6f83be36b76cefa8d736.git cratylus
rm -rf swh:1:rev:92066f375c6363830e7e6f83be36b76cefa8d736.git

cd cratylus
git branch -m master main
git remote set-url origin https://github.com/thaliaarchi/foones-cratylus
