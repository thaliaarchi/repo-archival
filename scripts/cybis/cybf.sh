#!/bin/bash -e

. base.sh

commit() {
  GIT_AUTHOR_NAME='Kevin' GIT_AUTHOR_EMAIL='cybis-fdp@hotmail.com' GIT_AUTHOR_DATE="$1" \
  GIT_COMMITTER_NAME='Kevin' GIT_COMMITTER_EMAIL='cybis-fdp@hotmail.com' GIT_COMMITTER_DATE="$1" \
  git commit -q -m "$2"
}

mkdir -p cybis
cd cybis

unzip -q ../../files/cybis/checkouts/CyBF.zip
mv CyBF cybf-svn
cd cybf-svn

# Repo metadata:
#
# $ svn info
# URL: file:///C:/svn/CyBF
# Relative URL: ^/
# Repository Root: file:///C:/svn/CyBF
# Repository UUID: c9d10fbd-33ba-bc4d-a72f-f4d6a9f61016
# Revision: 60
# Node Kind: directory
# Schedule: normal
# Last Changed Author: Kevin
# Last Changed Rev: 60
# Last Changed Date: 2017-05-19 08:28:52 +0000 (Fri, 19 May 2017)

# Create a clean directory tree
svn export -q . ../cybf
cd ../cybf
git init -q
git config core.autocrlf false

# Convert svn:ignore to .gitignore
#
# $ svn propget svn:ignore -R
#
# CyBF - .vs
# Notes
# bin
# obj
#
cp ../../../files/cybis/cybf/CyBF/.gitignore CyBF/

# SVN working copies have no history, so commit the latest revision
git add -Af
commit '2017-05-19 08:28:52 +0000' 'Revision 60

https://github.com/thaliaarchi/repo-archival/blob/main/files/cybis/checkouts/CyBF.zip'

# Untracked and ignored files:
# zip modified time                Stat Filename
# 2020-12-03 04:59:41.6404838 +0000  I  CyBF/.vs/*
# 2017-05-24 19:21:23.8607907 +0000  I  CyBF/Notes/API Notes.txt
# 2019-07-11 18:22:50.6659512 +0000  I  CyBF/Notes/Model Notes.txt
# 2019-06-28 14:09:37.8590063 +0000  I  CyBF/Notes/Recursion.txt
# 2017-05-26 16:24:04.3965753 +0000  I  CyBF/Notes/Sudoku Notes.txt
# 2020-12-03 04:59:41.8873414 +0000  I  CyBF/bin/*
# 2017-05-24 02:21:50.7530955 +0000  I  CyBF/bin/Debug/Program/ASM_code.txt
# 2017-05-24 02:21:50.7468454 +0000  I  CyBF/bin/Debug/Program/BFIL_code.txt
# 2017-05-24 02:21:50.7468454 +0000  I  CyBF/bin/Debug/Program/code.txt
# 2017-05-24 02:22:18.1392664 +0000  I  CyBF/bin/Debug/Program/Main.cbf
# 2020-12-03 04:59:41.9457248 +0000  I  CyBF/obj/*
# 2017-05-28 01:34:10.3490961 +0000  ?  CyBF Library/ASM_output.txt
# 2017-05-28 01:34:10.2728449 +0000  ?  CyBF Library/BFIL_output.txt
# 2017-05-26 19:16:08.8186862 +0000  ?  CyBF Library/Sudoku.7z
# 2017-05-26 19:06:04.3278666 +0000  ?  CyBF Library/Sudoku.bf
# 2017-05-26 20:31:50.0163044 +0000  ?  CyBF Library/Sudoku.py
# 2017-05-26 20:30:53.7985542 +0000  ?  CyBF Library/bfc.py
# 2017-05-28 01:34:10.2815950 +0000  ?  CyBF Library/output.txt

cp -Rp ../cybf-svn/CyBF/Notes CyBF/
git add -f 'CyBF/Notes/API Notes.txt'
commit '2017-05-24 19:21:23 +0000' 'Add API notes'
git add -f 'CyBF/Notes/Sudoku Notes.txt'
commit '2017-05-26 16:24:04 +0000' 'Add sudoku notes'

# Sudoku.bf
# zip last modified   2017-05-26 19:06:04.3278666 +0000                  CyBF Library/Sudoku.bf
# 7z last modified    2017-05-26 19:06:04.327867507 +0000                Sudoku.7z/Sudoku.bf
# zip last modified   2017-05-26 19:16:08.8186862 +0000                  CyBF Library/Sudoku.7z
# HTTP Last-Modified  2017-05-26 20:14:55 +0000                          https://what.thedailywtf.com/assets/uploads/files/1495829695493-sudoku.7z
# Posted              2017-05-26 20:34:53.111 +0000        Huf_Lungdung  https://what.thedailywtf.com/topic/23006/stupid-coding-tricks-sudoku-solver-in-brainfuck
cmp '../cybf-svn/CyBF Library/Sudoku.7z' "$(get_cached_path https://what.thedailywtf.com/assets/uploads/files/1495829695493-sudoku.7z)"
7z x '../cybf-svn/CyBF Library/Sudoku.7z'
cmp '../cybf-svn/CyBF Library/Sudoku.bf' Sudoku.bf
mv Sudoku.bf 'CyBF Library/'
git add 'CyBF Library/Sudoku.bf'
commit '2017-05-26 19:06:04 +0000' 'Compile sudoku solver to Brainfuck

https://what.thedailywtf.com/topic/23006/stupid-coding-tricks-sudoku-solver-in-brainfuck'

cp -p '../cybf-svn/CyBF Library/Sudoku.py' 'CyBF Library'
git add 'CyBF Library/Sudoku.py'
commit '2017-05-26 20:31:50 +0000' 'Compile sudoku solver to Python'

git add -f 'CyBF/Notes/Recursion.txt'
commit '2019-06-28 14:09:37 +0000' 'Add recursion notes'
# Model Notes.txt is empty

rm -rf ../cybf-svn

git remote add origin https://github.com/thaliaarchi/cybf-archive
