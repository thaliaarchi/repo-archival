#!/bin/sh -e

commit_urls=''

add_file() {
  file="$1"
  date="$2"
  timestamp="$3"
  url="$4"

  if [ -f "$file" ]; then
    rm "$file"
  fi
  mkdir -p "${file%/*}"
  if [ "$url" = "-" ]; then
    touch "$file"
  else
    wget --quiet "https://web.archive.org/web/${timestamp}id_/$url" -O "$file"
    commit_urls="$commit_urls
https://web.archive.org/web/$timestamp/$url"
  fi
  git add "$file"
}

commit() {
  date="$1"
  message="$2"

  # Email found in Nishimura's publications, and was used until July 2002, when
  # it became nisimura@sci.kj.yamagata-u.ac.jp
  GIT_AUTHOR_NAME='Takuji Nishimura' GIT_AUTHOR_EMAIL='nisimura@comb.math.keio.ac.jp' GIT_AUTHOR_DATE="$date" \
  GIT_COMMITTER_NAME='Takuji Nishimura' GIT_COMMITTER_EMAIL='nisimura@comb.math.keio.ac.jp' GIT_COMMITTER_DATE="$date" \
  git commit -m "$message
$commit_urls"

  commit_urls=''
}

mkdir mt19937
cd mt19937
git init

add_file int/mt19937int.c    -                           -              -
add_file int/mt19937int.out  '1998-04-06 15:55:25 +0900' 19991006231247 http://www.math.keio.ac.jp:80/%7Enisimura/random/int/mt19937int.out
add_file real/mt19937.c      -                           -              -
add_file real/mt19937.out    '1998-04-06 15:55 +0900'    -              -
add_file real1/mt19937-1.c   -                           -              -
add_file real1/mt19937-1.out '1998-04-06 15:56:21 +0900' 20001002172737 http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/real1/mt19937-1.out
add_file real2/mt19937-2.c   -                           -              -
add_file real2/mt19937-2.out '1998-04-06 15:56:59 +0900' 19991007020740 http://www.math.keio.ac.jp:80/%7Enisimura/random/real2/mt19937-2.out
commit '1998-04-06 15:56:59 +0900' 'Initial commit'

add_file doc/mt.ps           '1998-04-21 13:55:18 +0900' 20000829080010 http://www.math.keio.ac.jp:80/~nisimura/random/doc/mt.ps
commit '1998-04-21 13:55:18 +0900' 'Add paper'

add_file int/mt19937int.c    '1998-12-15 15:54:13 +0900' 20001002172719 http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/int/mt19937int.c
# add_file real/mt19937.c    '1998-12-15 15:54 +0900'    -              -
add_file real1/mt19937-1.c   '1998-12-15 15:54:45 +0900' 19991007005824 http://www.math.keio.ac.jp:80/%7Enisimura/random/real1/mt19937-1.c
add_file real2/mt19937-2.c   '1998-12-15 15:54:58 +0900' 20001002172742 http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/real2/mt19937-2.c
commit '1998-12-15 15:54:58 +0900' 'Add C sources'

add_file doc/mt.pdf          '1999-01-06 12:31:11 +0900' 20000829080027 http://www.math.keio.ac.jp:80/~nisimura/random/doc/mt.pdf
commit '1999-01-06 12:31:11 +0900' 'Convert paper to PDF'

add_file int/mt19937int.c    '1999-10-28 22:19:42 +0900' 19991110074420 http://www.math.keio.ac.jp:80/~nisimura/random/int/mt19937int.c
add_file int/mt19937int.out  '1999-10-28 22:19:45 +0900' 19991110100826 http://www.math.keio.ac.jp:80/~nisimura/random/int/mt19937int.out
# add_file real/mt19937.c    -                           -              -
add_file real/mt19937.out    '1999-10-28 22:20:10 +0900' 20020214230728 http://www.math.keio.ac.jp:80/~nisimura/random/real/mt19937.out
add_file real1/mt19937-1.c   '1999-10-28 22:20:46 +0900' 19991110112008 http://www.math.keio.ac.jp:80/~nisimura/random/real1/mt19937-1.c
add_file real1/mt19937-1.out '1999-10-28 22:20:46 +0900' 20001002172821 http://www.math.keio.ac.jp:80/~nisimura/random/real1/mt19937-1.out
add_file real2/mt19937-2.c   '1999-10-28 22:21:36 +0900' 20001002172828 http://www.math.keio.ac.jp:80/~nisimura/random/real2/mt19937-2.c
add_file real2/mt19937-2.out '1999-10-28 22:21:37 +0900' 20000520221954 http://www.math.keio.ac.jp:80/~nisimura/random/real2/mt19937-2.out
commit '1999-10-28 22:21:37 +0900' 'Modify sgenrand seeding and add lsgenrand'

add_file int/mt19937int.c    '2000-12-14 17:41:48 +0900' 20011203144707 http://www.math.keio.ac.jp:80/~nisimura/random/int/mt19937int.c
add_file real/mt19937.c      '2000-12-14 17:42:06 +0900' 20020724012641 http://www.math.keio.ac.jp:80/~nisimura/random/real/mt19937.c
add_file real1/mt19937-1.c   '2000-12-14 17:42:30 +0900' 20020725215208 http://www.math.keio.ac.jp:80/~nisimura/random/real1/mt19937-1.c
add_file real2/mt19937-2.c   '2000-12-14 17:42:50 +0900' 20021010024851 http://www.math.keio.ac.jp:80/~nisimura/random/real2/mt19937-2.c
commit '2000-12-14 17:42:50 +0900' 'Link to the MT home page'

add_file real3/mt19937-3.c   '2001-09-28 20:26:57 +0900' 20021010030219 http://www.math.keio.ac.jp:80/~nisimura/random/real3/mt19937-3.c
add_file real3/mt19937-3.out '2001-09-28 20:27:03 +0900' 20021010025511 http://www.math.keio.ac.jp:80/~nisimura/random/real3/mt19937-3.out
commit '2001-09-28 20:27:03 +0900' 'Generate reals on (0,1)-interval'

# Manually rebase, to move real/mt19937.c earlier with changes mirroring other
# files.
