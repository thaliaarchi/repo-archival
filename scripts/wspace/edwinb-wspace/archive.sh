#!/bin/bash -e

. base.sh

commit_file() {
  local file="$1"
  local revision="$2"
  local date="$3"
  local url="$4"

  if [ -f "$file" ]; then
    rm "$file"
  fi
  mkdir -p "$(dirname "$file")"
  if [ "$url" = "-" ]; then
    touch "$file"
  else
    wget-cache "$(url_to_ia_raw "$url")" "$file"
  fi
  git add -f "$file"
  GIT_AUTHOR_NAME='Edwin Brady' GIT_AUTHOR_EMAIL='e.c.brady@durham.ac.uk' GIT_AUTHOR_DATE="$date" \
  GIT_COMMITTER_NAME='Edwin Brady' GIT_COMMITTER_EMAIL='e.c.brady@durham.ac.uk' GIT_COMMITTER_DATE="$date" \
  git commit -m "[$revision] $file

$url"
}

mkdir -p wspace
cd wspace
mkdir edwinb-wspace
cd edwinb-wspace
git init

# ~r_ denotes a revision dated by HTTP Date, instead of HTTP Last-Modified
commit_file whitespace-0.1/VM.hs                                                           r1  '2003-03-31 00:12    +0100' -
commit_file whitespace-0.1/Input.hs                                                        r1  '2003-03-31 00:12:22 +0100' https://web.archive.org/web/20030624014503/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Input.hs
commit_file whitespace-0.1/Tokens.hs                                                       r1  '2003-03-31 00:12:49 +0100' https://web.archive.org/web/20030624015950/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Tokens.hs
commit_file whitespace-0.1/calc.ws                                                         r1  '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030624021432/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/calc.ws
commit_file whitespace-0.1/count.ws                                                        r1  '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030624021255/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/count.ws
commit_file whitespace-0.1/fact.ws                                                         r1  '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030624022311/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/fact.ws
commit_file whitespace-0.1/hworld.ws                                                       r1  '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030818000703/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/hworld.ws
commit_file whitespace-0.1/name.ws                                                         r1  '2003-03-31 00:19:39 +0100' https://web.archive.org/web/20030624023117/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/name.ws
commit_file calc.ws                                                                        r1  '2003-03-31 00:20:28 +0100' https://web.archive.org/web/20030405142656/http://compsoc.dur.ac.uk:80/whitespace/calc.ws
commit_file count.ws                                                                       r1  '2003-03-31 00:20:28 +0100' https://web.archive.org/web/20030405165300/http://compsoc.dur.ac.uk:80/whitespace/count.ws
commit_file hworld.ws                                                                      r1  '2003-03-31 00:20:28 +0100' https://web.archive.org/web/20030405143641/http://compsoc.dur.ac.uk:80/whitespace/hworld.ws
commit_file name.ws                                                                        r1  '2003-03-31 00:20:28 +0100' https://web.archive.org/web/20030415045931/http://compsoc.dur.ac.uk:80/whitespace/name.ws
commit_file home.css                                                                       r1  '2003-03-31 00:28:06 +0100' https://web.archive.org/web/20030405142925/http://compsoc.dur.ac.uk:80/whitespace/home.css
commit_file fact.ws                                                                        r1  '2003-03-31 00:39:48 +0100' https://web.archive.org/web/20030405141644/http://compsoc.dur.ac.uk:80/whitespace/fact.ws
commit_file whitespace_0.1-1_source.changes                                                r1  '2003-03-31 11:04:57 +0100' https://web.archive.org/web/20030803223653/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1_source.changes
commit_file whitespace-0.1/COPYING                                                         r1  '2003-03-31 13:35:20 +0100' https://web.archive.org/web/20030818001123/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/COPYING
commit_file whitespace-0.1/main.hs                                                         r1  '2003-03-31 13:39:18 +0100' https://web.archive.org/web/20030624022604/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/main.hs
commit_file whitespace-0.1/Makefile                                                        r1  '2003-03-31 13:39:29 +0100' https://web.archive.org/web/20030624015551/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Makefile
commit_file whitespace-0.1/debian/whitespace/usr/share/doc/whitespace/tutorial.html        r1  '2003-03-31 13:47    +0100' -
commit_file whitespace_0.1.orig.tar.gz                                                     r1  '2003-03-31 13:47    +0100' -
commit_file whitespace-0.1/docs/tutorial.html                                              r1  '2003-03-31 13:47:05 +0100' https://web.archive.org/web/20030629112603/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/docs/tutorial.html
commit_file whitespace-0.1/debian/whitespace/usr/share/doc/whitespace/changelog.Debian.gz  r1  '2003-03-31 15:04    +0100' -
commit_file whitespace-0.1/debian/whitespace/usr/share/doc/whitespace/copyright            r1  '2003-03-31 15:04    +0100' -
commit_file whitespace-0.1/debian/whitespace/usr/share/man/man1/wspace.1.gz                r1  '2003-03-31 15:04    +0100' -
commit_file whitespace-0.1/debian/changelog                                                r1  '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030827083557/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/changelog
commit_file whitespace-0.1/debian/compat                                                   r1  '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629104608/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/compat
commit_file whitespace-0.1/debian/control                                                  r1  '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629104803/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/control
commit_file whitespace-0.1/debian/copyright                                                r1  '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629105053/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/copyright
commit_file whitespace-0.1/debian/rules                                                    r1  '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629110105/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/rules
commit_file whitespace-0.1/debian/whitespace.examples                                      r1  '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629110008/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.examples
commit_file whitespace-0.1/debian/whitespace.install                                       r1  '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629110020/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.install
commit_file whitespace-0.1/debian/whitespace.manpages                                      r1  '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629110513/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.manpages
commit_file whitespace-0.1/debian/wspace.1                                                 r1  '2003-03-31 15:04:14 +0100' https://web.archive.org/web/20030629111334/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/wspace.1
commit_file whitespace.ws.c                                                                r1  '2003-03-31 15:05:46 +0100' https://web.archive.org/web/20030405144531/http://compsoc.dur.ac.uk:80/whitespace/whitespace.ws.c
commit_file whitespace-0.1/debian/whitespace.docs                                          r1  '2003-03-31 15:19    +0100' -
commit_file whitespace-0.1/debian/whitespace/usr/bin/wspace                                r1  '2003-03-31 15:20    +0100' -
commit_file whitespace_0.1-1.diff.gz                                                       r1  '2003-03-31 15:20    +0100' -
commit_file whitespace-0.1/Tokens.hi                                                       r1  '2003-03-31 15:20:13 +0100' https://web.archive.org/web/20030624015422/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Tokens.hi
commit_file whitespace-0.1/Tokens.o                                                        r1  '2003-03-31 15:20:14 +0100' https://web.archive.org/web/20030624015825/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Tokens.o
commit_file whitespace-0.1/VM.hi                                                           r1  '2003-03-31 15:20:17 +0100' https://web.archive.org/web/20030624020343/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/VM.hi
commit_file whitespace-0.1/VM.o                                                            r1  '2003-03-31 15:20:23 +0100' https://web.archive.org/web/20030624020612/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/VM.o
commit_file whitespace-0.1/Input.hi                                                        r1  '2003-03-31 15:20:24 +0100' https://web.archive.org/web/20030624014431/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Input.hi
commit_file whitespace-0.1/Input.o                                                         r1  '2003-03-31 15:20:26 +0100' https://web.archive.org/web/20030624014855/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Input.o
commit_file whitespace-0.1/Main.hi                                                         r1  '2003-03-31 15:20:27 +0100' https://web.archive.org/web/20030624015054/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/Main.hi
commit_file whitespace-0.1/main.o                                                          r1  '2003-03-31 15:20:28 +0100' https://web.archive.org/web/20030624022631/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/main.o
commit_file whitespace-0.1/build-stamp                                                     r1  '2003-03-31 15:20:30 +0100' https://web.archive.org/web/20030624021150/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/build-stamp
commit_file whitespace-0.1/wspace                                                          r1  '2003-03-31 15:20:30 +0100' https://web.archive.org/web/20030817182401/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/wspace
commit_file whitespace-0.1/debian/files                                                    r1  '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030827091055/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/files
commit_file whitespace-0.1/debian/whitespace.substvars                                     r1  '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030629110823/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.substvars
commit_file whitespace-0.1/debian/whitespace/DEBIAN/control                                r1  '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030910053927/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace/DEBIAN/control
commit_file whitespace-0.1/debian/whitespace/DEBIAN/md5sums                                r1  '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030910054636/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace/DEBIAN/md5sums
commit_file whitespace_0.1-1_i386.deb                                                      r1  '2003-03-31 15:20:33 +0100' https://web.archive.org/web/20030803223310/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1_i386.deb
commit_file whitespace_0.1-1.dsc                                                           r1  '2003-03-31 15:20:40 +0100' https://web.archive.org/web/20030621215923/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1.dsc
commit_file whitespace_0.1-1_i386.changes                                                  r1  '2003-03-31 15:20:43 +0100' https://web.archive.org/web/20030621220500/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1_i386.changes
commit_file wspace.tgz                                                                     r1  '2003-03-31 16:35:26 +0100' https://web.archive.org/web/20030423000836/http://compsoc.dur.ac.uk:80/whitespace/wspace.tgz
commit_file fibonacci.ws                                                                   r1  '2003-03-31 17:30:52 +0100' https://web.archive.org/web/20030405143602/http://compsoc.dur.ac.uk:80/whitespace/fibonacci.ws
commit_file whitespace_0.2-1.dsc                                                           r1  '2003-03-31 17:36:05 +0100' https://web.archive.org/web/20040120123855/http://compsoc.dur.ac.uk:80/whitespace/whitespace_0.2-1.dsc
commit_file whitespace_0.2-1_i386.deb                                                      r1  '2003-03-31 17:55:47 +0100' https://web.archive.org/web/20030423000129/http://compsoc.dur.ac.uk:80/whitespace/whitespace_0.2-1_i386.deb
commit_file whitespace-0.2-1.i386.rpm                                                      r1  '2003-04-01 10:42:55 +0100' https://web.archive.org/web/20030422235920/http://compsoc.dur.ac.uk:80/whitespace/whitespace-0.2-1.i386.rpm
commit_file wspace_osx.gz                                                                  r1  '2003-04-01 19:35:10 +0100' https://web.archive.org/web/20060218224133/http://compsoc.dur.ac.uk:80/whitespace/wspace_osx.gz
commit_file wspace_solaris.gz                                                              r1  '2003-04-01 20:30:34 +0100' https://web.archive.org/web/20060218224258/http://compsoc.dur.ac.uk:80/whitespace/wspace_solaris.gz
commit_file whitespace.pl                                                                  r1  '2003-04-01 20:34:12 +0100' https://web.archive.org/web/20030423000132/http://compsoc.dur.ac.uk:80/whitespace/whitespace.pl
commit_file wspace                                                                         r1  '2003-04-01 21:41:42 +0100' https://web.archive.org/web/20030621223442/http://compsoc.dur.ac.uk:80/whitespace/wspace
commit_file tutorial.html                                                                  r1  '2003-04-03 00:03:10 +0100' https://web.archive.org/web/20030405142201/http://compsoc.dur.ac.uk:80/whitespace/tutorial.html
commit_file examples.php                                                                   ~r1 '2003-04-05 10:16:24 +0100' https://web.archive.org/web/20030405091634/http://compsoc.dur.ac.uk:80/whitespace/examples.php
commit_file explanation.php                                                                ~r1 '2003-04-05 15:08:45 +0100' https://web.archive.org/web/20030405140846/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
commit_file feedback.php                                                                   ~r1 '2003-04-05 15:20:10 +0100' https://web.archive.org/web/20030405142010/http://compsoc.dur.ac.uk:80/whitespace/feedback.php
commit_file quine.ws                                                                       r1  '2003-04-07 22:13:12 +0100' https://web.archive.org/web/20030430002837/http://compsoc.dur.ac.uk:80/whitespace/quine.ws
commit_file rot13.ws                                                                       r1  '2003-04-07 23:23:47 +0100' https://web.archive.org/web/20030430003031/http://compsoc.dur.ac.uk:80/whitespace/rot13.ws
commit_file quine-2.ws                                                                     r1  '2003-04-08 10:08:50 +0100' https://web.archive.org/web/20030430005123/http://compsoc.dur.ac.uk:80/whitespace/quine-2.ws
commit_file embed                                                                          r1  '2003-04-08 11:41:56 +0100' https://web.archive.org/web/20030427090844/http://compsoc.dur.ac.uk:80/whitespace/embed
commit_file embed.hs                                                                       r1  '2003-04-08 11:41:56 +0100' https://web.archive.org/web/20030430004837/http://compsoc.dur.ac.uk:80/whitespace/embed.hs
commit_file quine-copy.ws                                                                  r1  '2003-04-08 12:19:26 +0100' https://web.archive.org/web/20030430003318/http://compsoc.dur.ac.uk:80/whitespace/quine-copy.ws
commit_file index.php                                                                      ~r1 '2003-04-12 21:19:16 +0100' https://web.archive.org/web/20030412201917/http://compsoc.dur.ac.uk:80/whitespace/
commit_file tutorial.php                                                                   ~r1 '2003-04-14 01:17:23 +0100' https://web.archive.org/web/20030414001723/http://compsoc.dur.ac.uk:80/whitespace/tutorial.php
commit_file mailinglist.php                                                                ~r1 '2003-04-22 10:19:08 +0100' https://web.archive.org/web/20030422091910/http://compsoc.dur.ac.uk:80/whitespace/mailinglist.php
commit_file tools.php                                                                      ~r1 '2003-04-22 10:21:06 +0100' https://web.archive.org/web/20030422092107/http://compsoc.dur.ac.uk:80/whitespace/tools.php
commit_file download.php                                                                   ~r1 '2003-06-04 13:33:03 +0100' https://web.archive.org/web/20030604123308/http://compsoc.dur.ac.uk:80/whitespace/download.php
commit_file explanation.php                                                                ~r2 '2003-06-21 19:12:12 +0100' https://web.archive.org/web/20030621181212/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
commit_file contrib.php                                                                    ~r1 '2003-06-21 22:48:00 +0100' https://web.archive.org/web/20030621214800/http://compsoc.dur.ac.uk:80/whitespace/contrib.php
commit_file examples.php                                                                   ~r2 '2003-06-21 22:53:15 +0100' https://web.archive.org/web/20030621215315/http://compsoc.dur.ac.uk:80/whitespace/examples.php
commit_file feedback.php                                                                   ~r2 '2003-06-21 23:01:16 +0100' https://web.archive.org/web/20030621220116/http://compsoc.dur.ac.uk:80/whitespace/feedback.php
commit_file tools.php                                                                      ~r2 '2003-08-16 13:32:42 +0100' https://web.archive.org/web/20030816123242/http://compsoc.dur.ac.uk:80/whitespace/tools.php
commit_file hanoi.ws                                                                       r1  '2003-12-08 18:22:35 +0000' https://web.archive.org/web/20040218112203/http://compsoc.dur.ac.uk:80/whitespace/hanoi.ws
commit_file examples.php                                                                   ~r3 '2004-01-06 12:52:03 +0000' https://web.archive.org/web/20040606125206/http://compsoc.dur.ac.uk:80/whitespace/examples.php
commit_file examples.php                                                                   ~r4 '2004-02-03 19:26:29 +0000' https://web.archive.org/web/20040203192629/http://compsoc.dur.ac.uk:80/whitespace/examples.php
commit_file whitespace-mode.el                                                             r1  '2004-05-04 17:27:46 +0100' https://web.archive.org/web/20040614222648/http://compsoc.dur.ac.uk:80/whitespace/whitespace-mode.el
commit_file downloads/wspace-0.3.tgz                                                       r1  '2004-05-04 18:13:14 +0100' https://web.archive.org/web/20040617010431/http://compsoc.dur.ac.uk:80/whitespace/downloads/wspace-0.3.tgz
commit_file downloads/wspace-0.3.tgz.sig                                                   r1  '2004-05-04 18:15:32 +0100' https://web.archive.org/web/20040615053614/http://compsoc.dur.ac.uk:80/whitespace/downloads/wspace-0.3.tgz.sig
commit_file downloads/wspace                                                               r1  '2004-05-04 18:17:26 +0100' https://web.archive.org/web/20040617071347/http://compsoc.dur.ac.uk:80/whitespace/downloads/wspace
commit_file tools.php                                                                      ~r3 '2004-05-08 03:24:51 +0100' https://web.archive.org/web/20040507192452/http://compsoc.dur.ac.uk/whitespace/tools.php
commit_file downloads/wspace.sig                                                           r1  '2004-06-01 01:28:52 +0100' https://web.archive.org/web/20040808030422/http://compsoc.dur.ac.uk:80/whitespace/downloads/wspace.sig
commit_file index.php                                                                      ~r2 '2004-06-02 21:13:01 +0100' https://web.archive.org/web/20040602201301/http://compsoc.dur.ac.uk:80/whitespace/
commit_file contrib.php                                                                    ~r2 '2004-06-06 13:27:33 +0100' https://web.archive.org/web/20040606122733/http://compsoc.dur.ac.uk:80/whitespace/contrib.php
commit_file download.php                                                                   ~r2 '2004-06-06 13:37:51 +0100' https://web.archive.org/web/20040606123751/http://compsoc.dur.ac.uk:80/whitespace/download.php
commit_file explanation.php                                                                ~r3 '2004-06-06 14:03:36 +0100' https://web.archive.org/web/20040606130336/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
commit_file feedback.php                                                                   ~r3 '2004-06-06 14:11:19 +0100' https://web.archive.org/web/20040606131119/http://compsoc.dur.ac.uk:80/whitespace/feedback.php
commit_file mailinglist.php                                                                ~r2 '2004-06-06 14:27:22 +0100' https://web.archive.org/web/20040606132722/http://compsoc.dur.ac.uk:80/whitespace/mailinglist.php
commit_file tutorial.php                                                                   ~r2 '2004-06-06 14:57:41 +0100' https://web.archive.org/web/20040606135741/http://compsoc.dur.ac.uk:80/whitespace/tutorial.php
commit_file explanation.php                                                                ~r4 '2004-10-13 00:17:54 +0100' https://web.archive.org/web/20041012231756/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
commit_file examples.php                                                                   ~r5 '2004-10-28 08:35:28 +0100' https://web.archive.org/web/20041028073529/http://compsoc.dur.ac.uk:80/whitespace/examples.php
commit_file index.php                                                                      ~r3 '2004-10-28 10:11:22 +0100' https://web.archive.org/web/20041028091125/http://compsoc.dur.ac.uk:80/whitespace/
commit_file tutorial.php                                                                   ~r3 '2004-10-30 02:29:32 +0100' https://web.archive.org/web/20041030012935/http://compsoc.dur.ac.uk:80/whitespace/tutorial.php
commit_file tools.php                                                                      ~r4 '2004-11-24 01:43:47 +0000' https://web.archive.org/web/20041124014352/http://compsoc.dur.ac.uk:80/whitespace/tools.php
commit_file feedback.php                                                                   ~r4 '2004-12-05 17:12:41 +0000' https://web.archive.org/web/20041205171247/http://compsoc.dur.ac.uk:80/whitespace/feedback.php
commit_file contrib.php                                                                    ~r3 '2004-12-10 10:07:52 +0000' https://web.archive.org/web/20041210100756/http://compsoc.dur.ac.uk:80/whitespace/contrib.php
commit_file download.php                                                                   ~r3 '2004-12-10 10:16:50 +0000' https://web.archive.org/web/20041210101656/http://compsoc.dur.ac.uk:80/whitespace/download.php
commit_file explanation.php                                                                ~r5 '2004-12-10 10:29:56 +0000' https://web.archive.org/web/20041210103006/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
commit_file index.php                                                                      ~r4 '2005-02-20 00:50:54 +0000' https://web.archive.org/web/20050220005106/http://compsoc.dur.ac.uk:80/whitespace/
commit_file mailinglist.php                                                                ~r3 '2005-12-10 06:34:20 +0000' https://web.archive.org/web/20051210063421/http://compsoc.dur.ac.uk:80/whitespace/mailinglist.php
commit_file index.php                                                                      ~r5 '2007-01-17 01:13:38 +0000' https://web.archive.org/web/20070117011338/http://compsoc.dur.ac.uk:80/whitespace/
commit_file contrib.php                                                                    ~r4 '2007-08-15 21:46:28 +0100' https://web.archive.org/web/20070815204629/http://compsoc.dur.ac.uk:80/whitespace/contrib.php
commit_file tutorial.php                                                                   ~r4 '2007-08-15 22:08:46 +0100' https://web.archive.org/web/20070815210846/http://compsoc.dur.ac.uk:80/whitespace/tutorial.php
commit_file download.php                                                                   ~r4 '2007-08-15 23:01:51 +0100' https://web.archive.org/web/20070815220151/http://compsoc.dur.ac.uk:80/whitespace/download.php
commit_file explanation.php                                                                ~r6 '2007-08-15 23:06:47 +0100' https://web.archive.org/web/20070815220648/http://compsoc.dur.ac.uk:80/whitespace/explanation.php
commit_file mailinglist.php                                                                ~r4 '2007-08-16 09:21:32 +0100' https://web.archive.org/web/20070816082132/http://compsoc.dur.ac.uk:80/whitespace/mailinglist.php
commit_file tools.php                                                                      ~r5 '2007-08-16 09:23:03 +0100' https://web.archive.org/web/20070816082303/http://compsoc.dur.ac.uk:80/whitespace/tools.php
commit_file feedback.php                                                                   ~r5 '2007-08-16 09:23:34 +0100' https://web.archive.org/web/20070816082334/http://compsoc.dur.ac.uk:80/whitespace/feedback.php
commit_file index.php                                                                      ~r6 '2007-08-21 10:28:59 +0100' https://web.archive.org/web/20070821092859/http://compsoc.dur.ac.uk:80/whitespace/
commit_file examples.php                                                                   ~r6 '2007-08-23 16:38:21 +0100' https://web.archive.org/web/20070823153821/http://compsoc.dur.ac.uk:80/whitespace/examples.php
