#!/bin/bash -e

. base.sh

mkdir -p cybis
cd cybis

# First mention
# 2009-03-03 19:44:31 +0000 Cybis https://stackoverflow.com/questions/607830/use-of-haskell-state-monad-a-code-smell

unzip -q ../../files/cybis/checkouts/HaPyLi.zip
mv HaPyLi hapyli-svn
cd hapyli-svn

# Upgrade format of working copy for newer clients
svn upgrade -q

# Repo metadata:
#
# $ svn info
#
# URL: file:///C:/svn/hapyli/Trunk
# Relative URL: ^/Trunk
# Repository Root: file:///C:/svn/hapyli
# Repository UUID: f8cf23a9-8c7d-2043-a475-f83fdb64c9a1
# Revision: 67
# Node Kind: directory
# Schedule: normal
# Last Changed Author: Kevin1
# Last Changed Rev: 67
# Last Changed Date: 2009-05-09 08:29:10 +0000 (Sat, 09 May 2009)

# File metadata:
#
# $ sqlite3 -json .svn/wc.db 'SELECT * FROM nodes'

# Create a clean directory tree
svn export -q . ../hapyli
cd ../hapyli
git init -q
git config core.autocrlf false

# Convert svn:ignore to .gitignore
#
# $ svn propget svn:ignore -R
#
# . - WSpace
# wspace.exe
#
cp ../../../files/cybis/hapyli/.gitignore .

# SVN working copies have no history, so commit the latest revision
git add -Af
GIT_AUTHOR_NAME='Kevin' GIT_AUTHOR_EMAIL='cybis-fdp@hotmail.com' GIT_AUTHOR_DATE='2009-05-09 08:29:10 +0000' \
GIT_COMMITTER_NAME='Kevin' GIT_COMMITTER_EMAIL='cybis-fdp@hotmail.com' GIT_COMMITTER_DATE='2009-05-09 08:29:10 +0000' \
git commit -q -m 'Revision 67

https://github.com/thaliaarchi/repo-archival/blob/main/files/cybis/checkouts/HaPyLi.zip'

# sudoku.ws
# 2009-05-19 23:53:16.030 +0000 Huf_Lungdung                                      https://what.thedailywtf.com/topic/5980/stupid-coding-tricks-sudoku-solver-in-whitespace
# 2009-05-20 16:30:21 +0000     Huf Lungdung                                      https://pastebin.com/f761fc4b5
# 2009-11-19 22:42:24 +0000     Cybis FDP <cybis-fdp@hotmail.com>, signed "Cybis" https://web.archive.org/web/20141011193156/http://compsoc.dur.ac.uk/archives/whitespace/2009-November/000072.html
get_cached https://pastebin.com/raw/f761fc4b5 sudoku.ws
git add sudoku.ws
GIT_AUTHOR_NAME='Kevin' GIT_AUTHOR_EMAIL='cybis-fdp@hotmail.com' GIT_AUTHOR_DATE='2009-05-19 23:53:16 +0000' \
GIT_COMMITTER_NAME='Kevin' GIT_COMMITTER_EMAIL='cybis-fdp@hotmail.com' GIT_COMMITTER_DATE='2009-05-19 23:53:16 +0000' \
git commit -q -m 'Compile sudoku solver

https://what.thedailywtf.com/topic/5980/stupid-coding-tricks-sudoku-solver-in-whitespace
https://web.archive.org/web/20131109103417/http://compsoc.dur.ac.uk:80/archives/whitespace/2009-November/000072.html
https://pastebin.com/f761fc4b5'

# Public release announcement:
# 2010-05-23 02:20:21 +0000 Cybis FDP <cybis-fdp@hotmail.com> https://web.archive.org/web/20130926170259/http://compsoc.dur.ac.uk:80/archives/whitespace/2010-May/000075.html

# Untracked and ignored files:
# zip modified time        Stat Filename
# 2010-12-18 22:26:06 +0000  ?  99bottles.hpl
# 2010-12-18 22:27:46 +0000  ?  99bottles.ws
# 2015-06-26 02:27:44 +0000  I  WSpace/*
# 2009-05-20 03:57:48 +0000  ?  hosting.txt
# 2009-05-10 07:44:54 +0000  I  hwc/*.pyc
# 2009-04-28 05:21:52 +0000  I  wspace.exe

