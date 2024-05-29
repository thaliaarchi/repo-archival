#!/bin/bash -e

. base.sh

export AUTHOR='Edwin Brady <e.c.brady@durham.ac.uk>'

add_file() {
  local file="$1"
  local revision="$2"
  local date="$3"
  local url="$4"

  if [ -f "$file" ]; then
    rm "$file"
  fi
  mkdir -p "$(dirname "$file")"
  if [ "$url" = "-" ]; then
    echo 'File not archived' > "$file"
  else
    get_cached "$url" "$file"
  fi
  git add -f "$file"
}

commit_file() {
  local file="$1"
  local revision="$2"
  local date="$3"
  local url="$4"

  add_file "$file" "$revision" "$date" "$url"
  commit "$date" "[$revision] $file

$url"
}

mkdir -p wspace
cd wspace
mkdir edwinb-wspace
cd edwinb-wspace
git init -q

# The latest date of a group of files is used for the commit date. The exception
# is for PHP files, where the only available date is the HTTP Date header, which
# is not immediately after the modification time, so the first date is used.

# ~r_ denotes a revision dated by HTTP Date, instead of HTTP Last-Modified.

# The files from the Oxford mirror sometimes have times offset an hour earlier.

add_file    VM.hs                                                                           r1 '2003-03-31 00:12    +0100' -
add_file    Input.hs                                                                        r1 '2003-03-31 00:12:22 +0100' https://web.archive.org/web/20030624014503/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Input.hs
add_file    Tokens.hs                                                                       r1 '2003-03-31 00:12:49 +0100' https://web.archive.org/web/20030624015950/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Tokens.hs
# add_file  Input.hs                                                                        r1 '2003-03-31 00:12:22 +0100' wspace.tgz:WSpace/Input.hs
# add_file  Tokens.hs                                                                       r1 '2003-03-31 00:12:49 +0100' wspace-0.3.tgz:WSpace/Tokens.hs
# add_file  Tokens.hs                                                                       r1 '2003-03-31 00:12:49 +0100' wspace.tgz:WSpace/Tokens.hs
commit '2003-03-31 00:12:49 +0100' 'Add VM source'

# These programs, except for fact.ws, are identical in all sources.
# add_file  examples/calc.ws                                                                r1 '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030624021432/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/calc.ws
# add_file  examples/count.ws                                                               r1 '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030624021255/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/count.ws
add_file    examples/fact.ws                                                                r1 '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030624022311/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/fact.ws
# add_file  examples/hworld.ws                                                              r1 '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030818000703/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/hworld.ws
# add_file  examples/name.ws                                                                r1 '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030624023117/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/name.ws

add_file    examples/calc.ws                                                                r1 '2003-03-31 00:20:28 +0100' https://web.archive.org/web/20030405142656/http://compsoc.dur.ac.uk:80/whitespace/calc.ws
add_file    examples/count.ws                                                               r1 '2003-03-31 00:20:28 +0100' https://web.archive.org/web/20030405165300/http://compsoc.dur.ac.uk:80/whitespace/count.ws
add_file    examples/hworld.ws                                                              r1 '2003-03-31 00:20:28 +0100' https://web.archive.org/web/20030405143641/http://compsoc.dur.ac.uk:80/whitespace/hworld.ws
add_file    examples/name.ws                                                                r1 '2003-03-31 00:20:28 +0100' https://web.archive.org/web/20030415045931/http://compsoc.dur.ac.uk:80/whitespace/name.ws

# add_file  examples/calc.ws                                                                r1 '2003-03-30 23:20:28 +0100' https://web.archive.org/web/20030614173418/http://mirror.ox.ac.uk:80/Mirrors/whitespace/calc.ws
# add_file  examples/hworld.ws                                                              r1 '2003-03-30 23:20:28 +0100' https://web.archive.org/web/20040325163854/http://mirror.ox.ac.uk:80/Mirrors/whitespace/hworld.ws
# add_file  examples/name.ws                                                                r1 '2003-03-30 23:20:28 +0100' https://web.archive.org/web/20030825043208/http://mirror.ox.ac.uk:80/Mirrors/whitespace/name.ws

# add_file  examples/calc.ws                                                                r1 '2003-03-31 00:19:39 +0100' whitespace_0.1-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/calc.ws
# add_file  examples/count.ws                                                               r1 '2003-03-31 00:19:39 +0100' whitespace_0.1-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/count.ws
# add_file  examples/fact.ws                                                                r1 '2003-03-31 00:19:39 +0100' whitespace_0.1-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/fact.ws
# add_file  examples/hworld.ws                                                              r1 '2003-03-31 00:19:39 +0100' whitespace_0.1-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/hworld.ws
# add_file  examples/name.ws                                                                r1 '2003-03-31 00:19:39 +0100' whitespace_0.1-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/name.ws

