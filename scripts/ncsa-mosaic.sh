#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - Make a more granular history.
# - http://seanm.ca/mosaic/ links to mosaic.patch by Alan Wylie, but it was
#   not archived. alandipert/ncsa-mosaic references work by Alan Wylie, which
#   might be this.

clone_submodule https://github.com/alandipert/ncsa-mosaic
cd ncsa-mosaic
git checkout -q --orphan source
git rm -qrf .

# Attribution adapted from license headers:
#   NCSA Mosaic for the X Window System
#   Software Development Group
#   National Center for Supercomputing Applications
#   University of Illinois at Urbana-Champaign
#   605 E. Springfield, Champaign IL 61820
#   mosaic@ncsa.uiuc.edu

tar xf "$(get_cached_path https://web.archive.org/web/20120915154245/http://magma.ca/~smaclennan/stuff/Mosaic-2.7b6.tar.gz)" --strip-components=1
git add -A
commit 'NCSA Mosaic Software Development Group <mosaic@ncsa.uiuc.edu> latest' 'NCSA Mosaic 2.7b6' \
  --trailer=Source:https://web.archive.org/web/20120915154245/http://seanm.ca/mosaic/ \
  --trailer=Source:https://web.archive.org/web/20120404182648/http://magma.ca/~smaclennan/stuff/Mosaic-2.7b6.tar.gz

git checkout -q master
git replace --graft "$(git rev-list --max-parents=0 HEAD)" source
git filter-repo --force --quiet
git branch -qd source
