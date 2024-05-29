#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - https://github.com/graue/sortle
# - https://codeberg.org/graue/sortle-js

mkdir -p sortle
cd sortle
git init -q

esofiles="$(submodule_path https://github.com/graue/esofiles)"/sortle

export AUTHOR='Graue <>'

tar xf "$esofiles/impl/sortle-0.8.2.tar.gz" --strip-components=1
git add .
commit latest 'Sortle 0.8.2'
git rm -qr .

tar xf "$esofiles/impl/sortle-1.0.tar.gz" --strip-components=1
git add .
commit latest 'Sortle 1.0'
