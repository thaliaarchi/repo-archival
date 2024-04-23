#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir trn
cd trn

# Convert trn from CVS at https://sourceforge.net/projects/trn/.
rsync -ai a.cvs.sourceforge.net::cvsroot/trn/ trn.cvs
git init -q trn.git
cd trn.git
find ../trn.cvs -name '*,v' |
  cvs-fast-export |
  git fast-import
git checkout -q master
git branch -m master main
