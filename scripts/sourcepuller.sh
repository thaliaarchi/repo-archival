#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir sourcepuller
cd sourcepuller

# Convert SourcePuller from CVS at https://sourceforge.net/projects/sourcepuller/.
rsync -ai a.cvs.sourceforge.net::cvsroot/sourcepuller/ sourcepuller.cvs
git init -q sourcepuller.git
cd sourcepuller.git
find ../sourcepuller.cvs -name '*,v' |
  cvs-fast-export |
  git fast-import
git checkout -q master
git branch -m master main
