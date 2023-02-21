#!/bin/bash -e

. base.sh

mkdir re1

# https://code.google.com/archive/p/re1/
wget -q https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/re1/source-archive.zip -O re1.zip
unzip -q re1.zip
mv re1 re1-hg

git init re1
cd re1
git config core.ignoreCase false
# https://github.com/frej/fast-export
hg-fast-export -r ../re1-hg -M main
git checkout HEAD

rm -r ../re1-hg
