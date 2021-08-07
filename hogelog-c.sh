#!/bin/sh -e

git clone https://github.com/hogelog/hogel.org-old
git -C hogel.org-old filter-repo --path-glob 'lib/c/ws*' --path-glob 'content/lib/c/ws*' --path-rename lib/c/: --path-rename content/lib/c/:

tar xvf hogel.org-old/ws_20080502.tar.bz2
git -C ws init
git -C ws add -A

GIT_AUTHOR_NAME='hogelog' \
GIT_COMMITTER_NAME='hogelog' \
GIT_AUTHOR_EMAIL='konbu.komuro@gmail.com' \
GIT_COMMITTER_EMAIL='konbu.komuro@gmail.com' \
GIT_AUTHOR_DATE='2008-04-24 18:30:51 +0000 UTC' \
GIT_COMMITTER_DATE='2008-04-24 18:30:51 +0000 UTC' \
git -C ws commit -m 'Initial commit

https://github.com/hogelog/hogel.org-old/blob/master/content/lib/c/ws_20080502.tar.bz2'

mv ws ws_20080502
tar xvf hogel.org-old/ws_20080503.tar.bz2
cp -rp ws_20080502/.git ws/
git -C ws add -A

GIT_AUTHOR_NAME='hogelog' \
GIT_COMMITTER_NAME='hogelog' \
GIT_AUTHOR_EMAIL='konbu.komuro@gmail.com' \
GIT_COMMITTER_EMAIL='konbu.komuro@gmail.com' \
GIT_AUTHOR_DATE='2008-05-02 19:24:43 +0000 UTC' \
GIT_COMMITTER_DATE='2008-05-02 19:24:43 +0000 UTC' \
git -C ws commit -m 'Rename wsparse.def to parse.def, enable GNU extensions

https://github.com/hogelog/hogel.org-old/blob/master/content/lib/c/ws_20080503.tar.bz2'
