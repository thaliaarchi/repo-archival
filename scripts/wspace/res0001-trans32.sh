#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace
mkdir res0001-trans32
cd res0001-trans32

# https://web.archive.org/web/20130510111931/https://sites.google.com/site/res0001/whitespace/programs
# christmas_tree.ws  2k  r.e.s.  2012-03-27 16:08  v.1
# hello.ws           0k  r.e.s.  2012-03-27 16:07  v.1
# trans32.py         2k  r.e.s.  2012-05-30 15:12  v.1

git init -q
cp -p ../../../files/wspace/res0001-trans32/trans32.py .
git add trans32.py
GIT_AUTHOR_DATE='2012-05-30 15:12 +0000' GIT_COMMITTER_DATE='2012-05-30 15:12 +0000' \
git -c user.name='r.e.s.' -c user.email='r.e.s.0001@gmail.com' commit -q -m 'Upload trans32.py'

git remote add origin https://github.com/wspace/res0001-trans32