# add_file  examples/calc.ws                                                                r1 '2003-03-31 00:19:39 +0100' wspace.tgz:WSpace/calc.ws
# add_file  examples/count.ws                                                               r1 '2003-03-31 00:19:39 +0100' wspace.tgz:WSpace/count.ws
# add_file  examples/fact.ws                                                                r1 '2003-03-31 00:19:39 +0100' wspace.tgz:WSpace/fact.ws
# add_file  examples/hworld.ws                                                              r1 '2003-03-31 00:19:39 +0100' wspace.tgz:WSpace/hworld.ws
# add_file  examples/name.ws                                                                r1 '2003-03-31 00:19:39 +0100' wspace.tgz:WSpace/name.ws

# add_file  examples/calc.ws                                                                r1 '2003-03-31 00:19:39 +0100' whitespace_0.2-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/calc.ws
# add_file  examples/count.ws                                                               r1 '2003-03-31 00:19:39 +0100' whitespace_0.2-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/count.ws
# add_file  examples/fact.ws                                                                r1 '2003-03-31 00:19:39 +0100' whitespace_0.2-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/fact.ws
# add_file  examples/hworld.ws                                                              r1 '2003-03-31 00:19:39 +0100' whitespace_0.2-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/hworld.ws
# add_file  examples/name.ws                                                                r1 '2003-03-31 00:19:39 +0100' whitespace_0.2-1_i386.deb:data.tar.gz:./usr/share/doc/whitespace/examples/name.ws

# add_file  examples/calc.ws                                                                r1 '2003-03-31 00:19:39 +0100' whitespace-0.2-1.i386.rpm:./usr/share/doc/whitespace/examples/calc.ws
# add_file  examples/count.ws                                                               r1 '2003-03-31 00:19:39 +0100' whitespace-0.2-1.i386.rpm:./usr/share/doc/whitespace/examples/count.ws
# add_file  examples/fact.ws                                                                r1 '2003-03-31 00:19:39 +0100' whitespace-0.2-1.i386.rpm:./usr/share/doc/whitespace/examples/fact.ws
# add_file  examples/hworld.ws                                                              r1 '2003-03-31 00:19:39 +0100' whitespace-0.2-1.i386.rpm:./usr/share/doc/whitespace/examples/hworld.ws
# add_file  examples/name.ws                                                                r1 '2003-03-31 00:19:39 +0100' whitespace-0.2-1.i386.rpm:./usr/share/doc/whitespace/examples/name.ws

# add_file  examples/calc.ws                                                                r1 '2003-03-31 00:19:39 +0100' wspace-0.3.tgz:WSpace/examples/calc.ws
# add_file  examples/count.ws                                                               r1 '2003-03-31 00:19:39 +0100' wspace-0.3.tgz:WSpace/examples/count.ws
# add_file  examples/hworld.ws                                                              r1 '2003-03-31 00:19:39 +0100' wspace-0.3.tgz:WSpace/examples/hworld.ws
# add_file  examples/name.ws                                                                r1 '2003-03-31 00:19:39 +0100' wspace-0.3.tgz:WSpace/examples/name.ws
commit '2003-03-31 00:19:39 +0100' 'Add example Whitespace programs'

add_file    examples/fact.ws                                                                r1 '2003-03-31 00:39:48 +0100' https://web.archive.org/web/20030405141644/http://compsoc.dur.ac.uk:80/whitespace/fact.ws
# add_file  examples/fact.ws                                                                r1 '2003-03-30 23:39:48 +0100' https://web.archive.org/web/20030614173531/http://mirror.ox.ac.uk:80/Mirrors/whitespace/fact.ws
commit '2003-03-31 00:39:48 +0100' 'Fix fact.ws base case'

commit_file docs/home.css                                                                   r1 '2003-03-31 00:28:06 +0100' https://web.archive.org/web/20030405142925/http://compsoc.dur.ac.uk:80/whitespace/home.css
# add_file  docs/home.css                                                                   r1 '2003-03-31 00:28:06 +0100' https://web.archive.org/web/20030825044404/http://mirror.ox.ac.uk:80/Mirrors/whitespace/home.css

