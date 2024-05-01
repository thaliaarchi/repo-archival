#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# Some zips distributed by Simtel have a watermark appended to the end. Remove
# it.
strip_simtel() {
  local file="$1"
  cp -p "$file" "$file.bak"
  # 0x34 is 52
  if ! cmp <(tail -c54 "$file") <(printf '\x34\x00Distributed by the Simtel.Net(sm) world-wide network'); then
    echo "$file does not have Simtel watermark" >&2
    exit 1
  fi
  truncate -s-54 "$file"
  printf '\0\0' >> "$file"
  touch -r "$file.bak" "$file"
  rm "$file.bak"
}

mkdir snippets
cd snippets

# SNIP9_91.ZIP
get_cached http://cd.textfiles.com/simtel0692/MSDOS/C/SNIP9_91.ZIP

# SNIP0493.ZIP via Simtel and SNIP0493.ZIP via Coast to Coast Simtel
# (and SNIP0493.ARJ+SNIP0493.A01)
get_cached http://cd.textfiles.com/simtel20/MSDOS/C/SNIP0493.ZIP
get_cached 'http://cd.textfiles.com/simtelctc/disk2/C/SNIP0493.ZIP;1' SNIP0493-ctc.ZIP
mkdir SNIP0493_ZIP SNIP0493_ZIP-ctc SNIP0493_ARJ
7z x -oSNIP0493_ZIP SNIP0493.ZIP
7z x -oSNIP0493_ZIP-ctc SNIP0493-ctc.ZIP
7z x -oSNIP0493_ARJ "$(get_cached_path https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP0493.ARJ)"
7z x -oSNIP0493_ARJ "$(get_cached_path https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP0493.A01)"
diff SNIP0493_ZIP SNIP0493_ZIP-ctc
diff SNIP0493_ZIP SNIP0493_ARJ
rm -r SNIP0493_ZIP SNIP0493_ZIP-ctc SNIP0493_ARJ

# SNIP9404.ZIP
get_cached http://cd.textfiles.com/simtel/simtel/DISK1/DISC2/C/SNIP9404.ZIP
cmp SNIP9404.ZIP "$(get_cached_path https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP9404.ZIP)"

# SNPD9404.ZIP
get_cached http://cd.textfiles.com/simtel/simtel/DISK1/DISC2/C/SNPD9404.ZIP

# SNPD9503.ZIP
get_cached http://cd.textfiles.com/simtel9703/disk2/DISC2/C/SNPD9503.ZIP
cmp SNPD9503.ZIP "$(get_cached_path http://cd.textfiles.com/simtel/simtel9703/disk2/DISC2/C/SNPD9503.ZIP)"

# SNIP9510.ZIP via Simtel and SNIP9510.ZIP via Sezamfile (and snip9510.lzh)
get_cached http://cd.textfiles.com/simtel9703/disk2/DISC2/C/SNIP9510.ZIP SNIP9510-simtel.ZIP
cmp SNIP9510-simtel.ZIP "$(get_cached_path http://cd.textfiles.com/simtel/simtel9703/disk2/DISC2/C/SNIP9510.ZIP)"
strip_simtel SNIP9510-simtel.ZIP
get_cached https://archive.org/download/Sezamfile_97/Sezamfile97_1.iso/MSDOS%2FC%2FSNIP9510.ZIP SNIP9510.ZIP
mkdir SNIP9510_ZIP snip9510_lzh
7z x -oSNIP9510_ZIP SNIP9510.ZIP
7z x -osnip9510_lzh "$(get_cached_path https://web.archive.org/web/20071027093526/http://www.dcee.net/Files/Programm/C/snip9510.lzh)"
diff SNIP9510_ZIP snip9510_lzh
rm -r SNIP9510_ZIP snip9510_lzh

# SNIP9707.ZIP (and SNIP9707.zip/snip9707.zip via Simtel)
get_cached https://web.archive.org/web/20120130182709/http://www.brokersys.com/snippets/snip9707.zip SNIP9707.zip
get_cached http://cd.textfiles.com/simtel/stmsdos9709/disk2/DISC2/C/SNIP9707.ZIP SNIP9707-simtel.zip
cmp SNIP9707-simtel.zip "$(get_cached_path http://cd.textfiles.com/simtel0101/simtel/c/snip9707.zip)"
cmp SNIP9707-simtel.zip "$(get_cached_path http://cd.textfiles.com/simtel/simtel0101/simtel/c/snip9707.zip)"
cmp SNIP9707-simtel.zip "$(get_cached_path https://web.archive.org/web/20071027175145/http://www.dcee.net/Files/Programm/C/snip9707.zip)"
strip_simtel SNIP9707-simtel.zip
cmp SNIP9707.zip SNIP9707-simtel.zip
rm SNIP9707-simtel.zip

# SNPD9707.zip via Simtel
get_cached http://cd.textfiles.com/simtel/stmsdos9709/disk2/DISC2/C/SNPD9707.ZIP
cmp SNPD9707.ZIP "$(get_cached_path http://cd.textfiles.com/simtel0101/simtel/c/snpd9707.zip)"
cmp SNPD9707.ZIP "$(get_cached_path http://cd.textfiles.com/simtel/simtel0101/simtel/c/snpd9707.zip)"
strip_simtel SNPD9707.zip

# snip-c.zip
get_cached https://web.archive.org/web/20050301124506/http://c.snippets.org/code/temp/snip-c.zip
cmp snip-c.zip "$(get_cached_path https://archive.org/download/Snippets.org-Snipc-08-17-2003/snip-c.zip)"
