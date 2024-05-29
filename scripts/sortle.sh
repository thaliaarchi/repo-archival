#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - https://github.com/graue/sortle
# - https://codeberg.org/graue/sortle-js
# - http://www.oceanbase.org/graue/sortle/
# - Review preferred author idents.
# - List sources in trailers.

# https://web.archive.org/web/20060504171148/http://esoteric.voxelperfect.net:80/files/sortle/
#   doc/          2005-07-21 01:26     -
#   impl/         2005-12-28 01:26     -
# https://web.archive.org/web/20161206015454/http://esoteric.voxelperfect.net/files/sortle/
#   doc/          2005-07-21 01:26     -
#   impl/         2012-03-13 01:26     -
#   src/          2012-03-11 11:48     -
#   _readme.txt   2012-03-11 11:48   196
# https://web.archive.org/web/20160414105502/http://esoteric.voxelperfect.net/files/sortle/src/
#   0test.sort    2012-02-26 11:02    56
#   bct.sort      2012-02-28 09:26  2245
#   digroot.sort  2012-03-11 11:48   570
#   fib.sort      2012-02-26 11:02  1112
#   hello1.sort   2012-02-26 11:02   363
#   hello2.sort   2012-02-26 11:02    48
#   hello2b.sort  2012-02-26 11:02   126
#   hello3.sort   2012-02-26 11:02    70
#   quine.sort    2012-03-11 11:48  1193
#
# HTTP Last-Modified dates:
#   doc/sortle.pdf    2005-07-21 01:26:05 +0000
#   src/hello2b.sort  2012-02-26 11:02:45 +0000
#   src/hello3.sort   2012-02-26 11:02:45 +0000
#   src/fib.sort      2012-02-26 11:02:45 +0000
#   src/0test.sort    2012-02-26 11:02:45 +0000
#   src/hello2.sort   2012-02-26 11:02:45 +0000
#   src/hello1.sort   2012-02-26 11:02:45 +0000
#   src/bct.sort      2012-02-28 09:26:13 +0000
#   src/quine.sort    2012-03-11 11:48:05 +0000
#   src/digroot.sort  2012-03-11 11:48:05 +0000
#   impl/sortle.pl    2012-03-13 01:26:17 +0000

mkdir sortle
cd sortle
git init -q

esofiles="$(submodule_path https://github.com/graue/esofiles)"

add_file() {
  local url="$1"
  local path="${url#*/files/sortle/}"
  local basename="${path##*/}"
  mkdir -p "$(dirname "$path")"
  get_cached "$url" "$path"
  # Verify that the FTP versions are the same.
  diff "$esofiles/sortle/$path" "$path"
  # Verify that the sortle.c versions are the same.
  if [[ -f $basename ]]; then
    diff "$basename" "$path"
    git rm -q "$basename"
  fi
  git add "$path"
}

export AUTHOR='Graue <graue@oceanbase.org>'

tar xf "$esofiles/sortle/impl/sortle-0.8.2.tar.gz" --strip-components=1
git add .
commit latest 'Sortle 0.8.2' --trailer=Source:https://github.com/graue/esofiles/blob/master/sortle/impl/sortle-0.8.2.tar.gz

add_file 'https://web.archive.org/web/20160414105457/http://esoteric.voxelperfect.net/files/sortle/doc/sortle.pdf'
commit '2005-07-21 01:26:05 +0000' 'Add spec'

git rm -qr .
git checkout HEAD -- doc/sortle.pdf
tar xf "$esofiles/sortle/impl/sortle-1.0.tar.gz" --strip-components=1
git add .
commit latest 'Sortle 1.0' --trailer=Source:https://github.com/graue/esofiles/blob/master/sortle/impl/sortle-1.0.tar.gz

add_file 'https://web.archive.org/web/20161206021742/http://esoteric.voxelperfect.net/files/sortle/src/0test.sort'
add_file 'https://web.archive.org/web/20161206015808/http://esoteric.voxelperfect.net/files/sortle/src/fib.sort'
add_file 'https://web.archive.org/web/20161206021953/http://esoteric.voxelperfect.net/files/sortle/src/hello1.sort'
add_file 'https://web.archive.org/web/20161206021921/http://esoteric.voxelperfect.net/files/sortle/src/hello2.sort'
add_file 'https://web.archive.org/web/20161206012746/http://esoteric.voxelperfect.net/files/sortle/src/hello2b.sort'
add_file 'https://web.archive.org/web/20161206012811/http://esoteric.voxelperfect.net/files/sortle/src/hello3.sort'
commit '2012-02-26 11:02:45 +0000' 'Add 0test.sort, fib.sort, and hello2b.sort'

add_file 'https://web.archive.org/web/20160309220859/http://esoteric.voxelperfect.net/files/sortle/src/bct.sort'
commit '2012-02-28 09:26:13 +0000' 'Add bct.sort'

add_file 'https://web.archive.org/web/20161206014818/http://esoteric.voxelperfect.net/files/sortle/src/digroot.sort'
add_file 'https://web.archive.org/web/20160414105507/http://esoteric.voxelperfect.net/files/sortle/src/quine.sort'
commit '2012-03-11 11:48:05 +0000' 'Add digroot.sort and quine.sort'

add_file 'https://web.archive.org/web/20160414105510/http://esoteric.voxelperfect.net/files/sortle/impl/sortle.pl'
commit '2012-03-13 01:26:17 +0000' 'Add sortle.pl'
