#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# Stefan is in Germany, but I don't know whether the archive times are
# local or UTC, so I won't set the location.

# 2003-09-27 06:57:35 +0000 UTC  wsdebug-0.1/INSTALL
# 2003-09-27 06:57:35 +0000 UTC  wsdebug-0.1/install-sh
# 2003-09-27 06:57:35 +0000 UTC  wsdebug-0.1/missing
# 2003-09-27 06:57:35 +0000 UTC  wsdebug-0.1/mkinstalldirs
# 2004-07-06 17:48:00 +0000 UTC  wsdebug-0.1/ltmain.sh
# 2004-08-25 14:25:50 +0000 UTC  wsdebug-0.1/config.guess
# 2004-08-25 14:25:50 +0000 UTC  wsdebug-0.1/config.sub
# 2004-09-09 15:29:41 +0000 UTC  wsdebug-0.1/COPYING
# 2004-09-09 15:29:41 +0000 UTC  wsdebug-0.1/debug.h
# 2004-09-09 15:29:41 +0000 UTC  wsdebug-0.1/fileio.c
# 2004-09-09 15:29:41 +0000 UTC  wsdebug-0.1/fileio.h
# 2004-09-09 15:29:42 +0000 UTC  wsdebug-0.1/storage.c
# 2004-09-09 16:43:41 +0000 UTC  wsdebug-0.1/ChangeLog
# 2004-09-09 16:43:41 +0000 UTC  wsdebug-0.1/NEWS
# 2004-09-09 16:46:06 +0000 UTC  wsdebug-0.1/AUTHORS
# 2004-09-10 17:41:23 +0000 UTC  wsdebug-0.1/wsi.c
# 2004-09-10 17:41:30 +0000 UTC  wsdebug-0.1/wsdebug.c
# 2004-09-10 21:56:39 +0000 UTC  wsdebug-0.1/Makefile.am
# 2004-09-11 11:23:43 +0000 UTC  wsdebug-0.1/README
# 2004-09-11 16:16:04 +0000 UTC  wsdebug-0.1/debug.c
# 2004-09-12 09:27:03 +0000 UTC  wsdebug-0.1/interprt.h
# 2004-09-14 20:44:13 +0000 UTC  wsdebug-0.1/configure.ac
# 2004-09-14 22:17:18 +0000 UTC  wsdebug-0.1/storage.h
# 2004-09-14 22:21:57 +0000 UTC  wsdebug-0.1/aclocal.m4
# 2004-09-14 22:23:27 +0000 UTC  wsdebug-0.1/configure
# 2004-09-14 22:23:42 +0000 UTC  wsdebug-0.1/config.h.in
# 2004-09-14 22:30:26 +0000 UTC  wsdebug-0.1/interprt.c
# 2004-09-14 22:31:01 +0000 UTC  wsdebug-0.1/stamp-h.in
# 2004-10-16 15:14:32 +0000 UTC  wsdebug-0.1/
# 2004-10-16 15:14:32 +0000 UTC  wsdebug-0.1/Makefile.in
tar xf "$(get_cached_path 'https://master.dl.sourceforge.net/project/wsdebug.berlios/wsdebug-0.1.tar.gz?viasf=1')"
mv wsdebug-0.1 ssiegl-wsdebug
cd ssiegl-wsdebug

# Last modified: 2004-09-11 09:46:20 +0000 GMT
get_cached https://web.archive.org/web/20041102163053/http://wsdebug.berlios.de:80/wsbfi-1.ws

git init -q

git add wsbfi-1.ws
GIT_AUTHOR_NAME='Stefan Siegl' GIT_AUTHOR_EMAIL='ssiegl@gmx.de' GIT_AUTHOR_DATE='2004-09-11 09:46:20 +0000' \
GIT_COMMITTER_NAME='Stefan Siegl' GIT_COMMITTER_EMAIL='ssiegl@gmx.de' GIT_COMMITTER_DATE='2004-09-11 09:46:20 +0000' \
git commit -q -m 'Add Brainfuck interpreter in Whitespace

https://web.archive.org/web/20041102163053/http://wsdebug.berlios.de:80/wsbfi-1.ws'

git add -Af
GIT_AUTHOR_NAME='Stefan Siegl' GIT_AUTHOR_EMAIL='ssiegl@gmx.de' GIT_AUTHOR_DATE='2004-10-16 15:14:32 +0000' \
GIT_COMMITTER_NAME='Stefan Siegl' GIT_COMMITTER_EMAIL='ssiegl@gmx.de' GIT_COMMITTER_DATE='2004-10-16 15:14:32 +0000' \
git commit -q -m 'Release wsdebug 0.1

https://sourceforge.net/projects/wsdebug.berlios/files/wsdebug-0.1.tar.gz/download'

git remote add origin https://github.com/wspace/ssiegl-wsdebug
