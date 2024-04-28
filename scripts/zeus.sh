#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# Zeus Programmers Editor, now Zeus IDE

# TODO:
# - Properly extract the archives using EXPAND.EXE on Windows or DOS.
# - Check docs for each version for how Zeus referred to itself and the
#   developer's contact info.

extract() {
  chronic 7z x "$@"
}

add_zip() {
  local path="$1"
  git rm -q --ignore-unmatch '*'
  extract "$(get_cached_path "$path")"

  # Versions 1.05 and 2.15 have source code, but it is compressed with DOS
  # tools. VENDINFO.DIZ has a PKZIP-looking directory index at the end, but it
  # doesn't decompress; it indicates it has the format "VENDINFO standard v1.04,
  # produced by VendEdit v1.30, 7-May-1996", so may be decompressible with that.
  # Files ending with *_ are "MS Compress archive data, SZDD variant", according
  # to `file`; they can be compressed with 7z. Since we're using 7z for that, we
  # may as well use it above for the zips.
  if [[ -f EXPAND.EXE ]]; then
    for f in *_; do
      extract "$f"
      rm "$f"
    done
    # Fix 3-letter extensions that had the third letter overwritten with _ when
    # compressing. This does not cover all of them.
    rename -e 's/\.BA$/.BAT/' \
           -e 's/\.BN$/.BNN/' \
           -e 's/\.CP$/.CPP/' \
           -e 's/\.EX$/.EXE/' \
           -e 's/\.HL$/.HLP/' \
           -e 's/\.ID$/.IDE/' \
           -e 's/\.IN$/.INI/' \
           -e 's/\.MA$/.MAK/' \
           -e 's/\.TX$/.TXT/' ./*
  fi

  git add -Af
}

commit_as() {
  local name="$1"
  local email="$2"
  local message="$3"
  GIT_AUTHOR_NAME="$name" GIT_AUTHOR_EMAIL="$email" \
  GIT_COMMITTER_NAME="$name" GIT_COMMITTER_EMAIL="$email" \
  tcommit -q -m "$message"
}

commit_as_jussi() {
  commit_as 'Jussi Jumppanen' 'jussi@sydney.dialix.oz.au' "$1"
}
commit_as_zeus() {
  commit_as 'Jussi Jumppanen' 'info@zeusedit.com' "$1"
}

mkdir zeus
cd zeus

# These ZIPs have bit-identical contents, but are not bit-identical themselves.
# Verify that.
mkdir ZE32V215 ZE32V215_alt
extract -oZE32V215 "$(get_cached_path https://archive.org/download/ZE32V215_ZIP/ZE32V215.ZIP)"
extract -oZE32V215_alt "$(get_cached_path https://archive.org/download/ZE32V215.ZIP/ZE32V215.ZIP)"
diff ZE32V215 ZE32V215_alt
rm -r ZE32V215 ZE32V215_alt

git init -q
git config core.autocrlf false
git checkout -qb zeus-2

# These versions have source.
add_zip https://archive.org/download/ZEUSV105_ZIP/ZEUSV105.ZIP
commit_as_jussi 'Zeus for Windows 1.05 source'
add_zip https://archive.org/download/ZEUSV215_ZIP/ZEUSV215.ZIP
commit_as_jussi 'Zeus for Windows 2.15 source'
add_zip https://archive.org/download/ZE32V215_ZIP/ZE32V215.ZIP
commit_as_jussi 'Zeus for WIN32 2.15 source'

# These versions have only EXEs, so include them on a separate non-default
# branch.
git checkout -qb zeus-3
add_zip https://archive.org/download/ze32v300_zip/ze32v300.zip
commit_as_zeus 'Zeus 3.00 setup'
add_zip https://archive.org/download/ze32v320_zip/ze32v320.zip
commit_as_zeus 'Zeus 3.20 setup'
add_zip https://archive.org/download/ze32v330_zip/ze32v330.zip
commit_as_zeus 'Zeus 3.30 setup'
add_zip https://archive.org/download/ze32v340_zip/ze32v340.zip
commit_as_zeus 'Zeus 3.40 setup'

git checkout -q zeus-2
