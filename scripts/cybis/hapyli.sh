#!/bin/bash -e

. base.sh

CYBIS_NAME='Cybis'
CYBIS_EMAIL='cybis-fdp@hotmail.com'
CYBIS="$CYBIS_NAME <$CYBIS_EMAIL>"
MARINUS='Marinus Oosters <marinuso@gmail.com>'
export AUTHOR="$CYBIS"

mkdir -p cybis
cd cybis

# SVN repo
unzip -q ../../files/cybis/repos/Hapyli.zip
mv Hapyli hapyli-svn
svnadmin upgrade hapyli-svn

# SVN checkout
unzip -q ../../files/cybis/checkouts/HaPyLi.zip
mv HaPyLi hapyli-svn-checkout
svn upgrade -q hapyli-svn-checkout
svn relocate "file://$(pwd)/hapyli-svn/Trunk" hapyli-svn-checkout

# git conversion
git svn clone "file://$(pwd)/hapyli-svn" hapyli \
  --trunk=Trunk --branches=Branches \
  --authors-file=<(echo "Kevin1 = $CYBIS")
cd hapyli

# Convert svn:ignore to .gitignore
# TODO convert .gitignore for all revisions
git svn create-ignore
find . -name .gitignore -exec unix2dos -q {} \;
git add '*.gitignore'
amend_no_edit

# Reformat git-svn metadata
git filter-repo -f --quiet \
  --message-callback '
    message = re.sub(br"^([\s\S]*?)\n*git-svn-id: .*@(\d+) f8cf23a9-8c7d-2043-a475-f83fdb64c9a1\n$", br"[r\2] \1\n", message)
    message = re.sub(br"^(\[r\d+\])\s+$", br"\1\n", message)
    return message'

# Delete superfluous branches:
# main is identical to trunk
# V2 was renamed to v1.1 in r26
# v1.0 subsumes and changes nothing from v1.0@27
git branch -q -D trunk V2 v1.0@27

# For rebase
git config user.name "$CYBIS_NAME"
git config user.email "$CYBIS_EMAIL"

# sudoku.ws
# 2009-05-19 23:53:16.030 +0000 Huf_Lungdung                                      https://what.thedailywtf.com/topic/5980/stupid-coding-tricks-sudoku-solver-in-whitespace
# 2009-05-20 16:30:21 +0000     Huf Lungdung                                      https://pastebin.com/f761fc4b5
# 2009-11-19 22:42:24 +0000     Cybis FDP <cybis-fdp@hotmail.com>, signed "Cybis" https://web.archive.org/web/20141011193156/http://compsoc.dur.ac.uk/archives/whitespace/2009-November/000072.html
rebase_break_before_date '2009-05-19 23:53:16 +0000'
get_cached https://pastebin.com/raw/f761fc4b5 sudoku.ws
git add sudoku.ws
commit '2009-05-19 23:53:16 +0000' 'Compile sudoku solver

https://what.thedailywtf.com/topic/5980/stupid-coding-tricks-sudoku-solver-in-whitespace'
git rebase --continue

git config --unset user.name
git config --unset user.email

# Untracked and ignored files in SVN checkout:
# zip modified time        Stat Filename
# 2010-12-18 22:26:06 +0000  ?  99bottles.hpl
# 2010-12-18 22:27:46 +0000  ?  99bottles.ws
# 2015-06-26 02:27:44 +0000  I  WSpace/*
# 2009-05-20 03:57:48 +0000  ?  hosting.txt
# 2009-05-10 07:44:54 +0000  I  hwc/*.pyc
# 2009-04-28 05:21:52 +0000  I  wspace.exe

# Apply the differences from the Webs site to the local tutorial, as if it was
# not mangled by the site builder tool. Additionally, remove 99bottles.hpl from
# Examples, although that snapshot was not saved.
#
# Public release announcement:
# 2010-05-23 02:20:21 +0000  Cybis FDP <cybis-fdp@hotmail.com>  https://web.archive.org/web/20130926170259/http://compsoc.dur.ac.uk:80/archives/whitespace/2010-May/000075.html
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
cp -Rp ../../../files/cybis/hapyli/2010-05-23/ .
git add -A
commit '2010-05-23 02:20:21 +0000' 'Publish tutorial

https://web.archive.org/web/20110212015726/http://hapyli.webs.com:80/
https://web.archive.org/web/20130926170259/http://compsoc.dur.ac.uk:80/archives/whitespace/2010-May/000075.html'

# 2010-11-27  Marinus Oosters  https://www.99-bottles-of-beer.net/language-hapyli-2556.html
# Marinus appears to live in CET +0100 / CEST +0200 based on commits from https://github.com/marinuso
cp -p ../hapyli-svn-checkout/99bottles.hpl .
diff 99bottles.hpl "$(get_cached_path https://www.99-bottles-of-beer.net/download/2556)"
git add 99bottles.hpl
commit "$MARINUS 2010-11-27 00:00:00 +0000" 'Create 99 bottles of beer in HaPyLi

https://www.99-bottles-of-beer.net/language-hapyli-2556.html'

# brainfuck.hpl was manually extracted from the wiki.
# 2010-12-01 07:54  Marinus  https://esolangs.org/w/index.php?title=User:Marinus/Brainfuck_interpreters&diff=20310&oldid=18866
cp -Rp ../../../files/cybis/hapyli/2010-12-01/ .
git add -A
commit "$MARINUS 2010-12-01 08:54:00 +0100" 'Create Brainfuck interpreter in HaPyLi

https://esolangs.org/wiki/User:Marinus/Brainfuck_interpreters#HaPyLi'

cp -Rp ../../../files/cybis/hapyli/2010-12-18/ .
cp -p ../hapyli-svn-checkout/99bottles.ws .
# 99bottles.ws was generated as LF, but would have been committed as CRLF.
unix2dos -q 99bottles.ws
git add -A
commit '2010-12-18 22:27:46 +0000' 'List 99 bottles in contributions

https://web.archive.org/web/20110217145734/http://hapyli.webs.com:80/examples.htm'

git remote add origin https://github.com/wspace/cybis-hapyli
