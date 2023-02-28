#!/bin/sh -e

mkdir mt19937ar

wget http://www.math.sci.hiroshima-u.ac.jp/m-mat/MT/MT2002/CODES/mt19937ar.tgz
tar xf mt19937ar.tgz -C mt19937ar

cd mt19937ar
git init
git add -A

GIT_AUTHOR_NAME='Makoto Matsumoto' GIT_COMMITTER_NAME='Makoto Matsumoto' \
GIT_AUTHOR_EMAIL='m-mat@math.sci.hiroshima-u.ac.jp' GIT_COMMITTER_EMAIL='m-mat@math.sci.hiroshima-u.ac.jp' \
GIT_AUTHOR_DATE='2004-03-03 00:09:10 UTC' GIT_COMMITTER_DATE='2004-03-03 00:09:10 UTC' \
git commit -m 'Improve initialization'
