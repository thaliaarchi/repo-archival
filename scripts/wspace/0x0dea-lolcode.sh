#!/bin/bash -e

. base.sh
clone_submodule https://github.com/hostilefork/whitespacers wspace/0x0dea-lolcode
cd wspace/0x0dea-lolcode
git filter-repo --quiet --subdirectory-filter lolcode
git branch -m master main
git remote add origin https://github.com/wspace/0x0dea-lolcode
