#!/bin/bash -e

echo 'Repo https://github.com/RemiGascou/small-projects now offline'
git clone https://github.com/RemiGascou/small-projects remigascou-c
exit

. base.sh
copy_submodule remigascou-c
cd remigascou-c
git filter-repo --quiet --subdirectory-filter C/whitespace
git branch -m master main
git remote add origin https://github.com/wspace/remigascou-c
