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

tar xf "$esofiles/impl/sortle-0.8.2.tar.gz"
git --work-tree sortle-0.8.2 add .
commit '2005-06-04 06:33:27 +0000' 'Sortle 0.8.2'
rm -r sortle-0.8.2

tar xf "$esofiles/impl/sortle-1.0.tar.gz" --strip-components=1
git add .
commit '2005-12-28 00:57:38 +0000' 'Sortle 1.0'
