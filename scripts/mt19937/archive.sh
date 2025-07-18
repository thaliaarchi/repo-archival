#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

NISHIMURA='Takuji Nishimura <nisimura@comb.math.keio.ac.jp>'
MATSUMOTO_KEIO='Makoto Matsumoto <matumoto@math.keio.ac.jp>'
MATSUMOTO_HIROSHIMA='Makoto Matsumoto <m-mat@math.sci.hiroshima-u.ac.jp>'
SAITO='Mutsuo Saito <saito@math.sci.hiroshima-u.ac.jp>'
THALIA='Thalia Archibald <thalia@archibald.dev>'

commit_urls=''

# TODO:
# - What was the first release? The 1998 release mentions that it addresses
#   suggestions (https://www.math.sci.hiroshima-u.ac.jp/m-mat/MT/VERSIONS/C-LANG/ver980409.html)
#   and the Japanese Wikipedia article mentions 1996 (https://ja.wikipedia.org/wiki/%E3%83%A1%E3%83%AB%E3%82%BB%E3%83%B3%E3%83%8C%E3%83%BB%E3%83%84%E3%82%A4%E3%82%B9%E3%82%BF).
# - Ierymenko's patch
# - 64-bit version
# - Not everything for the C project is archived. Go through the timemap to try
#   and get everything. I haven't touched 64-bit yet. I am not doing
#   implementations in other languages by other authors.
# - Replace reconstructed snapshots in files/ with patches.
# - Use `Co-authored-by:` trailer.
# - Compare tagged releases with official releases.

push_commit_url() {
  commit_urls="$commit_urls
$(printf '%-16s' "$1")$2"
}

add_file() {
  local file="$1"
  local date="$2" # Just for reference
  local url="$3"

  if [ -f "$file" ]; then
    rm "$file"
  fi
  mkdir -p "$(dirname "$file")"
  if [ "$url" = "-" ]; then
    touch "$file"
  else
    get_cached "$url" "$file"
    push_commit_url "$file" "$url"
  fi
  git add "$file"
}

add_local() {
  local file="$1"
  local date="$2" # Just for reference
  local local_file="$3"
  local url="$4"

  cp "../../files/mt19937/$local_file" "$file"
  git add "$file"
  push_commit_url "~$file" "$url"
}

add_archive() {
  local url="$1"
  local archive="${url##*/}"

  git rm -rq '*'
  get_cached "$url"
  push_commit_url "$url" ''
  tar xf "$archive"
  rm "$archive"
  find . \( -type d -name .git -prune \) -o \( -type f -print0 \) | xargs -0 chmod 644
  git add -Af
}

commit_list() {
  local ident="$1"
  local message="$2"
  commit "$ident" "$message
$commit_urls"
  commit_urls=''
}

mkdir mt19937
cd mt19937
git init -q

add_file  mt19937.c      '1997-11-02 14:15:44 +0900' https://web.archive.org/web/20000829080032/http://www.math.keio.ac.jp/matumoto/mt19937.c

# This version of mt19937int.c is from 2000-12-13 on Matsumoto's site. It
# doesn't contain any of the changes from Nishimura's site, but has a license
# header just like the ones that Nishimura puts in on 2000-12-14. This implies
# that at least the changes after the initial revision were made by Nishimura.
# It was probably created before 1998-04-06, because it doesn't have 1998/4/6 in
# the header or the changes from the 1998-12-15 snapshots.
add_local mt19937int.c    -                          1997-11-02/mt19937int.c https://web.archive.org/web/20010806225716/http://www.math.keio.ac.jp/matumoto/mt19937int.c

commit_list "$NISHIMURA 1997-11-02 14:15:44 +0000" 'Initial commit'

# Add the date to the headers and generate mt19937.out.
add_local mt19937.c      -                           1998-04-06/mt19937.c '(reconstructed)'
add_local mt19937.out    '1998-04-06 15:55 +0900'    1998-04-06/mt19937.out '(reconstructed)' # (not archived) http://www.math.keio.ac.jp/~nisimura/random/old/19991028/real/mt19937.out
add_local mt19937int.c   -                           1998-04-06/mt19937int.c '(reconstructed)'
add_file  mt19937int.out '1998-04-06 15:55:25 +0900' https://web.archive.org/web/19991006231247/http://www.math.keio.ac.jp/~nisimura/random/int/mt19937int.out