# Exclude packaging metadata
# add_file  whitespace_0.1-1_source.changes                                                 r1 '2003-03-31 11:04:57 +0100' https://web.archive.org/web/20030803223653/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1_source.changes

add_file    COPYING                                                                         r1 '2003-03-31 13:35:20 +0100' https://web.archive.org/web/20030818001123/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/COPYING
add_file    main.hs                                                                         r1 '2003-03-31 13:39:18 +0100' https://web.archive.org/web/20030624022604/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/main.hs
add_file    Makefile                                                                        r1 '2003-03-31 13:39:29 +0100' https://web.archive.org/web/20030624015551/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Makefile
# add_file  COPYING                                                                         r1 '2003-03-31 13:35:20 +0100' wspace-0.3.tgz:WSpace/COPYING
# add_file  COPYING                                                                         r1 '2003-03-31 13:35:20 +0100' wspace.tgz:WSpace/COPYING
# add_file  Makefile                                                                        r1 '2003-03-31 13:39:29 +0100' wspace-0.3.tgz:WSpace/Makefile
# add_file  Makefile                                                                        r1 '2003-03-31 13:39:29 +0100' wspace.tgz:WSpace/Makefile
commit '2003-03-31 13:39:29 +0100' 'Add main and build'

# tutorial.html in debian/ was not archived, but md5sums indicates it is the
# same as the other.
add_file    docs/tutorial.html                                                              r1 '2003-03-31 13:47:05 +0100' https://web.archive.org/web/20030629112603/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/docs/tutorial.html
# add_file  whitespace-0.1/debian/whitespace/usr/share/doc/whitespace/tutorial.html         r1 '2003-03-31 13:47    +0100' -
commit '2003-03-31 13:47:05 +0100' 'Add language tutorial'

# Exclude packaging metadata
# add_file  whitespace_0.1.orig.tar.gz                                                      r1 '2003-03-31 13:47    +0100' -
# add_file  whitespace-0.1/debian/whitespace/usr/share/doc/whitespace/changelog.Debian.gz   r1 '2003-03-31 15:04    +0100' -
# add_file  whitespace-0.1/debian/whitespace/usr/share/doc/whitespace/copyright             r1 '2003-03-31 15:04    +0100' -
# add_file  whitespace-0.1/debian/whitespace/usr/share/man/man1/wspace.1.gz                 r1 '2003-03-31 15:04    +0100' -
# add_file  whitespace-0.1/debian/changelog                                                 r1 '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030827083557/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/changelog
# add_file  whitespace-0.1/debian/compat                                                    r1 '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629104608/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/compat
# add_file  whitespace-0.1/debian/control                                                   r1 '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629104803/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/control
# add_file  whitespace-0.1/debian/copyright                                                 r1 '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629105053/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/copyright
# add_file  whitespace-0.1/debian/rules                                                     r1 '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629110105/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/rules
# add_file  whitespace-0.1/debian/whitespace.examples                                       r1 '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629110008/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.examples
# add_file  whitespace-0.1/debian/whitespace.install                                        r1 '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629110020/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.install
# add_file  whitespace-0.1/debian/whitespace.manpages                                       r1 '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629110513/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.manpages
# add_file  whitespace-0.1/debian/wspace.1                                                  r1 '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629111334/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/wspace.1

add_file    contrib/whitespace.ws.c                                                         r1 '2003-03-31 15:05:46 +0100' https://web.archive.org/web/20030405144531/http://compsoc.dur.ac.uk:80/whitespace/whitespace.ws.c
# add_file  contrib/whitespace.ws.c                                                         r1 '2003-03-31 14:05:46 +0100' https://web.archive.org/web/20030614173447/http://mirror.ox.ac.uk:80/Mirrors/whitespace/whitespace.ws.c
commit '2003-03-31 15:05:46 +0100' 'Add Whitespace and C polyglot program'

commit_file whitespace-0.1/debian/whitespace/usr/bin/wspace                                 r1 '2003-03-31 15:20    +0100' -

