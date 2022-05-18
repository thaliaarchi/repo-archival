#!/bin/sh -e

git clone https://github.com/RemiGascou/small-projects remigascou-c
cd remigascou-c
git filter-repo --subdirectory-filter C/whitespace
git branch -m master main
git remote add origin https://github.com/wspace/remigascou-c