# Reverse the 1998-12-15 changes, by analogy to mt19937int.c. These would have
# existed, to complement the .out files.
add_local mt19937-1.c    -                           1998-04-06/mt19937-1.c '(reconstructed)'
add_file  mt19937-1.out  '1998-04-06 15:56:21 +0900' https://web.archive.org/web/20001002172737/http://www.math.keio.ac.jp/~nisimura/random/old/19991028/real1/mt19937-1.out
add_local mt19937-2.c    -                           1998-04-06/mt19937-2.c '(reconstructed)'
add_file  mt19937-2.out  '1998-04-06 15:56:59 +0900' https://web.archive.org/web/19991007020740/http://www.math.keio.ac.jp/~nisimura/random/real2/mt19937-2.out

commit_list "$NISHIMURA 1998-04-06 15:56:59 +0900" 'Add integer and other real versions'

add_file  mt.ps          '1998-04-21 13:55:18 +0900' https://web.archive.org/web/20000829080010/http://www.math.keio.ac.jp/~nisimura/random/doc/mt.ps
commit_list "$NISHIMURA 1998-04-21 13:55:18 +0900" 'Add paper'

# This revision of mt19937.c was not archived, but its modified time was saved.
add_local mt19937.c      '1998-12-15 15:54 +0900'    1998-12-15/mt19937.c '(reconstructed)' # (not archived) http://www.math.keio.ac.jp/~nisimura/random/old/19991028/real/mt19937.c

add_file  mt19937int.c   '1998-12-15 15:54:13 +0900' https://web.archive.org/web/20001002172719/http://www.math.keio.ac.jp/~nisimura/random/old/19991028/int/mt19937int.c
add_file  mt19937-1.c    '1998-12-15 15:54:45 +0900' https://web.archive.org/web/19991007005824/http://www.math.keio.ac.jp/~nisimura/random/real1/mt19937-1.c
add_file  mt19937-2.c    '1998-12-15 15:54:58 +0900' https://web.archive.org/web/20001002172742/http://www.math.keio.ac.jp/~nisimura/random/old/19991028/real2/mt19937-2.c
commit_list "$NISHIMURA 1998-12-15 15:54:58 +0900" 'Reference paper in headers'

git tag mt19937-1998

add_file  mt.pdf         '1999-01-06 12:31:11 +0900' https://web.archive.org/web/20000829080027/http://www.math.keio.ac.jp/~nisimura/random/doc/mt.pdf
commit_list "$NISHIMURA 1999-01-06 12:31:11 +0900" 'Convert paper to PDF'

# Reverse the 2000-12-14 changes.
add_local mt19937.c      -                           1999-10-28/mt19937.c '(reconstructed)'

add_file  mt19937.out    '1999-10-28 22:20:10 +0900' https://web.archive.org/web/20020214230728/http://www.math.keio.ac.jp/~nisimura/random/real/mt19937.out
add_file  mt19937int.c   '1999-10-28 22:19:42 +0900' https://web.archive.org/web/19991110074420/http://www.math.keio.ac.jp/~nisimura/random/int/mt19937int.c
add_file  mt19937int.out '1999-10-28 22:19:45 +0900' https://web.archive.org/web/19991110100826/http://www.math.keio.ac.jp/~nisimura/random/int/mt19937int.out
add_file  mt19937-1.c    '1999-10-28 22:20:46 +0900' https://web.archive.org/web/19991110112008/http://www.math.keio.ac.jp/~nisimura/random/real1/mt19937-1.c
add_file  mt19937-1.out  '1999-10-28 22:20:46 +0900' https://web.archive.org/web/20001002172821/http://www.math.keio.ac.jp/~nisimura/random/real1/mt19937-1.out
add_file  mt19937-2.c    '1999-10-28 22:21:36 +0900' https://web.archive.org/web/20001002172828/http://www.math.keio.ac.jp/~nisimura/random/real2/mt19937-2.c
add_file  mt19937-2.out  '1999-10-28 22:21:37 +0900' https://web.archive.org/web/20000520221954/http://www.math.keio.ac.jp/~nisimura/random/real2/mt19937-2.out
commit_list "$NISHIMURA 1999-10-28 22:21:37 +0900" 'Modify sgenrand seeding and add lsgenrand'

