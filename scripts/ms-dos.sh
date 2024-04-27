#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - Create linear history with the four versions modifying the same directories.
# - Use the Computer History Museum's version of v1.25 and v2.0.
# - Investigate force-pushed commits.
# - Examine executable file modes.
# - Pick either the original or optimized PNG version for the logo. Where were
#   they sourced? The PNGs may have useful text (https://www.w3.org/TR/png-3/#11textinfo),
#   EXIF (https://www.w3.org/TR/png-3/#eXIf), or timestamp (https://www.w3.org/TR/png-3/#11timestampinfo)
#   information.

# https://www.hanselman.com/blog/open-sourcing-dos-4
# https://computerhistory.org/blog/microsoft-ms-dos-early-source-code/
# https://news.ycombinator.com/item?id=40163405
# https://www.os2museum.com/wp/how-not-to-release-historic-source-code/

export GIT_AUTHOR_NAME='Microsoft Open Source'
export GIT_AUTHOR_EMAIL='microsoftopensource@users.noreply.github.com'
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

commit() {
  local date="$1"
  local message="$2"
  GIT_AUTHOR_DATE="${GIT_AUTHOR_DATE-"$date"}" \
  GIT_COMMITTER_DATE="${GIT_COMMITTER_DATE-"$date"}" \
  git commit -q -m "$message"
}

mkdir ms-dos
cd ms-dos

git init -q
git config core.autocrlf false

# https://computerhistory.org/blog/microsoft-ms-dos-early-source-code/
unzip -q "$(get_cached_path https://d1yx3ys82bpsa0.cloudfront.net/source/msdos.zip)"
mv msdos/v11source/Tim_Paterson_16Dec2013_email.txt .
mv msdos/v11object bin
mv msdos/v11source src

# Files modified 1982-05-07 19:00:00 +0000
git add -f \
  bin/{ART.BAS,BALL.BAS,BASIC.COM,BASICA.COM,CALENDAR.BAS,CHKDSK.COM} \
  bin/{CIRCLE.BAS,COLORBAR.BAS,COMM.BAS,COMMAND.COM,COMP.COM,DEBUG.COM} \
  bin/{DISKCOMP.COM,DISKCOPY.COM,DONKEY.BAS,EDLIN.COM,EXE2BIN.EXE,FORMAT.COM} \
  bin/{LINK.EXE,MODE.COM,MORTGAGE.BAS,MUSIC.BAS,PIECHART.BAS,SAMPLES.BAS} \
  bin/{SPACE.BAS,SYS.COM}
commit '1982-05-07 19:00:00 +0000' '1982-05-07: MS-DOS 1.25'

# 1982-07-02 06:54:50 +0000 v11source/TRANS.ASM
# 1982-07-02 18:33:26 +0000 v11source/HEX2BIN.ASM
git add -f src/{TRANS.ASM,HEX2BIN.ASM}
commit '1982-07-02 18:33:26 +0000' '1982-07-02: MS-DOS 1.25'

git add -f src/IO.ASM
commit '1982-08-03 07:29:18 +0000' '1982-08-03: MS-DOS 1.25'
git add -f bin/SETCLOCK.COM
commit '1982-09-19 07:00:00 +0000' '1982-09-19: MS-DOS 1.25'
git add -f src/ASM.ASM
commit '1983-05-09 16:59:14 +0000' '1983-05-09: MS-DOS 1.25'

# 1983-05-18 01:15:22 +0000 v11source/MSDOS.ASM
# 1983-05-18 01:19:00 +0000 v11source/COMMAND.ASM
# 1983-05-18 01:20:16 +0000 v11source/STDDOS.ASM
git add src/{MSDOS.ASM,COMMAND.ASM,STDDOS.ASM}
commit '1983-05-18 01:20:16 +0000' '1983-05-18: MS-DOS 1.25'

# Date:     2013-12-16 10:34:17 -0800
# Modified: 2013-12-19 23:15:52 +0000
git add Tim_Paterson_16Dec2013_email.txt
GIT_COMMITTER_DATE='2013-12-19 23:15:52 +0000' \
commit '2013-12-16 10:34:17 -0800' '2013-12-16: MS-DOS 1.25'

GIT_COMMITTER_DATE='2013-12-19 23:15:52 +0000' \
git tag ms-dos-v1.25 -a -m 'MS-DOS 1.25'

git rm -rq '*'

# The files are modified on two dates:
# 1987-07-24 05:00:02 +0000 SOURCE/{PROGREF,SRC,AG.DOC,README.BF,README.DIS}/**
# 1988-02-02 06:00:02 +0000 SOURCE/UPDSRC/**
7z x "$(get_cached_path https://archive.org/download/microsoftSrcLeakCollection/ms_dos_3_30_oem_adaptation_kit_source_code.7z)"
mv dos-3.30/SOURCE src
rmdir dos-3.30
git add -Af src/{PROGREF,SRC,AG.DOC,README.BF,README.DIS}
commit '1987-07-24 05:00:02 +0000' '1987-07-24: MS-DOS 3.30'
git add -Af src/UPDSRC
commit '1988-02-02 06:00:02 +0000' '1988-02-02: MS-DOS 3.30'
GIT_COMMITTER_DATE='1988-02-02 06:00:02 +0000' \
git tag ms-dos-v3.30 -a -m 'MS-DOS 3.30'

git rm -rq '*'

# All files have dates in sequence alphabetically from 1999-10-31 16:33:52 +0000
# to 1999-10-31 19:01:40 +0000. Use the earlier date.
7z x "$(get_cached_path https://archive.org/download/microsoftSrcLeakCollection/ms_dos_6_0_source_code.7z)"
mv dos-6.0 src
git add -Af src
commit '1999-10-31 19:01:40 +0000' '1999-10-31: MS-DOS 6.0'
GIT_COMMITTER_DATE='1999-10-31 19:01:40 +0000' \
git tag ms-dos-v6.0 -a -m 'MS-DOS 6.0'

# The repo was force-pushed to reorganize and remove an insult. Discussed at
# https://news.ycombinator.com/item?id=40163766. Strangely, both of these cooked
# repos have many corrupt packed objects.
clone_swh https://github.com/microsoft/MS-DOS 661305ed4e91e8ab578dcb96ac4816b0f32ece32 ms-dos-1
clone_swh https://github.com/microsoft/MS-DOS 656c98b804c7845b1352a84f08177401caaea866 ms-dos-2

clone_submodule https://github.com/microsoft/MS-DOS ms-dos-3

cd ms-dos-3

# 1. Remove translated READMEs. With the addition of MS-DOS v4.0, they became
#    out of date and a5eb02a (Moving localized READMEs, 2024-04-25) moved them
#    to .readmes/, essentially deprecating them. Since the purpose here is to
#    make a linear development history, these feel out of place.
# 2. Pick "src" as the directory name.
# 3. Move icons to docs/
git filter-repo --quiet \
  --invert-paths \
  --path-regex 'README[.-].+\.md' \
  --path-regex .readmes/thanks.md \
  --invert-paths \
  \
  --path-rename v1.25/source/:v1.25/src/ \
  --path-rename v2.0/source/:v2.0/src/ \
  \
  --path-rename msdos-logo.png:docs/msdos-logo.png \
  --path-rename msdos-logo_250x250.png:docs/msdos-logo_250x250.png \
  --path-rename .readmes/:docs/
