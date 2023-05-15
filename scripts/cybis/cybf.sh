#!/bin/bash -e

. base.sh

mkdir -p cybis
cd cybis
mkdir cybf
cd cybf
git init -q

# TODO convert SVN repo

# Sudoku.bf
# 2017-05-26 19:06:04.327867507 +0000 Huf_Lungdung 1495829695493-sudoku.7z/Sudoku.bf
# 2017-05-26 20:14:55 +0000           Huf_Lungdung https://what.thedailywtf.com/assets/uploads/files/1495829695493-sudoku.7z
# 2017-05-26 20:34:53.111 +0000       Huf_Lungdung https://what.thedailywtf.com/topic/23006/stupid-coding-tricks-sudoku-solver-in-brainfuck
# Timestamp less accurate with `7z`; use The Unarchiver
7z x "$(get_cached_path https://what.thedailywtf.com/assets/uploads/files/1495829695493-sudoku.7z)"
mv Sudoku.bf sudoku.bf
git add sudoku.bf
GIT_AUTHOR_NAME='Kevin Gundlach' GIT_AUTHOR_EMAIL='cybis-fdp@hotmail.com' GIT_AUTHOR_DATE='2017-05-26 19:06:04 +0000' \
GIT_COMMITTER_NAME='Kevin Gundlach' GIT_COMMITTER_EMAIL='cybis-fdp@hotmail.com' GIT_COMMITTER_DATE='2017-05-26 19:06:04 +0000' \
git commit -q -m 'Add sudoku solver in Brainfuck

https://what.thedailywtf.com/topic/23006/stupid-coding-tricks-sudoku-solver-in-brainfuck'
