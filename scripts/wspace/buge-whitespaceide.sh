#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p wspace
cd wspace
mkdir buge-whitespaceide
cd buge-whitespaceide

# https://sourceforge.net/projects/whitespaceide/
rsync -ai a.cvs.sourceforge.net::cvsroot/whitespaceide/ whitespaceide.cvs
git init -q whitespaceide.git
cd whitespaceide.git
find ../whitespaceide.cvs -name '*,v' |
  cvs-fast-export |
  git fast-import
git filter-repo --force --mailmap <(echo '
Philipp Bunge <buge@users.sourceforge.net> buge <buge>')
git checkout -q master

git branch -m master main
git remote add origin https://github.com/wspace/buge-whitespaceide
