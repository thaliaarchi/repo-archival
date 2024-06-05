#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p regexp
cd regexp

clone_submodule https://github.com/redis/redis
cd redis
# Extract the files containing stringmatch
git filter-repo --quiet \
  --path src/util.c --path src/util.h \
  --path LICENSE.txt
