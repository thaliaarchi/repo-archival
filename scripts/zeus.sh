#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# Zeus Programmers Editor, now Zeus IDE

get_zip() {
  mkdir "$1"
  cd "$1"
  get_cached "$2"
  mkdir contents
  cd contents
  chronic 7z x "$(get_cached_path "$2")"

  # Versions 1.05 and 2.15 have source code, but it is compressed with DOS
  # tools. VENDINFO.DIZ has a PKZIP-looking directory index at the end, but it
  # doesn't decompress; it indicates it has the format "VENDINFO standard v1.04,
  # produced by VendEdit v1.30, 7-May-1996", so may be decompressible with that.
  # Files ending with *_ are "MS Compress archive data, SZDD variant", according
  # to `file`; they can be compressed with 7z. Since we're using 7z for that, we
  # may as well use it above for the zips.
  if [[ -f EXPAND.EXE ]]; then
    for f in *_; do
      chronic 7z x "$f"
      rm "$f"
    done
    # Fix 3-letter extensions that had the third letter overwritten with _ when
    # compressing.
    rename -e 's/\.BA$/.BAT/' \
           -e 's/\.BN$/.BNN/' \
           -e 's/\.CP$/.CPP/' \
           -e 's/\.EX$/.EXE/' \
           -e 's/\.IN$/.INI/' \
           -e 's/\.MA$/.MAK/' \
           -e 's/\.TX$/.TXT/' ./*
  fi

  cd ../..
}

# Attribution:
#   Zeus Programmers Editor <info@zeusedit.com>
#   Copyright (C) Jussi Jumppanen <jussi@sydney.dialix.oz.au>

mkdir zeus
cd zeus

# Have source
get_zip ZEUSV105 https://archive.org/download/ZEUSV105_ZIP/ZEUSV105.ZIP
get_zip ZEUSV215 https://archive.org/download/ZEUSV215_ZIP/ZEUSV215.ZIP
get_zip ZE32V215 https://archive.org/download/ZE32V215_ZIP/ZE32V215.ZIP
get_zip ZE32V215_alt https://archive.org/download/ZE32V215.ZIP/ZE32V215.ZIP

# Only exe
get_zip ze32v300 https://archive.org/download/ze32v300_zip/ze32v300.zip
get_zip ze32v320 https://archive.org/download/ze32v320_zip/ze32v320.zip
get_zip ze32v330 https://archive.org/download/ze32v330_zip/ze32v330.zip
get_zip ze32v340 https://archive.org/download/ze32v340_zip/ze32v340.zip
