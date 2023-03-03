#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# Philippe is likely in Germany, but I don't know whether the archive
# times are local or UTC, so I won't set the location.

# 2004-09-09 12:44:40 +0000 UTC  wspacegen/debug.h
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/COPYING
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/README
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/fileio.c
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/fileio.h
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/getAbsPath.h
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/interprt.h
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/storage.c
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/storage.h
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/wsdbg.c
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/wsgen_ui.c
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/wsgendbg.tcl
# 2004-09-09 12:44:41 +0000 UTC  wspacegen/wsi.c
# 2004-09-09 12:45:41 +0000 UTC  wspacegen/debug.c
# 2004-09-09 12:58:48 +0000 UTC  wspacegen/interprt.c
# 2004-09-09 12:59:05 +0000 UTC  wspacegen/GNUmakefile
# 2004-09-09 12:59:08 +0000 UTC  wspacegen/Makefile
# 2004-09-09 12:59:19 +0000 UTC  wspacegen/
wget -q 'https://master.dl.sourceforge.net/project/wspacegen/Pre-Alpha/v0.1/wspacegen-0.1-src.tar.gz?viasf=1' -O wspacegen-0.1-src.tar.gz
tar xf wspacegen-0.1-src.tar.gz
mv wspacegen stellwag-wspacegen
cd stellwag-wspacegen

git init -q
git add -A

GIT_AUTHOR_NAME='Philippe Stellwag' GIT_AUTHOR_EMAIL='linux@mp3s.name' GIT_AUTHOR_DATE='2004-09-09 12:59:19 +0000' \
GIT_COMMITTER_NAME='Philippe Stellwag' GIT_COMMITTER_EMAIL='linux@mp3s.name' GIT_COMMITTER_DATE='2004-09-09 12:59:19 +0000' \
git commit -q -m 'Release wspacegen pre-alpha 0.1

https://sourceforge.net/projects/wspacegen/files/Pre-Alpha/v0.1/wspacegen-0.1-src.tar.gz/download'

git remote add origin https://github.com/wspace/stellwag-wspacegen