add_file    Tokens.hi                                                                       r1 '2003-03-31 15:20:13 +0100' https://web.archive.org/web/20030624015422/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Tokens.hi
add_file    Tokens.o                                                                        r1 '2003-03-31 15:20:14 +0100' https://web.archive.org/web/20030624015825/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Tokens.o
add_file    VM.hi                                                                           r1 '2003-03-31 15:20:17 +0100' https://web.archive.org/web/20030624020343/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/VM.hi
add_file    VM.o                                                                            r1 '2003-03-31 15:20:23 +0100' https://web.archive.org/web/20030624020612/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/VM.o
add_file    Input.hi                                                                        r1 '2003-03-31 15:20:24 +0100' https://web.archive.org/web/20030624014431/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Input.hi
add_file    Input.o                                                                         r1 '2003-03-31 15:20:26 +0100' https://web.archive.org/web/20030624014855/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Input.o
add_file    Main.hi                                                                         r1 '2003-03-31 15:20:27 +0100' https://web.archive.org/web/20030624015054/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Main.hi
add_file    main.o                                                                          r1 '2003-03-31 15:20:28 +0100' https://web.archive.org/web/20030624022631/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/main.o
add_file    wspace                                                                          r1 '2003-03-31 15:20:30 +0100' https://web.archive.org/web/20030817182401/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/wspace
commit '2003-03-31 15:20:30 +0100' 'Compile Whitespace 0.1'

# Exclude packaging metadata
# add_file  whitespace-0.1/debian/whitespace.docs                                           r1 '2003-03-31 15:19    +0100' -
# add_file  whitespace_0.1-1.diff.gz                                                        r1 '2003-03-31 15:20    +0100' -
# add_file  whitespace-0.1/build-stamp                                                      r1 '2003-03-31 15:20:30 +0100' https://web.archive.org/web/20030624021150/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/build-stamp
# add_file  whitespace-0.1/debian/files                                                     r1 '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030827091055/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/files
# add_file  whitespace-0.1/debian/whitespace.substvars                                      r1 '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030629110823/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.substvars
# add_file  whitespace-0.1/debian/whitespace/DEBIAN/control                                 r1 '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030910053927/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace/DEBIAN/control
# add_file  whitespace-0.1/debian/whitespace/DEBIAN/md5sums                                 r1 '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030910054636/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace/DEBIAN/md5sums
# add_file  whitespace_0.1-1_i386.deb                                                       r1 '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030803223310/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1_i386.deb
# add_file  whitespace_0.1-1.dsc                                                            r1 '2003-03-31 15:20:40 +0100' https://web.archive.org/web/20030621215923/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1.dsc
# add_file  whitespace_0.1-1_i386.changes                                                   r1 '2003-03-31 15:20:43 +0100' https://web.archive.org/web/20030621220500/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1_i386.changes

# Oxford version is identical, but decompressed.
commit_file wspace.tgz                                                                      r1 '2003-03-31 16:35:26 +0100' https://web.archive.org/web/20030423000836/http://compsoc.dur.ac.uk:80/whitespace/wspace.tgz
# add_file  wspace.tgz                                                                      r1 '2003-03-31 15:35:26 +0100' https://web.archive.org/web/20040327100043/http://mirror.ox.ac.uk:80/Mirrors/whitespace/wspace.tgz

add_file    examples/fibonacci.ws                                                           r1 '2003-03-31 17:30:52 +0100' https://web.archive.org/web/20030405143602/http://compsoc.dur.ac.uk:80/whitespace/fibonacci.ws
# add_file  examples/fibonacci.ws                                                           r1 '2003-03-31 16:30:52 +0100' https://web.archive.org/web/20030614173420/http://mirror.ox.ac.uk:80/Mirrors/whitespace/fibonacci.ws
commit '2003-03-31 17:30:52 +0100' 'Add Fibonacci program'

# Remove Whitespace 0.1 binaries
git rm -q -- *.hi *.o wspace

# Don't include packages
# add_file  whitespace_0.2-1.dsc                                                            r1 '2003-03-31 17:36:05 +0100' https://web.archive.org/web/20040120123855/http://compsoc.dur.ac.uk:80/whitespace/whitespace_0.2-1.dsc
# add_file  whitespace_0.2-1_i386.deb                                                       r1 '2003-03-31 17:55:47 +0100' https://web.archive.org/web/20030423000129/http://compsoc.dur.ac.uk:80/whitespace/whitespace_0.2-1_i386.deb
# add_file  whitespace_0.2-1_i386.deb                                                       r1 '2003-03-31 16:55:47 +0100' https://web.archive.org/web/20040325164055/http://mirror.ox.ac.uk:80/Mirrors/whitespace/whitespace_0.2-1_i386.deb
# add_file  whitespace-0.2-1.i386.rpm                                                       r1 '2003-04-01 10:42:55 +0100' https://web.archive.org/web/20030422235920/http://compsoc.dur.ac.uk:80/whitespace/whitespace-0.2-1.i386.rpm
# add_file  whitespace-0.2-1.i386.rpm                                                       r1 '2003-04-01 09:42:55 +0100' https://web.archive.org/web/20040325164219/http://mirror.ox.ac.uk:80/Mirrors/whitespace/whitespace-0.2-1.i386.rpm

