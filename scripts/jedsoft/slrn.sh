#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p jedsoft
cd jedsoft
mkdir slrn
cd slrn

# Convert slrn from CVS at https://sourceforge.net/projects/slrn/.
rsync -ai a.cvs.sourceforge.net::cvsroot/slrn/ slrn.cvs
git init -q slrn.git
cd slrn.git
find ../slrn.cvs -name '*,v' |
  cvs-fast-export |
  git fast-import
git checkout -q master
git branch -m master main
