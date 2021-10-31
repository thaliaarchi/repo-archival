#!/bin/sh -e

git clone https://github.com/hostilefork/whitespacers akers-lolcode
cd akers-lolcode
git filter-repo --subdirectory-filter lolcode
git branch -m master main
git remote add origin https://github.com/wspace/akers-lolcode
