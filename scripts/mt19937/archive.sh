#!/bin/bash -e

commit_urls=''

push_commit_url() {
  commit_urls="$commit_urls
$1"
}

ia_raw() {
  sed -E 's,(^https://web.archive.org/web/[0-9]+)/,\1id_/,' <<< "$1"
}

add_file() {
  file="$1"
  date="$2"
  url="$3"

  if [ -f "$file" ]; then
    rm "$file"
  fi
  mkdir -p "$(dirname "$file")"
  if [ "$url" = "-" ]; then
    touch "$file"
  else
    wget --quiet "$(ia_raw "$url")" -O "$file"
    push_commit_url "$url"
  fi
  git add "$file"
}

add_archive() {
  url="$1"
  archive="../${url##*/}"

  git rm -r -- *
  [ -f "$archive" ] || wget --quiet "$url" -P ..
  push_commit_url "$url"
  tar xf "$archive"
  find . \( -type d -name .git -prune \) -o \( -type f -print0 \) | xargs -0 chmod 644
  git add -A
}

commit() {
  date="$1"
  message="$2"
  author_name="$3"
  author_email="$4"
  author_date="${date% / *}"
  committer_date="${date#* / }"

  GIT_AUTHOR_NAME="$author_name" GIT_AUTHOR_EMAIL="$author_email" GIT_AUTHOR_DATE="$author_date" \
  GIT_COMMITTER_NAME="$author_name" GIT_COMMITTER_EMAIL="$author_email" GIT_COMMITTER_DATE="$committer_date" \
  git commit -m "$message
$commit_urls"

  commit_urls=''
}

mkdir mt19937
cd mt19937
git init

add_file mt19937.c      '1997-11-02 14:15:44 +0000' https://web.archive.org/web/20000829080032/http://www.math.keio.ac.jp:80/matumoto/mt19937.c
commit '1997-11-02 14:15:44 +0000' 'Initial commit' 'Makoto Matsumoto' 'matumoto@math.keio.ac.jp'

# These files are early versions, but were later modified to add the site link.
# Manually rebase to spit into two commits for the code and adding the link.
# add_file mt19937.c      '2000-12-13 12:33:10 +0000' https://web.archive.org/web/20010806224916/http://www.math.keio.ac.jp:80/matumoto/mt19937.c
# add_file mt19937int.c   '2000-12-13 12:35:03 +0000' https://web.archive.org/web/20010806225716/http://www.math.keio.ac.jp:80/matumoto/mt19937int.c
# commit '2000-12-13 12:33:10 +0000' 'Link to the MT home page' 'Makoto Matsumoto' 'matumoto@math.keio.ac.jp'

add_file mt19937int.c   -                           - # (probably existed)
add_file mt19937int.out '1998-04-06 15:55:25 +0900' https://web.archive.org/web/19991006231247/http://www.math.keio.ac.jp:80/%7Enisimura/random/int/mt19937int.out
# add_file mt19937.c    -                           - # (probably existed)
add_file mt19937.out    '1998-04-06 15:55 +0900'    - # (not archived) http://www.math.keio.ac.jp/~nisimura/random/old/19991028/real/mt19937.out
add_file mt19937-1.c    -                           - # (probably existed)
add_file mt19937-1.out  '1998-04-06 15:56:21 +0900' https://web.archive.org/web/20001002172737/http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/real1/mt19937-1.out
add_file mt19937-2.c    -                           - # (probably existed)
add_file mt19937-2.out  '1998-04-06 15:56:59 +0900' https://web.archive.org/web/19991007020740/http://www.math.keio.ac.jp:80/%7Enisimura/random/real2/mt19937-2.out
commit '1998-04-06 15:56:59 +0900' 'Add test outputs' 'Takuji Nishimura' 'nisimura@comb.math.keio.ac.jp'

add_file doc/mt.ps      '1998-04-21 13:55:18 +0900' https://web.archive.org/web/20000829080010/http://www.math.keio.ac.jp:80/~nisimura/random/doc/mt.ps
commit '1998-04-21 13:55:18 +0900' 'Add paper' 'Takuji Nishimura' 'nisimura@comb.math.keio.ac.jp'

add_file mt19937int.c   '1998-12-15 15:54:13 +0900' https://web.archive.org/web/20001002172719/http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/int/mt19937int.c
# add_file mt19937.c    '1998-12-15 15:54 +0900'    - # (not archived) http://www.math.keio.ac.jp/~nisimura/random/old/19991028/real/mt19937.c
add_file mt19937-1.c    '1998-12-15 15:54:45 +0900' https://web.archive.org/web/19991007005824/http://www.math.keio.ac.jp:80/%7Enisimura/random/real1/mt19937-1.c
add_file mt19937-2.c    '1998-12-15 15:54:58 +0900' https://web.archive.org/web/20001002172742/http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/real2/mt19937-2.c
commit '1998-12-15 15:54:58 +0900' 'Add C sources' 'Takuji Nishimura' 'nisimura@comb.math.keio.ac.jp'

