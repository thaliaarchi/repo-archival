#!/bin/bash -e

. base.sh

#                          X-Archive-Orig-
# File                     Last-Modified              Modification time in zip   Digest                            URL
# -----------------------  -------------------------  -------------------------  --------------------------------  ---------------------------------------------------------------------------------------------------------------
# *                        2005-09-07 09:09:42 +0000                             ASAB4A66BACM3VL3R5E5NMEEEUM4N54K  https://web.archive.org/web/20060506022832id_/http://www.burghard.info:80/homepagenew/code/whitespace/wsa.zip
# wsa/                                                2005-03-23 14:13:53 +0000
# wsa/intro.html           2003-04-24 18:52:09 +0000  2003-09-16 20:40:20 +0000  QIKYQQ3VSHHDANKEE2PPWZEAJ5KO6AYT  https://web.archive.org/web/20030701130831id_/http://www.burghard.info:80/code/whitespace/wsa/intro.html
# wsa/trans.hs             2003-09-16 20:40:22 +0000  2003-09-16 20:40:22 +0000  5KFMW6S2UVCOL4N3TXD6HRLA44TOLBYT  https://web.archive.org/web/20040810052549id_/http://www.burghard.info:80/code/whitespace/wsa/trans.hs
# wsa/examples/                                       2005-03-23 14:11:30 +0000
# wsa/examples/prim.wsa    2003-04-24 18:52:03 +0000  2003-09-16 20:40:16 +0000  ZIAOVQQ3DZCIMBBXRCMCID6HSUFZUPDJ  https://web.archive.org/web/20030701130508id_/http://www.burghard.info:80/code/whitespace/wsa/examples/prim.wsa
# wsa/libs/                                           2005-03-23 14:11:30 +0000
# wsa/libs/io.wsa          2003-04-24 18:52:09 +0000  2003-09-16 20:40:20 +0000  EXJ2OJPOVOUO34R2JBVII2GTQUHCIQPP  https://web.archive.org/web/20030701130838id_/http://www.burghard.info:80/code/whitespace/wsa/libs/io.wsa
# wsa/libs/memory.wsa      2003-04-24 18:52:09 +0000  2003-09-16 20:40:21 +0000  DY4ED23UQRIN4PDQQLC6BNSNNV3KNLSU  https://web.archive.org/web/20030701130739id_/http://www.burghard.info:80/code/whitespace/wsa/libs/memory.wsa

# *                        2005-09-07 09:09:40 +0000                             63BCQDDVWLQQASF36BE4ZDPWHIRMGG3W  https://web.archive.org/web/20060506022719id_/http://www.burghard.info:80/homepagenew/code/whitespace/wsintercpp.zip
# pack/                                               2003-04-21 22:52:30 +0000
# pack/inter.cpp                                      2003-04-10 13:29:10 +0000
# pack/inter.dsp                                      2003-04-04 19:02:06 +0000
# pack/inter.dsw                                      2003-04-04 17:25:44 +0000
# pack/Ops.h                                          2003-04-04 18:57:02 +0000

# *                        2005-09-07 09:09:37 +0000                             YL6IZYWQUCIWWUMEJDO5PTRJ6MDDHVZE  https://web.archive.org/web/20060428020415id_/http://www.burghard.info:80/homepagenew/code/whitespace/wsinterws.zip
# wsinterws/                                          2005-03-23 14:13:48 +0000
# wsinterws/run.txt        2003-04-24 18:52:12 +0000  2003-09-16 20:40:25 +0000  GRPGCE2RLZEV5HMJLR65VFLWJWTIBM2X  https://web.archive.org/web/20030622164543id_/http://www.burghard.info:80/code/whitespace/wsinterws/run.txt
# wsinterws/wsinterws.ws   2003-04-24 18:52:12 +0000  2003-09-16 20:40:28 +0000  YUYXXSHFC7GNMXN2SBEUP5RHNBVVTAT6  https://web.archive.org/web/20030622164645id_/http://www.burghard.info:80/code/whitespace/wsinterws/wsinterws.ws
# wsinterws/wsinterws.wsa  2003-04-24 18:52:13 +0000  2003-09-16 20:40:28 +0000  LGFOH3ZXO5CGHFXH4PYMUHL5HVMK4LP7  https://web.archive.org/web/20030622165242id_/http://www.burghard.info:80/code/whitespace/wsinterws/wsinterws.wsa


# “All programs are released under the GPL” https://web.archive.org/web/20090123074209/http://burghard.info:80/Code/index.html

commit() {
  GIT_AUTHOR_NAME='Oliver Burghard' GIT_AUTHOR_EMAIL='oliver@burghard.info' GIT_AUTHOR_DATE="$1" \
  GIT_COMMITTER_NAME='Oliver Burghard' GIT_COMMITTER_EMAIL='oliver@burghard.info' GIT_COMMITTER_DATE="$1" \
  git commit -q -m "$2"
}

mkdir -p wspace
cd wspace

get_cached https://web.archive.org/web/20060506022832id_/http://www.burghard.info:80/homepagenew/code/whitespace/wsa.zip
unzip -q wsa.zip
mv wsa burghard-wsa
cd burghard-wsa
git init -q

echo 'Whitespace Assembler

An Assembler for Whitespace, quite complex already. It is written in Haskell.
Features are Includes, options(defines in cpp), extended syntax ...
There is already an Assembler like this, but I did not know of its existence when I started writing this.' > README

git add -A

commit '2003-04-24 18:52:09 +0000' 'Create Whitespace Assembler

https://web.archive.org/web/20030629154300/http://www.burghard.info:80/code/whitespace/wsa/index.html'

git remote add origin https://github.com/wspace/burghard-wsa

cd ..
get_cached https://web.archive.org/web/20060506022719id_/http://www.burghard.info:80/homepagenew/code/whitespace/wsintercpp.zip
unzip -q wsintercpp.zip
mv pack burghard-wsintercpp
cd burghard-wsintercpp
git init -q

echo 'Whitespace Interpreter in C++

A Whitespace interpreter written in C++. It is very fast.' > README

git add -A

commit '2003-04-10 13:29:10 +0000' 'Create Whitespace Interpreter in C++

https://web.archive.org/web/20030629125208/http://www.burghard.info:80/code/whitespace/wsintercpp/index.html'

git remote add origin https://github.com/wspace/burghard-wsintercpp

cd ..
get_cached https://web.archive.org/web/20060428020415id_/http://www.burghard.info:80/homepagenew/code/whitespace/wsinterws.zip
unzip -q wsinterws.zip
mv wsinterws burghard-wsinterws
cd burghard-wsinterws
git init -q

echo 'Whitespace Interpreter in Whitespace

What you have been dreaming of ! My newest program ! It is a Whitespace interpreter written in Whitespace itself !
It is quite stable. It was captable of running itself and a prim number searcher within itself !
(Cpp Interpreter -> Ws Interpreter -> Ws Interpreter -> prim.ws) (although it took days to complete)' > README

git add -A

commit '2003-04-24 18:52:13 +0000' 'Create Whitespace Interpreter in Whitespace

https://web.archive.org/web/20030608024503/http://www.burghard.info:80/code/whitespace/wsinterws/index.html'

git remote add origin https://github.com/wspace/burghard-wsinterws
