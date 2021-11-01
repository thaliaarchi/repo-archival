#!/bin/sh -e

wget https://files.pythonhosted.org/packages/76/aa/ee00fea23bfc7abcbce61e8e52896758277d330c129624746385281e7b13/whiteplanes-0.0.1.tar.gz
tar xvf whiteplanes-0.0.1.tar.gz
mv whiteplanes-0.0.1 nutcrack-whiteplanes
cd nutcrack-whiteplanes
# rm -r whiteplanes.egg-info PKG-INFO setup.cfg

git init
git add src test setup.py

GIT_AUTHOR_NAME='Takuya Katsurada' GIT_AUTHOR_EMAIL='mail@nutcrack.io' GIT_AUTHOR_DATE='2016-05-14 13:54:09 +0000 UTC' \
GIT_COMMITTER_NAME='Takuya Katsurada' GIT_COMMITTER_EMAIL='mail@nutcrack.io' GIT_COMMITTER_DATE='2016-05-14 13:54:09 +0000 UTC' \
git commit -m 'Whiteplanes version 0.0.1

https://pypi.org/project/whiteplanes/'

git remote add origin https://github.com/wspace/nutcrack-whiteplanes