add_file doc/mt.pdf     '1999-01-06 12:31:11 +0900' https://web.archive.org/web/20000829080027/http://www.math.keio.ac.jp:80/~nisimura/random/doc/mt.pdf
commit '1999-01-06 12:31:11 +0900' 'Convert paper to PDF' 'Takuji Nishimura' 'nisimura@comb.math.keio.ac.jp'

add_file mt19937int.c   '1999-10-28 22:19:42 +0900' https://web.archive.org/web/19991110074420/http://www.math.keio.ac.jp:80/~nisimura/random/int/mt19937int.c
add_file mt19937int.out '1999-10-28 22:19:45 +0900' https://web.archive.org/web/19991110100826/http://www.math.keio.ac.jp:80/~nisimura/random/int/mt19937int.out
# add_file mt19937.c    -                           - # (probably existed)
add_file mt19937.out    '1999-10-28 22:20:10 +0900' https://web.archive.org/web/20020214230728/http://www.math.keio.ac.jp:80/~nisimura/random/real/mt19937.out
add_file mt19937-1.c    '1999-10-28 22:20:46 +0900' https://web.archive.org/web/19991110112008/http://www.math.keio.ac.jp:80/~nisimura/random/real1/mt19937-1.c
add_file mt19937-1.out  '1999-10-28 22:20:46 +0900' https://web.archive.org/web/20001002172821/http://www.math.keio.ac.jp:80/~nisimura/random/real1/mt19937-1.out
add_file mt19937-2.c    '1999-10-28 22:21:36 +0900' https://web.archive.org/web/20001002172828/http://www.math.keio.ac.jp:80/~nisimura/random/real2/mt19937-2.c
add_file mt19937-2.out  '1999-10-28 22:21:37 +0900' https://web.archive.org/web/20000520221954/http://www.math.keio.ac.jp:80/~nisimura/random/real2/mt19937-2.out
commit '1999-10-28 22:21:37 +0900' 'Modify sgenrand seeding and add lsgenrand' 'Takuji Nishimura' 'nisimura@comb.math.keio.ac.jp'

# Manually rebase, to move this mt19937.c earlier with changes mirroring other
# files.
add_file mt19937int.c   '2000-12-14 17:41:48 +0900' https://web.archive.org/web/20011203144707/http://www.math.keio.ac.jp:80/~nisimura/random/int/mt19937int.c
add_file mt19937.c      '2000-12-14 17:42:06 +0900' https://web.archive.org/web/20020724012641/http://www.math.keio.ac.jp:80/~nisimura/random/real/mt19937.c
add_file mt19937-1.c    '2000-12-14 17:42:30 +0900' https://web.archive.org/web/20020725215208/http://www.math.keio.ac.jp:80/~nisimura/random/real1/mt19937-1.c
add_file mt19937-2.c    '2000-12-14 17:42:50 +0900' https://web.archive.org/web/20021010024851/http://www.math.keio.ac.jp:80/~nisimura/random/real2/mt19937-2.c
commit '2000-12-14 17:42:50 +0900' 'Link to the MT home page' 'Takuji Nishimura' 'nisimura@comb.math.keio.ac.jp'

add_archive https://web.archive.org/web/20010824083746/http://www.math.keio.ac.jp:80/matumoto/mt19937.tar
commit '2001-04-02 10:48:59 UTC' 'Package release' 'Makoto Matsumoto' 'matumoto@math.keio.ac.jp'

add_file mt19937-3.c    '2001-09-28 20:26:57 +0900' https://web.archive.org/web/20021010030219/http://www.math.keio.ac.jp:80/~nisimura/random/real3/mt19937-3.c
add_file mt19937-3.out  '2001-09-28 20:27:03 +0900' https://web.archive.org/web/20021010025511/http://www.math.keio.ac.jp:80/~nisimura/random/real3/mt19937-3.out
commit '2001-09-28 20:27:03 +0900' 'Generate reals on (0,1)-interval' 'Takuji Nishimura' 'nisimura@comb.math.keio.ac.jp'

add_archive http://www.math.sci.hiroshima-u.ac.jp/m-mat/MT/MT2002/CODES/mt19937ar.tgz
# Unknown time
commit '2002-01-26 00:00:00 +0900 / 2004-03-03 09:09:10 +0900' 'Improve initialization' 'Takuji Nishimura' 'nisimura@comb.math.keio.ac.jp'

add_archive http://www.math.sci.hiroshima-u.ac.jp/m-mat/MT/MT2002/CODES/mt19937ar.sep.tgz
commit '2005-04-26 12:16:40 +0900' 'Separate library from main' 'Mutsuo Saito' 'saito@math.sci.hiroshima-u.ac.jp'
