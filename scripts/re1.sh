#!/bin/bash -e

. base.sh

mkdir re1

# https://code.google.com/archive/p/re1/
unzip -q "$(get_cached_path https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/re1/source-archive.zip)"
mv re1 re1-hg

git init -q re1
cd re1
git config core.ignoreCase false
# https://github.com/frej/fast-export
hg-fast-export -r ../re1-hg -M main
git checkout HEAD

rm -r ../re1-hg
