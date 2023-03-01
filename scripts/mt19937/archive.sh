#!/bin/sh -e

commit() {
  file="$1"
  date="$2"
  timestamp="$3"
  url="$4"

  status="Add"
  if [ -f "$file" ]; then
    rm "$file"
    status="Update"
  fi

  mkdir -p "${file%/*}"
  if [ "$url" = "-" ]; then
    touch "$file"
    source='(File not saved)'
  else
    wget "https://web.archive.org/web/${timestamp}id_/$url" -O "$file"
    source="https://web.archive.org/web/$timestamp/$url"
  fi
  git add "$file"

  GIT_AUTHOR_NAME='Takuji Nishimura' GIT_AUTHOR_EMAIL='' GIT_AUTHOR_DATE="$date" \
  GIT_COMMITTER_NAME='Takuji Nishimura' GIT_COMMITTER_EMAIL='' GIT_COMMITTER_DATE="$date" \
  git commit -m "$status $file

$source"
}

mkdir mt19937
cd mt19937
git init

commit old/19991028/real/mt19937.out    '1998-04-06 15:55 +0900'    -              -
commit int/mt19937int.out               '1998-04-06 15:55:25 +0900' 19991006231247 http://www.math.keio.ac.jp:80/%7Enisimura/random/int/mt19937int.out
commit old/19991028/int/mt19937int.out  '1998-04-06 15:55:25 +0900' 20001121023800 http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/int/mt19937int.out
commit old/19991028/real1/mt19937-1.out '1998-04-06 15:56:21 +0900' 20001002172737 http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/real1/mt19937-1.out
commit old/19991028/real2/mt19937-2.out '1998-04-06 15:56:59 +0900' 20001002172748 http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/real2/mt19937-2.out
commit real2/mt19937-2.out              '1998-04-06 15:56:59 +0900' 19991007020740 http://www.math.keio.ac.jp:80/%7Enisimura/random/real2/mt19937-2.out
commit doc/mt.ps                        '1998-04-21 13:55:18 +0900' 20000829080010 http://www.math.keio.ac.jp:80/~nisimura/random/doc/mt.ps
commit old/19991028/real/mt19937.c      '1998-12-15 15:54 +0900'    -              -
commit old/19991028/int/mt19937int.c    '1998-12-15 15:54:13 +0900' 20001002172719 http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/int/mt19937int.c
commit old/19991028/real1/mt19937-1.c   '1998-12-15 15:54:45 +0900' 20001002172732 http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/real1/mt19937-1.c
commit real1/mt19937-1.c                '1998-12-15 15:54:45 +0900' 19991007005824 http://www.math.keio.ac.jp:80/%7Enisimura/random/real1/mt19937-1.c
commit old/19991028/real2/mt19937-2.c   '1998-12-15 15:54:58 +0900' 20001002172742 http://www.math.keio.ac.jp:80/~nisimura/random/old/19991028/real2/mt19937-2.c
commit doc/mt.pdf                       '1999-01-06 12:31:11 +0900' 20000829080027 http://www.math.keio.ac.jp:80/~nisimura/random/doc/mt.pdf
commit int/mt19937int.c                 '1999-10-28 22:19:42 +0900' 19991110074420 http://www.math.keio.ac.jp:80/~nisimura/random/int/mt19937int.c
commit int/mt19937int.out               '1999-10-28 22:19:45 +0900' 19991110100826 http://www.math.keio.ac.jp:80/~nisimura/random/int/mt19937int.out
commit real/mt19937.out                 '1999-10-28 22:20:10 +0900' 20020214230728 http://www.math.keio.ac.jp:80/~nisimura/random/real/mt19937.out
commit real1/mt19937-1.c                '1999-10-28 22:20:46 +0900' 19991110112008 http://www.math.keio.ac.jp:80/~nisimura/random/real1/mt19937-1.c
commit real1/mt19937-1.out              '1999-10-28 22:20:46 +0900' 20001002172821 http://www.math.keio.ac.jp:80/~nisimura/random/real1/mt19937-1.out
commit real2/mt19937-2.c                '1999-10-28 22:21:36 +0900' 20001002172828 http://www.math.keio.ac.jp:80/~nisimura/random/real2/mt19937-2.c
commit real2/mt19937-2.out              '1999-10-28 22:21:37 +0900' 20000520221954 http://www.math.keio.ac.jp:80/~nisimura/random/real2/mt19937-2.out
commit int/mt19937int.c                 '2000-12-14 17:41:48 +0900' 20011203144707 http://www.math.keio.ac.jp:80/~nisimura/random/int/mt19937int.c
commit real/mt19937.c                   '2000-12-14 17:42:06 +0900' 20020724012641 http://www.math.keio.ac.jp:80/~nisimura/random/real/mt19937.c
commit real1/mt19937-1.c                '2000-12-14 17:42:30 +0900' 20020725215208 http://www.math.keio.ac.jp:80/~nisimura/random/real1/mt19937-1.c
commit real2/mt19937-2.c                '2000-12-14 17:42:50 +0900' 20021010024851 http://www.math.keio.ac.jp:80/~nisimura/random/real2/mt19937-2.c
commit real3/mt19937-3.c                '2001-09-28 20:26:57 +0900' 20021010030219 http://www.math.keio.ac.jp:80/~nisimura/random/real3/mt19937-3.c
commit real3/mt19937-3.out              '2001-09-28 20:27:03 +0900' 20021010025511 http://www.math.keio.ac.jp:80/~nisimura/random/real3/mt19937-3.out
