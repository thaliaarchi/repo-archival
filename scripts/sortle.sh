#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - https://github.com/graue/sortle
# - https://codeberg.org/graue/sortle-js
# - http://www.oceanbase.org/graue/sortle/

mkdir sortle
cd sortle
git init -q

esofiles="$(submodule_path https://github.com/graue/esofiles)"/sortle

export AUTHOR='Graue <graue@oceanbase.org>'

tar xf "$esofiles/impl/sortle-0.8.2.tar.gz" --strip-components=1
git add .
commit latest 'Sortle 0.8.2' --trailer=Source:https://github.com/graue/esofiles/blob/master/sortle/impl/sortle-0.8.2.tar.gz
git rm -qr .

tar xf "$esofiles/impl/sortle-1.0.tar.gz" --strip-components=1
git add .
commit latest 'Sortle 1.0' --trailer=Source:https://github.com/graue/esofiles/blob/master/sortle/impl/sortle-1.0.tar.gz

clone_submodule https://github.com/graue/esofiles
cd esofiles
git filter-repo \
  --path README.md \
  --path sortle \
  --path-rename sortle/doc/: \
  --path-rename sortle/impl/: \
  --path-rename sortle/src/: \
  --path-rename sortle/:
git filter-repo --path-glob '*.tar.gz' --invert-paths
cd ..

clone_submodule https://github.com/graue/sortle