# wspace_osx.gz and wspace_solaris.gz are returned decompressed by IA. Rather
# than recompressing them, remove the extension.
add_file    wspace_osx                                                                      r1 '2003-04-01 19:35:10 +0100' https://web.archive.org/web/20060218224133/http://compsoc.dur.ac.uk:80/whitespace/wspace_osx.gz
commit '2003-04-01 19:35:10 +0100' 'Compile Whitespace 0.2 for OSX'

add_file    wspace_solaris                                                                  r1 '2003-04-01 20:30:34 +0100' https://web.archive.org/web/20060218224258/http://compsoc.dur.ac.uk:80/whitespace/wspace_solaris.gz
commit '2003-04-01 20:30:34 +0100' 'Compile Whitespace 0.2 for Solaris'

commit_file whitespace.pl                                                                   r1 '2003-04-01 20:34:12 +0100' https://web.archive.org/web/20030423000132/http://compsoc.dur.ac.uk:80/whitespace/whitespace.pl
# add_file  whitespace.pl                                                                   r1 '2003-04-01 19:34:12 +0100' https://web.archive.org/web/20040325163708/http://mirror.ox.ac.uk:80/Mirrors/whitespace/whitespace.pl
commit_file wspace                                                                          r1 '2003-04-01 21:41:42 +0100' https://web.archive.org/web/20030621223442/http://compsoc.dur.ac.uk:80/whitespace/wspace
# add_file  wspace                                                                          r1 '2003-04-01 20:41:42 +0100' https://web.archive.org/web/20040325163702/http://mirror.ox.ac.uk:80/Mirrors/whitespace/wspace

add_file    docs/download.html                                                              r1 '2003-04-02 10:22:52 +0100' https://web.archive.org/web/20030813234741/http://mirror.ox.ac.uk:80/Mirrors/whitespace/download.html
add_file    docs/examples.html                                                              r1 '2003-04-02 10:23:06 +0100' https://web.archive.org/web/20030614101445/http://mirror.ox.ac.uk:80/Mirrors/whitespace/examples.html
add_file    docs/explanation.html                                                           r1 '2003-04-02 10:23:18 +0100' https://web.archive.org/web/20040203035616/http://mirror.ox.ac.uk:80/Mirrors/whitespace/explanation.html
add_file    docs/feedback.html                                                              r1 '2003-04-02 10:23:29 +0100' https://web.archive.org/web/20030614101626/http://mirror.ox.ac.uk:80/Mirrors/whitespace/feedback.html
add_file    docs/index.html                                                                 r1 '2003-04-02 10:23:43 +0100' https://web.archive.org/web/20030414003351/http://mirror.ox.ac.uk:80/Mirrors/whitespace/
add_file    docs/tutorial.html                                                              r1 '2003-04-02 10:23:53 +0100' https://web.archive.org/web/20030825043811/http://mirror.ox.ac.uk:80/Mirrors/whitespace/tutorial.html
commit '2003-04-02 10:23:53 +0100' 'Add site HTML'

add_file    docs/tutorial.html                                                              r1 '2003-04-03 00:03:10 +0100' https://web.archive.org/web/20030405142201/http://compsoc.dur.ac.uk:80/whitespace/tutorial.html
commit '2003-04-03 00:03:10 +0100' 'Embed fact.ws in tutorial.html'

git rm -q docs/{examples,explanation,feedback}.html
add_file    docs/examples.php                                                              ~r1 '2003-04-05 10:16:24 +0100' https://web.archive.org/web/20030405091634/http://compsoc.dur.ac.uk:80/whitespace/examples.php
add_file    docs/explanation.php                                                           ~r1 '2003-04-05 15:08:45 +0100' https://web.archive.org/web/20030405140846/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
add_file    docs/feedback.php                                                              ~r1 '2003-04-05 15:20:10 +0100' https://web.archive.org/web/20030405142010/http://compsoc.dur.ac.uk:80/whitespace/feedback.php
commit '2003-04-05 10:16:24 +0100' 'Convert site to PHP'

commit_file contrib/quine.ws                                                                r1 '2003-04-07 22:13:12 +0100' https://web.archive.org/web/20030430002837/http://compsoc.dur.ac.uk:80/whitespace/quine.ws
commit_file contrib/rot13.ws                                                                r1 '2003-04-07 23:23:47 +0100' https://web.archive.org/web/20030430003031/http://compsoc.dur.ac.uk:80/whitespace/rot13.ws