# These snapshots are early versions, that were later modified to link to the MT
# homepage.
add_local mt19937.c      '2000-12-13 12:33:10 +0900' 2000-12-13/mt19937.c    https://web.archive.org/web/20010806224916/http://www.math.keio.ac.jp/matumoto/mt19937.c
add_local mt19937int.c   '2000-12-13 12:35:03 +0900' 2000-12-13/mt19937int.c https://web.archive.org/web/20010806225716/http://www.math.keio.ac.jp/matumoto/mt19937int.c
commit_list "$MATSUMOTO_KEIO 2000-12-13 12:35:03 +0900" 'Link to the MT home page'

# This mt19937.c revision has a lot of changes since its last snapshot, so those
# have been split into earlier commits.
add_file  mt19937.c      '2000-12-14 17:42:06 +0900' https://web.archive.org/web/20020724012641/http://www.math.keio.ac.jp/~nisimura/random/real/mt19937.c
add_file  mt19937int.c   '2000-12-14 17:41:48 +0900' https://web.archive.org/web/20011203144707/http://www.math.keio.ac.jp/~nisimura/random/int/mt19937int.c
add_file  mt19937-1.c    '2000-12-14 17:42:30 +0900' https://web.archive.org/web/20020725215208/http://www.math.keio.ac.jp/~nisimura/random/real1/mt19937-1.c
add_file  mt19937-2.c    '2000-12-14 17:42:50 +0900' https://web.archive.org/web/20021010024851/http://www.math.keio.ac.jp/~nisimura/random/real2/mt19937-2.c
commit_list "$NISHIMURA 2000-12-14 17:42:50 +0900" 'Update headers in remaining files'

git tag mt19937-1999

add_archive https://web.archive.org/web/20010824083746/http://www.math.keio.ac.jp/matumoto/mt19937.tar
commit_list "$MATSUMOTO_KEIO 2001-04-02 10:48:59 UTC" 'Relicense for release'

add_file  mt19937-3.c    '2001-09-28 20:26:57 +0900' https://web.archive.org/web/20021010030219/http://www.math.keio.ac.jp/~nisimura/random/real3/mt19937-3.c
add_file  mt19937-3.out  '2001-09-28 20:27:03 +0900' https://web.archive.org/web/20021010025511/http://www.math.keio.ac.jp/~nisimura/random/real3/mt19937-3.out
commit_list "$NISHIMURA 2001-09-28 20:27:03 +0900" 'Generate reals on (0,1)-interval'

add_archive https://web.archive.org/web/20020409022857/http://www.math.keio.ac.jp/matumoto/CODES/MT2002/mt19937ar.tgz
commit_list "$NISHIMURA 2002-01-26 16:27:37 +0000, 2002-02-25 20:58:40 +0900" 'Improve initialization'

add_file  mt19937ar.c    '2004-02-26 09:41:33 +0900' https://web.archive.org/web/20040229101121/http://www.math.keio.ac.jp/matumoto/CODES/MT2002/mt19937ar.c
commit_list "$NISHIMURA 2004-02-26 09:41:33 +0900" 'Change slightly for C++'

add_archive https://web.archive.org/web/20040622083702/http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/MT2002/CODES/mt19937ar.tgz
commit_list "$MATSUMOTO_HIROSHIMA 2004-03-03 09:09:10 +0900" 'Update contact information to Hiroshima University'

git tag mt19937ar-2002

add_archive https://www.math.sci.hiroshima-u.ac.jp/m-mat/MT/MT2002/CODES/mt19937ar.sep.tgz
commit_list "$SAITO 2005-04-26 12:16:40 +0900" 'Separate library from main'

add_local README.md      '2023-03-20 06:09:06 -0600' README.md -
commit_urls=''
commit_list "$THALIA 2023-03-20 06:09:06 -0600, 2025-05-11 20:07:10 -0700" 'Add README.md with archive information'

git remote add origin https://github.com/thaliaarchi/mt19937-archive
