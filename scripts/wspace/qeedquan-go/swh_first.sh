#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p wspace/qeedquan-go
cd wspace/qeedquan-go

# This revision from 2020-04-15 is the earliest snapshot to include
# esolang/whitespace/.
# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://github.com/qeedquan/misc_utilities&timestamp=2020-04-15T14:31:36Z
request_swh https://github.com/qeedquan/misc_utilities bc7397d9a5a12d14232fa63401529d97279b2c11
clone_swh_bare https://github.com/qeedquan/misc_utilities bc7397d9a5a12d14232fa63401529d97279b2c11 swh-first.git
git clone -q swh-first.git swh-first
rm -rf swh-first.git
cd swh-first

git filter-repo --quiet \
  --subdirectory-filter esolang/whitespace \
  --path AUTHORS \
  --path LICENSE

git branch -m master main
git remote add origin https://github.com/wspace/qeedquan-go
