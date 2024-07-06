#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir patch
cd patch
git init -q

extract_usenet_post PDE1MDhAc2RjcmRjZi5VVUNQPg
git add -A

# Email from rn sources
commit "Larry Wall <lwall@sdcrdcf.UUCP> $(get_usenet_post_date PDE1MDhAc2RjcmRjZi5VVUNQPg)" \
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
