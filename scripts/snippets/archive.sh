#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

_check_strip_watermark() {
  local mode="$1"
  local file="$2"
  local text="$3"
  local text_len=${#text}
  # The text is preceded by the length.
  local watermark_len=$((text_len + 2))
  if ! cmp <(tail -c$watermark_len "$file") \
           <(printf "\\$(printf '%03o' "$text_len")\0$text"); then
    echo "$file does not have expected watermark" >&2
    exit 1
  fi
  if [[ $mode = strip ]]; then
    cp -p "$file" "$file.bak"
    truncate -s-$watermark_len "$file"
    printf '\0\0' >> "$file"
    touch -r "$file.bak" "$file"
    rm "$file.bak"
  fi
}

# Check that a watermark is present.
check_watermark() {
  _check_strip_watermark check "$@"
}
# Remove a text watermark from the end of a zip.
strip_watermark() {
  _check_strip_watermark strip "$@"
}

strip_simtel() {
  strip_watermark "$1" 'Distributed by the Simtel.Net(sm) world-wide network'
}

mkdir snippets
cd snippets

# SNIP9_91.ARJ (with Cream of the Crop watermark)
get_cached http://annex.retroarchive.org/cdrom/cotc-1/PROGRAM/SNIP9_91.ARJ SNIP9_91-cotc.ARJ
# SNIP9_91.ZIP (with The Tool Shop watermark)
get_cached http://cd.textfiles.com/simtel0692/MSDOS/C/SNIP9_91.ZIP SNIP9_91-toolshop.ZIP
truncate -s-463 SNIP9_91-toolshop.ZIP # Strip trailing NULs
strip_watermark SNIP9_91-toolshop.ZIP 'The Tool Shop: (818)891-6780, 891-3772, 891-1344'

# SNIP0492.ARJ (with Cream of the Crop watermark)
get_cached http://annex.retroarchive.org/cdrom/cotc-1/PROGRAM/SNIP0492.ARJ SNIP0492-cotc.ARJ

# SNIP0792.ZIP
get_cached http://annex.retroarchive.org/cdrom/nightowl-008/017A/SNIP0792.ZIP

# SNIP1292.ARJ (with Cream of the Crop watermark)
get_cached http://annex.retroarchive.org/cdrom/cotc-1/PROGRAM/SNIP1292.ARJ SNIP1292-cotc.ARJ
# SNPD1292.ZIP
get_cached http://annex.retroarchive.org/cdrom/nightowl-008/017A/SNPD1292.ZIP

# SNIP0493.ZIP (with Cream of the Crop watermark)
get_cached http://annex.retroarchive.org/cdrom/cotc-ii/C_LANG/SNIP0493.ZIP SNIP0493.ZIP
strip_watermark SNIP0493.ZIP ' Order  Cream of the Crop2 Shareware  205-824-2552--------------------------------------------------------------------------------Description: C_echo Snippets Courtesy of Bob Stout. a Must for Serious C Program Developers, This Contains Invaluable Tips, H'
# SNIP0493.ZIP (with Simtel watermark)
get_cached http://cd.textfiles.com/simtel20/MSDOS/C/SNIP0493.ZIP SNIP0493-simtel.ZIP
cmp SNIP0493.ZIP SNIP0493-simtel.ZIP
rm SNIP0493-simtel.ZIP
# SNIP0493.ZIP (with watermark; ZIP packing differs) via Coast to Coast Simtel
get_cached 'http://cd.textfiles.com/simtelctc/disk2/C/SNIP0493.ZIP;1' SNIP0493-ctc.ZIP
strip_watermark SNIP0493-ctc.ZIP 'SNIPPETS - hundreds of useful C routines, all PD!  Compiled by Bob Stout'
mkdir SNIP0493_ZIP SNIP0493_ZIP-ctc SNIP0493_ARJ
7z x -oSNIP0493_ZIP SNIP0493.ZIP
7z x -oSNIP0493_ZIP-ctc SNIP0493-ctc.ZIP
# SNIP0493.ARJ and SNIP0493.A01
7z x -oSNIP0493_ARJ "$(get_cached_path https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP0493.ARJ)"
7z x -oSNIP0493_ARJ "$(get_cached_path https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP0493.A01)"
diff SNIP0493_ZIP SNIP0493_ZIP-ctc
diff SNIP0493_ZIP SNIP0493_ARJ
rm -r SNIP0493_ZIP SNIP0493_ZIP-ctc SNIP0493_ARJ

# SNIP9404.ZIP
get_cached http://cd.textfiles.com/simtel/simtel/DISK1/DISC2/C/SNIP9404.ZIP
cmp SNIP9404.ZIP "$(get_cached_path https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP9404.ZIP)"
# SNIP9404.ZIP (with Cream of the Crop watermark)
get_cached http://annex.retroarchive.org/cdrom/cotc-4/C_LANG/SNIP9404.ZIP SNIP9404-cotc.ZIP
strip_watermark SNIP9404-cotc.ZIP ' From  Cream of the Crop 4 cd rom  205-824-2552   Description: 4/94 C_echo Snippets Courtesy of Bob Stout.'
cmp SNIP9404.ZIP SNIP9404-cotc.ZIP
rm SNIP9404-cotc.ZIP
# SNPD9404.ZIP
get_cached http://cd.textfiles.com/simtel/simtel/DISK1/DISC2/C/SNPD9404.ZIP

# SNIP9503.ZIP (with Cream of the Crop watermark)
get_cached http://annex.retroarchive.org/cdrom/cotc-8/C_LANG/SNIP9503.ZIP
strip_watermark SNIP9503.ZIP ' From  Cream of the Crop cdrom  334-824-2552      Description: C_echo Snippets Courtesy of Bob Stout.'
# SNPD9503.ZIP
get_cached http://cd.textfiles.com/simtel9703/disk2/DISC2/C/SNPD9503.ZIP
cmp SNPD9503.ZIP "$(get_cached_path http://cd.textfiles.com/simtel/simtel9703/disk2/DISC2/C/SNPD9503.ZIP)"
# SNPD9503.ZIP (with Cream of the Crop watermark; ZIP packing differs)
get_cached http://annex.retroarchive.org/cdrom/cotc-8/PROGRAM/SNPD9503.ZIP SNPD9503-cotc.ZIP
strip_watermark SNPD9503-cotc.ZIP ' From  Cream of the Crop cdrom  334-824-2552      Description: Pdncee Snippets Diff File to Create Snip9503 Archive.'

# SNIP9510.ZIP (with Simtel watermark)
get_cached http://cd.textfiles.com/simtel9703/disk2/DISC2/C/SNIP9510.ZIP SNIP9510-simtel.ZIP
cmp SNIP9510-simtel.ZIP "$(get_cached_path http://cd.textfiles.com/simtel/simtel9703/disk2/DISC2/C/SNIP9510.ZIP)"
strip_simtel SNIP9510-simtel.ZIP
# SNIP9510.ZIP via Sezamfile
get_cached https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP9510.ZIP SNIP9510.ZIP
# snip9510.lzh
mkdir SNIP9510_ZIP snip9510_lzh
7z x -oSNIP9510_ZIP SNIP9510.ZIP
7z x -osnip9510_lzh "$(get_cached_path https://web.archive.org/web/20071027093526/http://www.dcee.net/Files/Programm/C/snip9510.lzh)"
diff SNIP9510_ZIP snip9510_lzh
rm -r SNIP9510_ZIP snip9510_lzh

# SNIP9611

# SNIP9707.ZIP
get_cached https://web.archive.org/web/20120130182709/http://www.brokersys.com/snippets/snip9707.zip SNIP9707.ZIP
# SNIP9707.ZIP (with Simtel watermark)
get_cached http://cd.textfiles.com/simtel/stmsdos9709/disk2/DISC2/C/SNIP9707.ZIP SNIP9707-simtel.ZIP
cmp SNIP9707-simtel.ZIP "$(get_cached_path http://cd.textfiles.com/simtel0101/simtel/c/snip9707.zip)"
cmp SNIP9707-simtel.ZIP "$(get_cached_path http://cd.textfiles.com/simtel/simtel0101/simtel/c/snip9707.zip)"
cmp SNIP9707-simtel.ZIP "$(get_cached_path https://web.archive.org/web/20071027175145/http://www.dcee.net/Files/Programm/C/snip9707.zip)"
strip_simtel SNIP9707-simtel.ZIP
cmp SNIP9707.ZIP SNIP9707-simtel.ZIP
rm SNIP9707-simtel.ZIP
# SNPD9707.ZIP
get_cached http://annex.retroarchive.org/cdrom/cotc-26/PROGRAM/SNPD9707.ZIP
# SNPD9707.ZIP (with Simtel watermark)
get_cached http://cd.textfiles.com/simtel/stmsdos9709/disk2/DISC2/C/SNPD9707.ZIP SNPD9707-simtel.ZIP
cmp SNPD9707-simtel.ZIP "$(get_cached_path http://cd.textfiles.com/simtel0101/simtel/c/snpd9707.zip)"
cmp SNPD9707-simtel.ZIP "$(get_cached_path http://cd.textfiles.com/simtel/simtel0101/simtel/c/snpd9707.zip)"
strip_simtel SNPD9707-simtel.ZIP
cmp SNPD9707.zip SNPD9707-simtel.ZIP
rm SNPD9707-simtel.ZIP

# snip-c.zip
get_cached https://web.archive.org/web/20050301124506/http://c.snippets.org/code/temp/snip-c.zip
cmp snip-c.zip "$(get_cached_path https://archive.org/download/Snippets.org-Snipc-08-17-2003/snip-c.zip)"
