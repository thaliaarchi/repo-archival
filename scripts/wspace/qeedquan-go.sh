#!/bin/bash -e

. base.sh
copy_submodule github.com/qeedquan/misc_utilities wspace/qeedquan-go
cd wspace/qeedquan-go
git filter-repo --quiet \
  --subdirectory-filter esolang/whitespace \
  --path AUTHORS \
  --path LICENSE
git branch -m master main
git remote add origin https://github.com/wspace/qeedquan-go