cp -p ../hapyli-svn/99bottles.{hpl,ws} .
git add 99bottles.{hpl,ws}
GIT_AUTHOR_NAME='Marinus Oosters' GIT_AUTHOR_EMAIL='marinuso@gmail.com' GIT_AUTHOR_DATE='2010-11-27 00:00:00 +0000' \
GIT_COMMITTER_NAME='Kevin' GIT_COMMITTER_EMAIL='cybis-fdp@hotmail.com' GIT_COMMITTER_DATE='2010-12-18 22:27:46 +0000' \
git commit -q -m 'Add 99 bottles of beer in HaPyLi

https://www.99-bottles-of-beer.net/language-hapyli-2556.html'

# 2010-11-27 Marinus Oosters https://www.99-bottles-of-beer.net/language-hapyli-2556.html
diff 99bottles.hpl "$(get_cached_path https://www.99-bottles-of-beer.net/download/2556)"

# 2010-12-01 07:54 Marinus https://esolangs.org/w/index.php?title=User:Marinus/Brainfuck_interpreters&diff=20310&oldid=18866
# Marinus appears to live in CET +0100 / CEST +0200 based on commits from https://github.com/marinuso
cp ../../../files/cybis/hapyli/brainfuck.hpl .
git add brainfuck.hpl # manually extracted from wiki
GIT_AUTHOR_NAME='Marinus Oosters' GIT_AUTHOR_EMAIL='marinuso@gmail.com' GIT_AUTHOR_DATE='2010-12-01 08:54:00 +0100' \
GIT_COMMITTER_NAME='Marinus Oosters' GIT_COMMITTER_EMAIL='marinuso@gmail.com' GIT_COMMITTER_DATE='2010-12-01 08:54:00 +0100' \
git commit -q -m 'Add Brainfuck interpreter in HaPyLi

https://esolangs.org/wiki/User:Marinus/Brainfuck_interpreters#HaPyLi'

# Apply the differences from the Webs site to the local tutorial, as if it was
# not mangled by the site builder tool.
#
# HTTP Date                  URL                                                                                           Path
# 2011-02-12 01:57:25 +0000  https://web.archive.org/web/20110212015726/http://hapyli.webs.com:80/                         Tutorials/web/index.html
# 2011-02-13 10:22:00 +0000  https://web.archive.org/web/20110213102200/http://hapyli.webs.com:80/functions.htm            Tutorials/web/Functions.html
# 2011-02-13 17:20:27 +0000  https://web.archive.org/web/20110213172035/http://hapyli.webs.com:80/apps/forums/
# 2011-02-17 14:57:28 +0000  https://web.archive.org/web/20110217145734/http://hapyli.webs.com:80/examples.htm             Tutorials/web/Examples.html
# 2011-02-19 13:27:10 +0000  https://web.archive.org/web/20110219132710/http://hapyli.webs.com:80/expressions.htm          Tutorials/web/Expressions.html
# 2011-02-19 15:50:17 +0000  https://web.archive.org/web/20110219155019/http://hapyli.webs.com:80/variablesandtheheap.htm  Tutorials/web/Variables.html
# 2011-02-19 16:25:25 +0000  https://web.archive.org/web/20110219162526/http://hapyli.webs.com:80/embeddingwhitespace.htm  Tutorials/web/Assembler.html
# 2012-07-12 02:48:54 +0000  https://web.archive.org/web/20120712024855/http://hapyli.webs.com:80/apps/forums/
cp -R ../../../files/cybis/hapyli/Tutorials/web/*.html Tutorials/web/
git add Tutorials/web
GIT_AUTHOR_NAME='Kevin' GIT_AUTHOR_EMAIL='cybis-fdp@hotmail.com' GIT_AUTHOR_DATE='2010-05-23 02:20:21 +0000' \
GIT_COMMITTER_NAME='Kevin' GIT_COMMITTER_EMAIL='cybis-fdp@hotmail.com' GIT_COMMITTER_DATE='2011-02-12 01:57:25 +0000' \
git commit -q -m 'Release publicly

https://web.archive.org/web/20110212015726/http://hapyli.webs.com:80/
https://web.archive.org/web/20130926170259/http://compsoc.dur.ac.uk:80/archives/whitespace/2010-May/000075.html'

rm -rf ../hapyli-svn

git remote add origin https://github.com/wspace/cybis-hapyli
