#!/bin/sh -e

git clone https://github.com/EmilBahnsen/projects emilbahnsen-assembler
cd emilbahnsen-assembler
git filter-repo \
  --path README.md \
  --path 'Whitespace assembler' --path-rename 'Whitespace assembler/':
git branch -m master main
git remote add origin https://github.com/wspace/emilbahnsen-assembler
