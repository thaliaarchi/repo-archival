#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - "Patch patch #5" (patch 2.0 patch #5) https://usenetarchives.com/view.php?id=net.sources&mid=PDExOUBlbXMuVVVDUD4

# Email from rn sources
export AUTHOR='Larry Wall <lwall@sdcrdcf.UUCP>'

mkdir patch
cd patch
git init -q

## 1.1

unshar_usenet_post PDE0NTdAc2RjcmRjZi5VVUNQPg
git add -A

commit "$(get_usenet_post_date PDE1MDhAc2RjcmRjZi5VVUNQPg)" \
'A patch applier--YOU WANT THIS!!!

Synthesized-from: net.sources
  * "A patch applier--YOU WANT THIS!!!" https://groups.google.com/g/net.sources/c/XjZSNCpCuDU
    https://usenetarchives.com/view.php?id=net.sources&mid=PDE0NTdAc2RjcmRjZi5VVUNQPg'

## 1.2

git rm -qr .
unshar_usenet_post PDE1MDhAc2RjcmRjZi5VVUNQPg
git add -A

commit "$(get_usenet_post_date PDE1MDhAc2RjcmRjZi5VVUNQPg)" \
'patch version 1.2--YOU WANT THIS

[Laziness is the father of invention]

Sorry the initial version was so sloppy, but I was just going on vacation
and couldn'\''t bear not sending it out.

Differences from version 1.1 to 1.2:
	Linted.
	Malloc bug fixed.
	Mktemp bug fixed.
	Will now work on files larger than 32767 for machines with small ints.
	Added a -R option for files with the new and old reversed.

Happy patching!

Larry Wall
{allegra,burdvax,cbosgd,hplabs,ihnp4,sdcsvax}!sdcrdcf!lwall

Synthesized-from: net.sources
  * "patch version 1.2--YOU WANT THIS" https://groups.google.com/g/net.sources/c/uWFr9NOp_fw
    https://usenetarchives.com/view.php?id=net.sources&mid=PDE1MDhAc2RjcmRjZi5VVUNQPg'

## 1.3

git rm -qr .
get_usenet_post PDgxM0BnZW5yYWQuVVVDUD4
chronic sh <(usenet_post_contents PDgxM0BnZW5yYWQuVVVDUD4 | tail -n+4)
git add -A

commit "$(get_usenet_post_date PDgxM0BnZW5yYWQuVVVDUD4)" \
'patch version 1.3

Synthesized-from: mod.sources
  * "patch version 1.3" https://groups.google.com/g/mod.sources/c/xSQM63e39YY
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgxM0BnZW5yYWQuVVVDUD4'

## 1.5

git rm -qr .
get_usenet_post    PDI5MjJAc2RjcmRjZi5VVUNQPg # patch version 1.5, kit 1 of 2
unshar_usenet_post PDI5MjNAc2RjcmRjZi5VVUNQPg # patch version 1.5, part 2 of 2
get_usenet_post    PDI5MzBAc2RjcmRjZi5VVUNQPg # tail of patch 1.5, kit 1 of 2
# Combine truncated kit
chronic sh <(
  usenet_post_contents PDI5MjJAc2RjcmRjZi5VVUNQPg | head -n1567 &&
  usenet_post_contents PDI5MzBAc2RjcmRjZi5VVUNQPg | tail -n+19)
rm kit{1,2}isdone
git add -A

commit "$(get_usenet_post_date PDI5MjJAc2RjcmRjZi5VVUNQPg)" \
'patch version 1.5

Here is the newest version of patch.  I'\''d like some of you to kinda beta
test it, and then I'\''ll submit it to mod.sources, probably as version 2.0.

Larry

Synthesized-from: net.sources
  * "patch version 1.5, kit 1 of 2" https://groups.google.com/g/net.sources/c/9nIzZAUp-J4
    https://usenetarchives.com/view.php?id=net.sources&mid=PDI5MjJAc2RjcmRjZi5VVUNQPg
  * "patch version 1.5, part 2 of 2" https://groups.google.com/g/net.sources/c/dxBWkSO1OgQ
    https://usenetarchives.com/view.php?id=net.sources&mid=PDI5MjNAc2RjcmRjZi5VVUNQPg
  * "tail of patch 1.5, kit 1 of 2" https://groups.google.com/g/net.sources/c/m-VhmtV6AWQ
    https://usenetarchives.com/view.php?id=net.sources&mid=PDI5MzBAc2RjcmRjZi5VVUNQPg'

## 2.0

git rm -qr .
get_usenet_post PDUxM0BtaXJyb3IuVVVDUD4
get_usenet_post PDUxNEBtaXJyb3IuVVVDUD4
get_usenet_post PDUxNUBtaXJyb3IuVVVDUD4
chronic sh <(usenet_post_contents PDUxM0BtaXJyb3IuVVVDUD4 | tail -n+12)
chronic sh <(usenet_post_contents PDUxNEBtaXJyb3IuVVVDUD4 | tail -n+12)
chronic sh <(usenet_post_contents PDUxNUBtaXJyb3IuVVVDUD4 | tail -n+12)
rm kit{1,2,3}isdone
git add -A

commit "$(get_usenet_post_date PDUxM0BtaXJyb3IuVVVDUD4)" \
'Release 2.0 of patch

Here is the official 2.0 release of patch.  It supersedes the 1.5 beta
version posted to net.sources, and the version that comes with 4.3bsd.

Larry Wall
sdcrdcf!lwall

Synthesized-from: mod.sources
  * "v07i038: Release 2.0 of patch, Part01/03" https://groups.google.com/g/mod.sources/c/ylwY2Ly5chY
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDUxM0BtaXJyb3IuVVVDUD4
  * "v07i039: Release 2.0 of patch, Part02/03" https://groups.google.com/g/mod.sources/c/byPb-78moQM
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDUxNEBtaXJyb3IuVVVDUD4
  * "v07i040: Release 2.0 of patch, Part03/03" https://groups.google.com/g/mod.sources/c/xfI2kfZXNN8
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDUxNUBtaXJyb3IuVVVDUD4'
