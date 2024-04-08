#!/bin/bash -e

. base.sh

mkdir -p minecraft
cd minecraft

# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://github.com/immibis/bearded-octo-nemesis&timestamp=2023-07-19T12:36:22Z
clone_swh https://github.com/immibis/bearded-octo-nemesis 4bad7b29ac2a05572feb07d99d47bd790d36d0d2 immibis-bearded-octo-nemesis
