#!/bin/bash -e

. base.sh
copy_submodule remigascou-c
cd remigascou-c
git filter-repo --quiet --subdirectory-filter C/whitespace
git branch -m master main
git remote add origin https://github.com/wspace/remigascou-c
