#!/bin/bash -e

. base.sh

mkdir -p minecraft
cd minecraft
mkdir cuchaz-mappings cuchaz-mappings-hg

tar xf "$(get_cached_path https://bitbucket-archive.softwareheritage.org/new-static/c1/c1fd27e7-2e49-4594-91d2-0816b7c5a6dd/c1fd27e7-2e49-4594-91d2-0816b7c5a6dd-repository.tar.gz)" \
  --strip-components=1 \
  -C cuchaz-mappings-hg

cd cuchaz-mappings
git init -q
git config core.ignoreCase false
# https://github.com/frej/fast-export
hg-fast-export -r ../cuchaz-mappings-hg -M main
git checkout HEAD

rm -r ../cuchaz-mappings-hg

git remote add origin https://github.com/thaliaarchi/cuchaz-minecraft-mappings
