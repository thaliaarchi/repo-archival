#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

if [[ ! -d lwall/rn ]]; then
  echo 'scripts/lwall/rn.sh must be run first' >&2
  exit 1
fi

mkdir shar
cd shar

git clone -q --no-local ../lwall/rn
git -C rn filter-repo --quiet \
  --path makedist --path manifake --path kitlists.c \
  --path makekit --path kitleader --path kittrailer
