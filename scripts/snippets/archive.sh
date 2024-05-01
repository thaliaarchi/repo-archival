#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir snippets
cd snippets

get_cached https://web.archive.org/web/20120130182709/http://www.brokersys.com/snippets/snip9707.zip
get_cached https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP0493.A01 SNIP0493.A01
get_cached https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP0493.ARJ SNIP0493.ARJ
get_cached https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP9404.ZIP SNIP9404.ZIP
get_cached https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP9510.ZIP SNIP9510.ZIP

# TODO: Other versions
get_cached https://web.archive.org/web/20050301124506/http://c.snippets.org/code/temp/snip-c.zip
cmp snip-c.zip "$(get_cached_path https://archive.org/download/Snippets.org-Snipc-08-17-2003/snip-c.zip)"

# TODO: https://archive.org/details/czpcw200002cd
