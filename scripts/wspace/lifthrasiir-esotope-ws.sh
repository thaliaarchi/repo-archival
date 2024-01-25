#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# The full Mercurial repo was saved on the SWH:
# https://bitbucket-archive.softwareheritage.org/projects/li/lifthrasiir/esotope-ws.html

# A directory snapshot was saved on BitBucket:
# https://web.archive.org/web/20200622105820/https://bitbucket.org/lifthrasiir/esotope-ws/get/51fb8e8aed54.zip
#
# esotope-ws within was last modified 2004-12-07 15:00:00 +0000

# To get the time zone offset, in seconds west of UTC, from the Mercurial commit
# metadata:
# $ curl https://archive.softwareheritage.org/api/1/revision/c52fda8bec0d3d686e3ea670dcb90fa42540c4de/ |
#     jq -r '.extra_headers[] | select(.[0] == "time_offset_seconds") | .[1]'
# -32400

clone_swh https://bitbucket.org/lifthrasiir/esotope-ws c52fda8bec0d3d686e3ea670dcb90fa42540c4de lifthrasiir-esotope-ws
cd lifthrasiir-esotope-ws

# Adjust UTC times to +0900
git filter-repo --quiet \
  --message-callback 'return re.sub(br"\n*$", b"\n", message)' \
  --commit-callback '
    commit.author_date = re.sub(br"\+0000", b"+0900", commit.author_date)
    commit.committer_date = re.sub(br"\+0000", b"+0900", commit.committer_date)'

git branch -m master main

git remote add origin https://github.com/wspace/lifthrasiir-esotope-ws
