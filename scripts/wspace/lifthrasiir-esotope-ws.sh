#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# A directory snapshot was saved on BitBucket:
# https://web.archive.org/web/20200622105820/https://bitbucket.org/lifthrasiir/esotope-ws/get/51fb8e8aed54.zip
#
# esotope-ws within was last modified 2004-12-07 15:00:00 +0000

# The repo was saved on the Software Heritage archive
# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/lifthrasiir/esotope-ws
#
# To request a cooked git-bare archive for the latest revision on master:
# $ curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:c52fda8bec0d3d686e3ea670dcb90fa42540c4de/
# (API docs: https://archive.softwareheritage.org/api/1/vault/git-bare/doc/)
#
# To get the time zone offset, in seconds west of UTC, from the Mercurial commit
# metadata:
# $ curl https://archive.softwareheritage.org/api/1/revision/c52fda8bec0d3d686e3ea670dcb90fa42540c4de/ |
#     jq -r '.extra_headers[] | select(.[0] == "time_offset_seconds") | .[1]'
# -32400

tar xf ../../files/wspace/lifthrasiir-esotope-ws/swh_1_rev_c52fda8bec0d3d686e3ea670dcb90fa42540c4de.git.tar
git clone swh:1:rev:c52fda8bec0d3d686e3ea670dcb90fa42540c4de.git lifthrasiir-esotope-ws
rm -rf swh:1:rev:c52fda8bec0d3d686e3ea670dcb90fa42540c4de.git

cd lifthrasiir-esotope-ws

# Adjust UTC times to +0900
git filter-repo --quiet \
  --commit-callback '
    commit.author_date = re.sub(br"\+0000", b"+0900", commit.author_date)
    commit.committer_date = re.sub(br"\+0000", b"+0900", commit.committer_date)'

git branch -m master main

git remote add origin https://github.com/wspace/lifthrasiir-esotope-ws
