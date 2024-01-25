#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace
mkdir lifthrasiir-esotope-ws

# https://bitbucket-archive.softwareheritage.org/projects/li/lifthrasiir/esotope-ws.html
# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/lifthrasiir/esotope-ws
# https://web.archive.org/web/20181210224409/https://bitbucket.org/lifthrasiir/esotope-ws/
# Directory snapshot: https://web.archive.org/web/20200622105820/https://bitbucket.org/lifthrasiir/esotope-ws/get/51fb8e8aed54.zip

tar xf "$(get_cached_path https://bitbucket-archive.softwareheritage.org/new-static/f3/f3775dda-be5a-4b13-b1c2-4dac14af3bb6/f3775dda-be5a-4b13-b1c2-4dac14af3bb6-repository.tar.gz)" \
  --strip-components=1 \
  -C lifthrasiir-esotope-ws
hg_to_git lifthrasiir-esotope-ws

cd lifthrasiir-esotope-ws
git remote add origin https://github.com/wspace/lifthrasiir-esotope-ws
