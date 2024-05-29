#!/bin/bash -e

. base.sh

export AUTHOR='hogelog <konbu.komuro@gmail.com>'

path="$(submodule_path https://github.com/hogelog/hogel.org-old)"/content/lib/c

mkdir -p wspace
cd wspace

mkdir hogelog-c
cd hogelog-c
git init -q

tar xf "$path/ws_20080502.tar.bz2" --strip-components=1
git add -A
commit latest 'Initial commit

https://github.com/hogelog/hogel.org-old/blob/master/content/lib/c/ws_20080502.tar.bz2'
git rm -qr .

tar xf "$path/ws_20080503.tar.bz2" --strip-components=1
git add -A
commit latest 'Rename wsparse.def to parse.def, enable GNU extensions

https://github.com/hogelog/hogel.org-old/blob/master/content/lib/c/ws_20080503.tar.bz2'

git remote add origin https://github.com/wspace/hogelog-c
