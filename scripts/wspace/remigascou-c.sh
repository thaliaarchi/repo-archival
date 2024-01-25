#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# The repo went offline around 2023-03-02, and it had been tracked here in a
# submodule before then. The revision on SWH in its 2021-06-21 snapshot matches
# the known HEAD of master, so that snapshot almost certainly represents the
# final state of the repo.
# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://github.com/RemiGascou/small-projects
# https://web.archive.org/web/20201025194206/https://github.com/RemiGascou/small-projects

clone_swh https://github.com/RemiGascou/small-projects 9e41f42b2ec3a4cd878dfeefab11c9d583ae99c0 remigascou-c
cd remigascou-c
git filter-repo --quiet --subdirectory-filter C/whitespace

git branch -m master main
git remote add origin https://github.com/wspace/remigascou-c
