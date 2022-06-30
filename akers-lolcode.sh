#!/bin/bash -e

. base.sh
copy_submodule hostilefork-whitespacers akers-lolcode
cd akers-lolcode
git filter-repo --subdirectory-filter lolcode
git branch -m master main
git remote add origin https://github.com/wspace/akers-lolcode
