#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p regexp
cd regexp

clone_submodule https://github.com/msteveb/jimtcl jim
