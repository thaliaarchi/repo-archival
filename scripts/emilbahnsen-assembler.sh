#!/bin/bash -e

. base.sh
copy_submodule emilbahnsen-assembler
cd emilbahnsen-assembler
git filter-repo \
  --path README.md \
  --path 'Whitespace assembler' --path-rename 'Whitespace assembler/':
git branch -m master main
git remote add origin https://github.com/wspace/emilbahnsen-assembler