add_file    contrib/quine-2.ws                                                              r1 '2003-04-08 10:08:50 +0100' https://web.archive.org/web/20030430005123/http://compsoc.dur.ac.uk:80/whitespace/quine-2.ws
commit '2003-04-08 10:08:50 +0100' 'Add another quine by Benjamin Lerman'

add_file    embed                                                                           r1 '2003-04-08 11:41:56 +0100' https://web.archive.org/web/20030427090844/http://compsoc.dur.ac.uk:80/whitespace/embed
add_file    embed.hs                                                                        r1 '2003-04-08 11:41:56 +0100' https://web.archive.org/web/20030430004837/http://compsoc.dur.ac.uk:80/whitespace/embed.hs
commit '2003-04-08 11:41:56 +0100' 'Add a tool to embed a Whitespace program in a text file'

commit_file contrib/quine-copy.ws                                                           r1 '2003-04-08 12:19:26 +0100' https://web.archive.org/web/20030430003318/http://compsoc.dur.ac.uk:80/whitespace/quine-copy.ws

git rm -q docs/index.html
commit_file docs/index.php                                                                 ~r1 '2003-04-12 21:19:16 +0100' https://web.archive.org/web/20030412201917/http://compsoc.dur.ac.uk:80/whitespace/
commit_file docs/tutorial.php                                                              ~r1 '2003-04-14 01:17:23 +0100' https://web.archive.org/web/20030414001723/http://compsoc.dur.ac.uk:80/whitespace/tutorial.php
commit_file docs/mailinglist.php                                                           ~r1 '2003-04-22 10:19:08 +0100' https://web.archive.org/web/20030422091910/http://compsoc.dur.ac.uk:80/whitespace/mailinglist.php
commit_file docs/tools.php                                                                 ~r1 '2003-04-22 10:21:06 +0100' https://web.archive.org/web/20030422092107/http://compsoc.dur.ac.uk:80/whitespace/tools.php
git rm -q docs/download.html
commit_file docs/download.php                                                              ~r1 '2003-06-04 13:33:03 +0100' https://web.archive.org/web/20030604123308/http://compsoc.dur.ac.uk:80/whitespace/download.php
commit_file docs/explanation.php                                                           ~r2 '2003-06-21 19:12:12 +0100' https://web.archive.org/web/20030621181212/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
commit_file docs/contrib.php                                                               ~r1 '2003-06-21 22:48:00 +0100' https://web.archive.org/web/20030621214800/http://compsoc.dur.ac.uk:80/whitespace/contrib.php
commit_file docs/examples.php                                                              ~r2 '2003-06-21 22:53:15 +0100' https://web.archive.org/web/20030621215315/http://compsoc.dur.ac.uk:80/whitespace/examples.php
commit_file docs/feedback.php                                                              ~r2 '2003-06-21 23:01:16 +0100' https://web.archive.org/web/20030621220116/http://compsoc.dur.ac.uk:80/whitespace/feedback.php

# Modified between 2003-04-22 10:21:06 +0100 and 2003-08-16 13:32:42 +0100.
add_file    docs/tools.php                                                                 ~r2 '2003-08-16 13:32:42 +0100' https://web.archive.org/web/20030816123242/http://compsoc.dur.ac.uk:80/whitespace/tools.php
commit '2003-08-16 13:32:42 +0100' "Link to Oliver Burghard's tools"

add_file    examples/hanoi.ws                                                               r1 '2003-12-08 18:22:35 +0000' https://web.archive.org/web/20040218112203/http://compsoc.dur.ac.uk:80/whitespace/hanoi.ws
# Modified between 2003-12-06 07:38:21 +0000 and 2004-02-03 19:26:29 +0000.
add_file    docs/examples.php                                                              ~r3 '2004-02-03 19:26:29 +0000' https://web.archive.org/web/20040203192629/http://compsoc.dur.ac.uk:80/whitespace/examples.php
commit '2003-12-08 18:22:35 +0000' 'Add Towers of Hanoi solver'

add_file    whitespace-mode.el                                                              r1 '2004-05-04 17:27:46 +0100' https://web.archive.org/web/20040614222648/http://compsoc.dur.ac.uk:80/whitespace/whitespace-mode.el
add_file    docs/tools.php                                                                 ~r3 '2004-05-08 03:24:51 +0100' https://web.archive.org/web/20040507192452/http://compsoc.dur.ac.uk/whitespace/tools.php
commit '2004-05-04 17:27:46 +0100' 'Add Whitespace Emacs mode'

