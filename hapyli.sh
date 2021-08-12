#!/bin/sh -e

commit() {
  GIT_AUTHOR_DATE="$1" GIT_AUTHOR_NAME="$2" GIT_AUTHOR_EMAIL=$3 \
  GIT_COMMITTER_DATE="$1" GIT_COMMITTER_NAME="$2" GIT_COMMITTER_EMAIL=$3 \
  git commit -m "$4"
}

test -d tutorial
test -f brainfuck.hpl

git init

# sudoku.ws uses CRLF; preserve that
git config core.autocrlf false

# First mention
# 2009-03-03 19:44:31 +0000 Cybis https://stackoverflow.com/questions/607830/use-of-haskell-state-monad-a-code-smell

# sudoku.ws
# 2009-05-19 23:53:16.030 +0000 Huf_Lungdung                                      https://what.thedailywtf.com/topic/5980/stupid-coding-tricks-sudoku-solver-in-whitespace
# 2009-05-20 16:30:21 +0000     Huf Lungdung                                      https://pastebin.com/f761fc4b5
# 2009-11-19 22:42:24 +0000     Cybis FDP <cybis-fdp@hotmail.com>, signed "Cybis" https://web.archive.org/web/20141011193156/http://compsoc.dur.ac.uk/archives/whitespace/2009-November/000072.html
wget https://pastebin.com/raw/f761fc4b5 -O sudoku.ws
git add sudoku.ws
commit '2009-05-19 23:53:16 +0000' 'Cybis' 'cybis-fdp@hotmail.com' \
'Add sudoku solver in Whitespace, compiled from HaPyLi

https://what.thedailywtf.com/topic/5980/stupid-coding-tricks-sudoku-solver-in-whitespace
https://pastebin.com/f761fc4b5'

# 2010-11-27 Marinus Oosters https://www.99-bottles-of-beer.net/language-hapyli-2556.html
wget https://www.99-bottles-of-beer.net/download/2556 -O 99bottles.hpl
git add 99bottles.hpl
commit '2010-11-27 00:00:00 +0000' 'Marinus Oosters' 'marinuso@gmail.com' \
'Add 99 bottles of beer in HaPyLi

https://www.99-bottles-of-beer.net/language-hapyli-2556.html'

# 2010-12-01 07:54 Marinus https://esolangs.org/w/index.php?title=User:Marinus/Brainfuck_interpreters&diff=20310&oldid=18866
# Marinus appears to live in CET +0100 / CEST +0200 based on commits from https://github.com/marinuso
git add brainfuck.hpl # manually extracted from wiki
commit '2010-12-01 08:54:00 +0100' 'Marinus Oosters' 'marinuso@gmail.com' \
'Add Brainfuck interpreter in HaPyLi

https://esolangs.org/wiki/User:Marinus/Brainfuck_interpreters#HaPyLi'

# 2010-05-23 02:20:21 +0000 Cybis FDP <cybis-fdp@hotmail.com> https://web.archive.org/web/20130926170259/http://compsoc.dur.ac.uk:80/archives/whitespace/2010-May/000075.html
# 2011-02-12 01:57:25 +0000 https://web.archive.org/web/20110212015726/http://hapyli.webs.com:80/
# 2011-02-13 10:22:00 +0000 https://web.archive.org/web/20110213102200/http://hapyli.webs.com:80/functions.htm
# 2011-02-13 17:20:27 +0000 https://web.archive.org/web/20110213172035/http://hapyli.webs.com:80/apps/forums/
# 2011-02-17 14:57:28 +0000 https://web.archive.org/web/20110217145734/http://hapyli.webs.com:80/examples.htm
# 2011-02-19 13:27:10 +0000 https://web.archive.org/web/20110219132710/http://hapyli.webs.com:80/expressions.htm
# 2011-02-19 15:50:17 +0000 https://web.archive.org/web/20110219155019/http://hapyli.webs.com:80/variablesandtheheap.htm
# 2011-02-19 16:25:25 +0000 https://web.archive.org/web/20110219162526/http://hapyli.webs.com:80/embeddingwhitespace.htm
# 2012-07-12 02:48:54 +0000 https://web.archive.org/web/20120712024855/http://hapyli.webs.com:80/apps/forums/
wget https://web.archive.org/web/20110212015726id_/http://hapyli.webs.com:80/                        -O tutorial/index.htm
wget https://web.archive.org/web/20110213102200id_/http://hapyli.webs.com:80/functions.htm           -O tutorial/functions.htm
wget https://web.archive.org/web/20110217145734id_/http://hapyli.webs.com:80/examples.htm            -O tutorial/examples.htm
wget https://web.archive.org/web/20110219132710id_/http://hapyli.webs.com:80/expressions.htm         -O tutorial/expressions.htm
wget https://web.archive.org/web/20110219155019id_/http://hapyli.webs.com:80/variablesandtheheap.htm -O tutorial/variablesandtheheap.htm
wget https://web.archive.org/web/20110219162526id_/http://hapyli.webs.com:80/embeddingwhitespace.htm -O tutorial/embeddingwhitespace.htm
git add tutorial/*.htm
git add tutorial/*.hpl # manually extracted from HTML files
GIT_AUTHOR_DATE='2010-05-23 02:20:21 +0000' GIT_AUTHOR_NAME='Cybis' GIT_AUTHOR_EMAIL='cybis-fdp@hotmail.com' \
GIT_COMMITTER_DATE='2011-02-12 01:57:25 +0000' GIT_COMMITTER_NAME='Cybis' GIT_COMMITTER_EMAIL='cybis-fdp@hotmail.com' \
git commit -m 'Post HaPyLi web tutorial

https://web.archive.org/web/20110212015726/http://hapyli.webs.com:80/
https://web.archive.org/web/20130926170259/http://compsoc.dur.ac.uk:80/archives/whitespace/2010-May/000075.html'

# Sudoku.bf
# 2017-05-26 19:06:04.327867507 +0000 Huf_Lungdung 1495829695493-sudoku.7z/Sudoku.bf
# 2017-05-26 20:14:55 +0000           Huf_Lungdung https://what.thedailywtf.com/assets/uploads/files/1495829695493-sudoku.7z
# 2017-05-26 20:34:53.111 +0000       Huf_Lungdung https://what.thedailywtf.com/topic/23006/stupid-coding-tricks-sudoku-solver-in-brainfuck
wget https://what.thedailywtf.com/assets/uploads/files/1495829695493-sudoku.7z -O sudoku.7z
# Timestamp less accurate with `7z`; use The Unarchiver
7z x sudoku.7z
mv Sudoku.bf sudoku.bf
git add sudoku.bf
commit '2017-05-26 19:06:04 +0000' 'Cybis' 'cybis-fdp@hotmail.com' \
'Add sudoku solver in Brainfuck

https://what.thedailywtf.com/topic/23006/stupid-coding-tricks-sudoku-solver-in-brainfuck'
