#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO: Convert earlier tarball releases.

mkdir -p heirloom
cd heirloom
mkdir heirloom.git

# Convert the Heirloom Project from CVS at https://sourceforge.net/projects/heirloom/.
rsync -ai a.cvs.sourceforge.net::cvsroot/heirloom/ heirloom.cvs
cd heirloom.git
git init -q
find ../heirloom.cvs -name '*,v' |
  cvs-fast-export --authormap <(echo 'gritter = Gunnar Ritter <gunnarr@acm.org>') |
  git fast-import
git checkout -q master
git branch -m master main