add_file    downloads/wspace-0.3.tgz                                                        r1 '2004-05-04 18:13:14 +0100' https://web.archive.org/web/20040617010431/http://compsoc.dur.ac.uk:80/whitespace/downloads/wspace-0.3.tgz
add_file    downloads/wspace-0.3.tgz.sig                                                    r1 '2004-05-04 18:15:32 +0100' https://web.archive.org/web/20040615053614/http://compsoc.dur.ac.uk:80/whitespace/downloads/wspace-0.3.tgz.sig
add_file    downloads/wspace                                                                r1 '2004-05-04 18:17:26 +0100' https://web.archive.org/web/20040617071347/http://compsoc.dur.ac.uk:80/whitespace/downloads/wspace
# wspace.tgz was never moved, but rename it to make its version clear.
git mv wspace.tgz downloads/wspace-0.2.tgz
commit '2004-05-04 18:17:26 +0100' 'Add Whitespace 0.3 binaries'

commit_file downloads/wspace.sig                                                            r1 '2004-06-01 01:28:52 +0100' https://web.archive.org/web/20040808030422/http://compsoc.dur.ac.uk:80/whitespace/downloads/wspace.sig

# examples.php    after 2004-04-10 05:56:27 +0100
# index.php       after 2004-04-09 16:22:27 +0100
# contrib.php     after 2004-04-10 05:27:04 +0100
# download.php    after 2004-04-10 05:36:43 +0100
# explanation.php after 2004-04-04 13:06:09 +0100
# feedback.php    after 2004-04-04 13:17:01 +0100
# mailinglist.php after 2004-02-04 14:50:59 +0000
# tutorial.php    after 2004-04-04 14:09:38 +0100
# Modified between 2004-04-10 05:56:27 +0100 and 2004-06-02 21:13:01 +0100.
add_file    docs/index.php                                                                 ~r2 '2004-06-02 21:13:01 +0100' https://web.archive.org/web/20040602201301/http://compsoc.dur.ac.uk:80/whitespace/
add_file    docs/contrib.php                                                               ~r2 '2004-06-06 13:27:33 +0100' https://web.archive.org/web/20040606122733/http://compsoc.dur.ac.uk:80/whitespace/contrib.php
add_file    docs/examples.php                                                              ~r4 '2004-06-06 13:52:03 +0100' https://web.archive.org/web/20040606125206/http://compsoc.dur.ac.uk:80/whitespace/examples.php
add_file    docs/download.php                                                              ~r2 '2004-06-06 13:37:51 +0100' https://web.archive.org/web/20040606123751/http://compsoc.dur.ac.uk:80/whitespace/download.php
add_file    docs/explanation.php                                                           ~r3 '2004-06-06 14:03:36 +0100' https://web.archive.org/web/20040606130336/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
add_file    docs/feedback.php                                                              ~r3 '2004-06-06 14:11:19 +0100' https://web.archive.org/web/20040606131119/http://compsoc.dur.ac.uk:80/whitespace/feedback.php
add_file    docs/mailinglist.php                                                           ~r2 '2004-06-06 14:27:22 +0100' https://web.archive.org/web/20040606132722/http://compsoc.dur.ac.uk:80/whitespace/mailinglist.php
add_file    docs/tutorial.php                                                              ~r2 '2004-06-06 14:57:41 +0100' https://web.archive.org/web/20040606135741/http://compsoc.dur.ac.uk:80/whitespace/tutorial.php
# Unknown time
commit '2004-05-04 00:00 +0000, 2004-06-02 21:13:01 +0100' 'Update site for Whitespace 0.3'

# Modified between 2004-08-03 23:55:10 +0100 and 2004-10-13 00:17:54 +0100.
add_file    docs/explanation.php                                                           ~r4 '2004-10-13 00:17:54 +0100' https://web.archive.org/web/20041012231756/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
commit '2004-10-13 00:17:54 +0100' 'Fix typo'

