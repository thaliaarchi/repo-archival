#!/bin/bash -e

. base.sh
clone_submodule https://github.com/EmilBahnsen/projects wspace/emilbahnsen-assembler
cd wspace/emilbahnsen-assembler
git filter-repo --quiet \
  --path README.md \
  --subdirectory-filter 'Whitespace assembler'
git branch -m master main
git remote add origin https://github.com/wspace/emilbahnsen-assembler
