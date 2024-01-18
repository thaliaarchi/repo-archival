#!/bin/bash -e

. base.sh

mkdir -p minecraft
cd minecraft
mkdir cuchaz-mappings cuchaz-mappings-hg

# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/cuchaz/minecraft-mappings
# https://bitbucket-archive.softwareheritage.org/projects/cu/cuchaz/minecraft-mappings.html
tar xf "$(get_cached_path https://bitbucket-archive.softwareheritage.org/new-static/c1/c1fd27e7-2e49-4594-91d2-0816b7c5a6dd/c1fd27e7-2e49-4594-91d2-0816b7c5a6dd-repository.tar.gz)" \
  --strip-components=1 \
  -C cuchaz-mappings-hg

cd cuchaz-mappings
git init -q
git config core.ignoreCase false
# https://github.com/frej/fast-export
hg-fast-export -r ../cuchaz-mappings-hg -M main
git checkout -q HEAD

rm -r ../cuchaz-mappings-hg
