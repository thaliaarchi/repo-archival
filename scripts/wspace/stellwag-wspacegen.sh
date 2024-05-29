#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# Philippe is likely in Germany, but I don't know whether the archive
# times are local or UTC, so I won't set the location.

# 2004-09-09 12:44:40 +0000  wspacegen/debug.h
# 2004-09-09 12:44:41 +0000  wspacegen/COPYING
# 2004-09-09 12:44:41 +0000  wspacegen/README
# 2004-09-09 12:44:41 +0000  wspacegen/fileio.c
# 2004-09-09 12:44:41 +0000  wspacegen/fileio.h
# 2004-09-09 12:44:41 +0000  wspacegen/getAbsPath.h
# 2004-09-09 12:44:41 +0000  wspacegen/interprt.h
# 2004-09-09 12:44:41 +0000  wspacegen/storage.c
# 2004-09-09 12:44:41 +0000  wspacegen/storage.h
# 2004-09-09 12:44:41 +0000  wspacegen/wsdbg.c
# 2004-09-09 12:44:41 +0000  wspacegen/wsgen_ui.c
# 2004-09-09 12:44:41 +0000  wspacegen/wsgendbg.tcl
# 2004-09-09 12:44:41 +0000  wspacegen/wsi.c
# 2004-09-09 12:45:41 +0000  wspacegen/debug.c
# 2004-09-09 12:58:48 +0000  wspacegen/interprt.c
# 2004-09-09 12:59:05 +0000  wspacegen/GNUmakefile
# 2004-09-09 12:59:08 +0000  wspacegen/Makefile
# 2004-09-09 12:59:19 +0000  wspacegen/
tar xf "$(get_cached_path 'https://master.dl.sourceforge.net/project/wspacegen/Pre-Alpha/v0.1/wspacegen-0.1-src.tar.gz?viasf=1')"
mv wspacegen stellwag-wspacegen
cd stellwag-wspacegen

git init -q
git add -Af

commit 'Philippe Stellwag <linux@mp3s.name> 2004-09-09 12:59:19 +0000' 'Release wspacegen pre-alpha 0.1

https://sourceforge.net/projects/wspacegen/files/Pre-Alpha/v0.1/wspacegen-0.1-src.tar.gz/download'

git remote add origin https://github.com/wspace/stellwag-wspacegen
