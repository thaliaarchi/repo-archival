#!/bin/bash -e

. base.sh

copy_submodule github.com/Smithers888/BlueSpace wspace/smithers-bluespace
cd wspace/smithers-bluespace

mkdir programs
wget -q https://cpjsmith.uk/downloads/whitespace/99.wsp -P programs
wget -q https://cpjsmith.uk/downloads/whitespace/quine-cs.ws -P programs
wget -q https://cpjsmith.uk/downloads/whitespace/quine-cs.wsa -P programs
wget -q https://cpjsmith.uk/downloads/whitespace/quine-cs-3.ws -P programs
wget -q https://cpjsmith.uk/downloads/whitespace/quine-cs-3.wsa -P programs
wget -q https://cpjsmith.uk/whitespace -O index.html

# Last-Modified in UTC       Last-Modified in BST
# 2014-07-10 18:59:10 +0000  2014-07-10 19:59:10 +0100  quine-cs.ws
# 2014-07-12 21:21:29 +0000  2014-07-12 22:21:29 +0100  99.wsp
# 2014-07-25 17:55:00 +0000  2014-07-25 18:55:00 +0100  quine-cs.wsa
# 2015-06-28 12:34:40 +0000  2015-06-28 13:34:40 +0100  quine-cs-3.ws
# 2015-06-28 12:35:26 +0000  2015-06-28 13:35:26 +0100  quine-cs-3.wsa

# Commits are in GMT/BST

git add programs/*

GIT_AUTHOR_NAME='Chris Smith' GIT_AUTHOR_EMAIL='chrissmithers888@gmail.com' GIT_AUTHOR_DATE='2015-06-28 13:35:26 +0100' \
git commit -q -m 'Add programs from website'

git branch -m master main
git remote set-url origin https://github.com/wspace/smithers-bluespace
