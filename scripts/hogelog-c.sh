#!/bin/bash -e

. base.sh

copy_submodule hogelog-c hogel.org-old
git -C hogel.org-old filter-repo --quiet \
  --path-glob 'content/lib/c/ws*' --path-rename content/lib/c/:

tar xf hogel.org-old/ws_20080502.tar.bz2
mv ws ws_20080502
git init -q ws_20080502
git -C ws_20080502 add -A

GIT_AUTHOR_NAME='hogelog' GIT_AUTHOR_EMAIL='konbu.komuro@gmail.com' GIT_AUTHOR_DATE='2008-04-24 18:30:51 +0000 UTC' \
GIT_COMMITTER_NAME='hogelog' GIT_COMMITTER_EMAIL='konbu.komuro@gmail.com' GIT_COMMITTER_DATE='2008-04-24 18:30:51 +0000 UTC' \
git -C ws_20080502 commit -q -m 'Initial commit

https://github.com/hogelog/hogel.org-old/blob/master/content/lib/c/ws_20080502.tar.bz2'

tar xf hogel.org-old/ws_20080503.tar.bz2
mv ws hogelog-c
mv ws_20080502/.git hogelog-c/
git -C hogelog-c add -A

GIT_AUTHOR_NAME='hogelog' GIT_AUTHOR_EMAIL='konbu.komuro@gmail.com' GIT_AUTHOR_DATE='2008-05-02 19:24:43 +0000 UTC' \
GIT_COMMITTER_NAME='hogelog' GIT_COMMITTER_EMAIL='konbu.komuro@gmail.com' GIT_COMMITTER_DATE='2008-05-02 19:24:43 +0000 UTC' \
git -C hogelog-c commit -q -m 'Rename wsparse.def to parse.def, enable GNU extensions

https://github.com/hogelog/hogel.org-old/blob/master/content/lib/c/ws_20080503.tar.bz2'

rm -rf hogel.org-old ws_20080502
git -C hogelog-c remote add origin https://github.com/wspace/hogelog-c
