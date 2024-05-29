#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

JUSSI='Jussi Jumppanen <jussi@sydney.dialix.oz.au>'
ZEUS='Jussi Jumppanen <info@zeusedit.com>'

# Zeus Programmers Editor, now Zeus IDE

# Versions 1.05 and 2.15 have source code, but are compressed with DOS tools. I
# think SETUP.EXE automatically decompresses everything, because SETUP.INF lists
# each file with whether it's compressed. Files ending with *_ are "MS Compress
# archive data, SZDD variant", according to `file`; they can be compressed with
# 7z.
#
# VENDINFO.DIZ indicates it has the format "VENDINFO standard v1.04, produced by
# VendEdit v1.30, 7-May-1996". I was able to read the PKZIP index–looking
# compressed section at the end of VENDINFO.DIZ with VENDINFO Toolkit v1.00 from
# https://archive.org/details/VNDNFO10_ZIP. It carries metadata about the
# packaging and payment.
#
# The dates and CRC32 checksums match between `7z l` and VENDINFO.DIZ for
# ZEUSV215.ZIP and ZE32V215.ZIP (the only versions to use VENDINFO.DIZ). The ZIP
# dates have seconds, but VENDINFO.DIZ only has minutes.

# TODO: Boot up Windows 95 and run SETUP.EXE to see if it decompresses better
# than I have managed.

add_zip() {
  local path="$1"
  git rm -q --ignore-unmatch '*'
  7z x "$(get_cached_path "$path")"

  if [[ -f EXPAND.EXE ]]; then
    for f in *_; do
      7z x "$f"
      rm "$f"
    done
    # Fix 3-letter extensions that had the third letter overwritten with _ when
    # compressing. This does not cover ZEUS.EL_.
    rename -e 's/\.BA$/.BAT/' \
           -e 's/\.BN$/.BND/' \
           -e 's/\.CF$/.CFG/' \
           -e 's/\.CP$/.CPP/' \
           -e 's/\.DA$/.DAT/' \
           -e 's/\.EX$/.EXE/' \
           -e 's/\.HL$/.HLP/' \
           -e 's/\.ID$/.IDE/' \
           -e 's/\.IN$/.INI/' \
           -e 's/\.KE$/.KEY/' \
           -e 's/^TEST\.MA$/TEST.MAC/' \
           -e 's/\.MA$/.MAK/' \
           -e 's/\.PI$/.PIF/' \
           -e 's/\.PR$/.PRF/' \
           -e 's/\.TX$/.TXT/' \
           -e 's/\.WR$/.WRI/' \
           -e 's/\.ZI$/.ZIX/' ./*
  fi

  git add -f ./*
}

commit_zip() {
  local ident="$1" message="$2" item="$3" zip="$4"
  add_zip "https://archive.org/download/$item/$zip"
  commit "$ident" "$message" --trailer=Source:"https://archive.org/details/$item"
}


mkdir zeus
cd zeus

# These ZIPs have bit-identical contents, but are not bit-identical themselves.
# Verify that.
mkdir ZE32V215 ZE32V215_alt
7z x -oZE32V215 "$(get_cached_path https://archive.org/download/ZE32V215_ZIP/ZE32V215.ZIP)"
7z x -oZE32V215_alt "$(get_cached_path https://archive.org/download/ZE32V215.ZIP/ZE32V215.ZIP)"
diff ZE32V215 ZE32V215_alt
rm -r ZE32V215 ZE32V215_alt

git init -q
git config core.autocrlf false
git checkout -qb zeus-2

# These versions have some source code.
commit_zip "$JUSSI 1995-07-30 22:08:10" 'Zeus for Windows Programmers Editor V1.05' ZEUSV105_ZIP ZEUSV105.ZIP
commit_zip "$JUSSI 1996-05-07 10:11:18" 'Zeus Programmers Editor for Windows V2.15' ZEUSV215_ZIP ZEUSV215.ZIP
commit_zip "$JUSSI 1996-05-07 10:07:42, 1996-05-07 10:11:18" 'Zeus Programmers Editor for WIN32 V2.15' ZE32V215_ZIP ZE32V215.ZIP

# These versions have only EXEs, so include them on a separate non-default
# branch.
git checkout -qb zeus-3
commit_zip "$ZEUS 1999-08-31 22:26:20" 'Zeus Programmers Editor V3.00' ze32v300_zip ze32v300.zip
commit_zip "$ZEUS 2000-01-22 15:09:36" 'Zeus Programmers Editor V3.20' ze32v320_zip ze32v320.zip
commit_zip "$ZEUS 2000-03-30 21:18:22" 'Zeus Programmers Editor V3.30' ze32v330_zip ze32v330.zip
commit_zip "$ZEUS 2000-09-25 19:05:10" 'Zeus Programmers Editor V3.40' ze32v340_zip ze32v340.zip

git checkout -q zeus-2
