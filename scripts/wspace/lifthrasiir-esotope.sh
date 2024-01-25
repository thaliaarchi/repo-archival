#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace
mkdir lifthrasiir-esotope

# https://bitbucket-archive.softwareheritage.org/projects/li/lifthrasiir/esotope-esotope.html
# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/lifthrasiir/esotope-esotope
# https://web.archive.org/web/20181210223811/https://bitbucket.org/lifthrasiir/esotope-esotope/
# Directory snapshot: https://web.archive.org/web/20200622005938/https://bitbucket.org/lifthrasiir/esotope-esotope/get/2a3f6489a176.zip

tar xf "$(get_cached_path https://bitbucket-archive.softwareheritage.org/new-static/7e/7ed183a2-b47b-419e-80f8-ae1d222cf866/7ed183a2-b47b-419e-80f8-ae1d222cf866-repository.tar.gz)" \
  --strip-components=1 \
  -C lifthrasiir-esotope
hg_to_git lifthrasiir-esotope
cd lifthrasiir-esotope

git filter-repo -f --quiet \
  --path-rename .hgignore:.gitignore \
  --replace-text <(echo 'regex:syntax: glob\n==>')

git remote add origin https://github.com/wspace/lifthrasiir-esotope
