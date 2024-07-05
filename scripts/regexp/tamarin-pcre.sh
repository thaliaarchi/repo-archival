#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

if [[ ! -d tamarin-redux ]]; then
  echo 'scripts/tamarin-redux.sh must be run first' >&2
  exit 1
fi

mkdir -p regexp
cd regexp

git clone -q --no-local ../tamarin-redux tamarin-pcre
cd tamarin-pcre
# TODO: Link to source Mercurial commits.
git filter-repo --quiet \
  --path LICENSE --path-rename LICENSE:LICENSE.tamarin \
  --path pcre --path-rename pcre/:

# Last-Modified              URL
# 2006-12-07 07:14:34 +0000  https://sourceforge.net/projects/pcre/files/pcre/6.4/pcre-6.4.tar.gz/download
# 2006-12-07 07:14:35 +0000  https://sourceforge.net/projects/pcre/files/pcre/6.4/pcre-6.4.tar.bz2/download

git checkout -q --orphan pcre-6.4
git rm -qrf .
commit_archive 'Philip.Hazel <Philip.Hazel@gmail.com> latest' 'Release PCRE 6.4' \
  https://sourceforge.net/projects/pcre/files/pcre/6.4/pcre-6.4.tar.bz2/download

git checkout -q main
git replace --graft "$(git rev-list --max-parents=0 HEAD)" pcre-6.4
git filter-repo --quiet --force
git branch -qd pcre-6.4