# Modified between and 2004-10-13 07:41:40 +0100 and 2004-10-28 08:35:28 +0100.
add_file    docs/examples.php                                                              ~r5 '2004-10-28 08:35:28 +0100' https://web.archive.org/web/20041028073529/http://compsoc.dur.ac.uk:80/whitespace/examples.php
add_file    docs/index.php                                                                 ~r3 '2004-10-28 10:11:22 +0100' https://web.archive.org/web/20041028091125/http://compsoc.dur.ac.uk:80/whitespace/
add_file    docs/tutorial.php                                                              ~r3 '2004-10-30 02:29:32 +0100' https://web.archive.org/web/20041030012935/http://compsoc.dur.ac.uk:80/whitespace/tutorial.php
add_file    docs/tools.php                                                                 ~r4 '2004-11-24 01:43:47 +0000' https://web.archive.org/web/20041124014352/http://compsoc.dur.ac.uk:80/whitespace/tools.php
add_file    docs/feedback.php                                                              ~r4 '2004-12-05 17:12:41 +0000' https://web.archive.org/web/20041205171247/http://compsoc.dur.ac.uk:80/whitespace/feedback.php
add_file    docs/contrib.php                                                               ~r3 '2004-12-10 10:07:52 +0000' https://web.archive.org/web/20041210100756/http://compsoc.dur.ac.uk:80/whitespace/contrib.php
add_file    docs/download.php                                                              ~r3 '2004-12-10 10:16:50 +0000' https://web.archive.org/web/20041210101656/http://compsoc.dur.ac.uk:80/whitespace/download.php
add_file    docs/explanation.php                                                           ~r5 '2004-12-10 10:29:56 +0000' https://web.archive.org/web/20041210103006/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
add_file    docs/mailinglist.php                                                           ~r3 '2005-12-10 06:34:20 +0000' https://web.archive.org/web/20051210063421/http://compsoc.dur.ac.uk:80/whitespace/mailinglist.php
commit '2004-10-28 08:35:28 +0100' 'Attribute CompSoc for hosting'

# Modified between 2005-02-04 00:47:57 +0000 and 2005-02-20 00:50:54 +0000.
add_file    docs/index.php                                                                 ~r4 '2005-02-20 00:50:54 +0000' https://web.archive.org/web/20050220005106/http://compsoc.dur.ac.uk:80/whitespace/
commit '2005-02-20 00:50:54 +0000' 'Reference dolphin language project'

# Modified between 2007-01-11 16:02:09 +0000 and 2007-01-17 01:13:38 +0000.
add_file    docs/index.php                                                                 ~r5 '2007-01-17 01:13:38 +0000' https://web.archive.org/web/20070117011338/http://compsoc.dur.ac.uk:80/whitespace/
commit '2007-01-17 01:13:38 +0000' 'Rename dolphin to kaya'

# Modified between 2007-07-15 09:07:41 +0000 and 2007-08-15 20:46:28 +0000.
add_file    docs/contrib.php                                                               ~r4 '2007-08-15 21:46:28 +0100' https://web.archive.org/web/20070815204629/http://compsoc.dur.ac.uk:80/whitespace/contrib.php
add_file    docs/tutorial.php                                                              ~r4 '2007-08-15 22:08:46 +0100' https://web.archive.org/web/20070815210846/http://compsoc.dur.ac.uk:80/whitespace/tutorial.php
add_file    docs/download.php                                                              ~r4 '2007-08-15 23:01:51 +0100' https://web.archive.org/web/20070815220151/http://compsoc.dur.ac.uk:80/whitespace/download.php
add_file    docs/explanation.php                                                           ~r6 '2007-08-15 23:06:47 +0100' https://web.archive.org/web/20070815220648/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
add_file    docs/mailinglist.php                                                           ~r4 '2007-08-16 09:21:32 +0100' https://web.archive.org/web/20070816082132/http://compsoc.dur.ac.uk:80/whitespace/mailinglist.php
add_file    docs/tools.php                                                                 ~r5 '2007-08-16 09:23:03 +0100' https://web.archive.org/web/20070816082303/http://compsoc.dur.ac.uk:80/whitespace/tools.php
add_file    docs/feedback.php                                                              ~r5 '2007-08-16 09:23:34 +0100' https://web.archive.org/web/20070816082334/http://compsoc.dur.ac.uk:80/whitespace/feedback.php
add_file    docs/index.php                                                                 ~r6 '2007-08-21 10:28:59 +0100' https://web.archive.org/web/20070821092859/http://compsoc.dur.ac.uk:80/whitespace/
add_file    docs/examples.php                                                              ~r6 '2007-08-23 16:38:21 +0100' https://web.archive.org/web/20070823153821/http://compsoc.dur.ac.uk:80/whitespace/examples.php
commit '2007-08-15 21:46:28 +0100' 'Update contact email from Durham to St Andrews'
