#!/bin/bash -e

. base.sh
copy_submodule github.com/hostilefork/whitespacers wspace/akers-lolcode
cd wspace/akers-lolcode
git filter-repo --quiet --subdirectory-filter lolcode
git branch -m master main
git remote add origin https://github.com/wspace/akers-lolcode
