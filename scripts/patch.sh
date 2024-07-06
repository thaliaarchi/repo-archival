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

unshar_usenet_post PDE1MDhAc2RjcmRjZi5VVUNQPg
git add -A

commit "$(get_usenet_post_date PDE1MDhAc2RjcmRjZi5VVUNQPg)" \
"patch version 1.2--YOU WANT THIS

[Laziness is the father of invention]

Sorry the initial version was so sloppy, but I was just going on vacation
and couldn't bear not sending it out.

Differences from version 1.1 to 1.2:
	Linted.
	Malloc bug fixed.
	Mktemp bug fixed.
	Will now work on files larger than 32767 for machines with small ints.
	Added a -R option for files with the new and old reversed.

Happy patching!

Larry Wall
{allegra,burdvax,cbosgd,hplabs,ihnp4,sdcsvax}!sdcrdcf!lwall

Source: https://usenetarchives.com/view.php?id=net.sources&mid=PDE1MDhAc2RjcmRjZi5VVUNQPg"

git rm -qr .

get_usenet_post    PDI5MjJAc2RjcmRjZi5VVUNQPg # patch version 1.5, kit 1 of 2
unshar_usenet_post PDI5MjNAc2RjcmRjZi5VVUNQPg # patch version 1.5, part 2 of 2
get_usenet_post    PDI5MzBAc2RjcmRjZi5VVUNQPg # tail of patch 1.5, kit 1 of 2
# Combine truncated kit
chronic sh <(
  usenet_post_contents PDI5MjJAc2RjcmRjZi5VVUNQPg | head -n1567 &&
  usenet_post_contents PDI5MzBAc2RjcmRjZi5VVUNQPg | tail -n+19)
git add -A

commit "$(get_usenet_post_date PDI5MjJAc2RjcmRjZi5VVUNQPg)" \
'patch version 1.5

Here is the newest version of patch.  I'\''d like some of you to kinda beta
test it, and then I'\''ll submit it to mod.sources, probably as version 2.0.

Larry

Source: net.sources
- "patch version 1.5, kit 1 of 2" https://usenetarchives.com/view.php?id=net.sources&mid=PDI5MjJAc2RjcmRjZi5VVUNQPg
- "patch version 1.5, part 2 of 2" https://usenetarchives.com/view.php?id=net.sources&mid=PDI5MjNAc2RjcmRjZi5VVUNQPg
- "tail of patch 1.5, kit 1 of 2" https://usenetarchives.com/view.php?id=net.sources&mid=PDI5MzBAc2RjcmRjZi5VVUNQPg'
