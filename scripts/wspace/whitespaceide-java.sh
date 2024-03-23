#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p wspace
cd wspace
mkdir whitespaceide-java
cd whitespaceide-java

# https://sourceforge.net/projects/whitespaceide/
rsync -ai a.cvs.sourceforge.net::cvsroot/whitespaceide/ whitespaceide.cvs
git init -q whitespaceide.git
cd whitespaceide.git
find ../whitespaceide.cvs -name '*,v' |
  cvs-fast-export |
  git fast-import
git checkout -q master
git branch -m master main
