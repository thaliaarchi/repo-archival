#!/bin/bash -e

. base.sh
copy_submodule emilbahnsen-assembler
cd emilbahnsen-assembler
git filter-repo --quiet \
  --path README.md \
  --subdirectory-filter 'Whitespace assembler'
git branch -m master main
git remote add origin https://github.com/wspace/emilbahnsen-assembler
