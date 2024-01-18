#!/bin/bash

# Disable unreachable lint
# shellcheck disable=SC2317
echo 'Run manually'
exit 1

# It seems that plan9port did not start with Plan 9 as the base, as I assumed
# below. Many “initial” commits on 2003-09-30 imported ported subtrees.
#
# The initial import of libregexp and libbio in commit b2cfc4e2e71d0f0a5113ddfbd93c8285cc4d74e4
# indicates in src/{libregexp,libbio}/README, that they were sourced from
# Inferno; the sources of libfmt and libutf are unstated.
#
# The initial import of sam in commit ed7c8e8d02c02bdbff1e88a6d8d1419f39af48ad
# indicates in src/cmd/sam/README, that it uses libutf-2.0 and libfmt-2.0 from
# https://web.archive.org/web/20030625153911/http://www.pdos.lcs.mit.edu/~rsc/software/,
# and was ported by Scott Schwartz.
#
# Perhaps earlier history could be reconstructed from there.

# The fork point of plan9port:
# at the latest 2003-09-30 f3e9c68aaa10d1977af2e6856bf303a75133e353
# NO  2003-09-30 f3e9c68aaa10d1977af2e6856bf303a75133e353 for sys/src/libbio/bgetc.c
# NO  2003-09-19 67031067871d8cd705958f437682c703f042b640 for sys/src/libc/fmt/{dofmt.c,fmtquote.c}
# NO  2003-07-14 e34dbc32159cf6b992e3c875383330eae3abc0be for sys/src/libregexp/{regexec.c,rregexec.c}
# ?
# yes 2003-04-16 41eff910f6b7cf19d3e541c77cf522bd9c12e31c for sys/src/libc/fmt/runevsmprint.c
# yes 2003-04-12 f314cdf7834bd43eca346fc56576f76e4a83155b
# yes 2003-04-04 679c15e8e2152a2cec27f8698add03aa0b7ed835 for sys/src/libc/9sys/qlock.c
# NO  2003-03-28 65fa3f8b9a469d1a1f534b0eb39ee25caab832bb for sys/src/libc/fmt/runevsmprint.c
# NO  2003-02-06 7fd46167d91ac0c2e35d4b71179b3ebdd8b6621a for sys/src/libc/port/encodefmt.c
# yes 2002-12-13 6a9fc400c33447ef5e1cda7185cb4de2c8e8010e for sys/src/libc/fmt/dofmt.c
# yes 2002-12-12 d9306527b4a7229dcf0cf3c58aed36bb9da82854 (tagged)
# yes 2002-09-26 3ff48bf5ed603850fcd251ddf13025d23d693782 (tagged)
# yes 2002-05-03 b7b24591a7db843bfad3c8422d030e105c7ea168 (tagged)
# yes 2002-04-27 9a747e4fd48b9f4522c70c07e8f882a15030f964 (tagged)

# plan9port path                  plan9 path                              Assumed plan9port version   Later revisions seemingly not in plan9port

# include/bio.h                   sys/include/bio.h
# include/cursor.h                sys/include/cursor.h
# include/draw.h                  sys/include/draw.h
# include/event.h                 sys/include/event.h
# include/frame.h                 sys/include/frame.h
# include/keyboard.h              sys/include/keyboard.h
# include/libc.h                  sys/include/libc.h
# include/mouse.h                 sys/include/mouse.h
# include/regexp9.h               sys/include/regexp.h
# include/thread.h                sys/include/thread.h
# include/u.h                     386/include/u.h

# man/man3/bio.3                  sys/man/2/bio                           2002-04-27
# man/man3/fmtinstall.3           sys/man/2/fmtinstall
# man/man3/ioproc.3               sys/man/2/ioproc
# man/man3/isalpharune.3          sys/man/2/isalpharune
# man/man3/print.3                sys/man/2/print
# man/man3/regexp9.3              sys/man/2/regexp
# man/man3/rune.3                 sys/man/2/rune
# man/man3/runestrcat.3           sys/man/2/runestrcat
# man/man3/thread.3               sys/man/2/thread

# src/lib9/argv0.c                sys/src/cmd/unix/drawterm/argv0.c
# src/lib9/encodefmt.c            sys/src/libc/port/encodefmt.c
# src/lib9/getcallerpc-386.c      sys/src/libc/386/getcallerpc.c
# src/lib9/getfields.c            sys/src/libc/port/getfields.c
# src/lib9/lock.c                 sys/src/libc/port/lock.c
# src/lib9/nrand.c                sys/src/libc/port/nrand.c
# src/lib9/qlock.c                sys/src/libc/9sys/qlock.c
# src/lib9/rand.c                 sys/src/libc/port/lrand.c
# src/lib9/readn.c                sys/src/cmd/unix/drawterm/readn.c
# src/lib9/strecpy.c              sys/src/libc/port/strecpy.c
# src/lib9/sysfatal.c             sys/src/libc/9sys/sysfatal.c
# src/lib9/tokenize.c             sys/src/libc/port/tokenize.c
# src/lib9/u16.c                  sys/src/libc/port/u16.c
# src/lib9/u32.c                  sys/src/libc/port/u32.c
# src/lib9/u64.c                  sys/src/libc/port/u64.c
# src/lib9/wait.c                 sys/src/libc/9sys/wait.c
# src/lib9/werrstr.c              sys/src/libc/9sys/werrstr.c

# src/libbio/bbuffered.c          sys/src/libbio/bbuffered.c              2000-06-07
# src/libbio/bfildes.c            sys/src/libbio/bfildes.c                1992-09-21
# src/libbio/bflush.c             sys/src/libbio/bflush.c                 2000-10-14
# src/libbio/bgetc.c              sys/src/libbio/bgetc.c                  1995-04-05  Skip 2003-09-30
# src/libbio/bgetd.c              sys/src/libbio/bgetd.c                  1992-09-21
# src/libbio/bgetrune.c           sys/src/libbio/bgetrune.c               1995-04-05
# src/libbio/binit.c              sys/src/libbio/binit.c                  1995-04-05  Skip 2000-06-07
# src/libbio/boffset.c            sys/src/libbio/boffset.c                2002-12-12
# src/libbio/bprint.c             sys/src/libbio/bprint.c                 2000-06-07  Skip 2002-04-27
# src/libbio/bputc.c              sys/src/libbio/bputc.c                  1992-09-21  Skip 2000-06-07
# src/libbio/bputrune.c           sys/src/libbio/bputrune.c               1992-09-21
# src/libbio/brdline.c            sys/src/libbio/brdline.c                1995-04-05
# src/libbio/brdstr.c             sys/src/libbio/brdstr.c                 2002-04-27
# src/libbio/bread.c              sys/src/libbio/bread.c                  1995-04-05  Skip 2000-10-14
# src/libbio/bseek.c              sys/src/libbio/bseek.c                  2000-06-07
# src/libbio/bwrite.c             sys/src/libbio/bwrite.c                 1992-09-21  Skip 2002-04-27, 2000-06-07
# src/libbio/mkfile               sys/src/libbio/mkfile                   N/A

# src/libfmt/charstod.c           sys/src/libc/port/charstod.c            1992-09-21  Skip 2002-04-27, 2000-10-14
# src/libfmt/dofmt.c              sys/src/libc/fmt/dofmt.c                2002-12-13  Skip 2003-09-19
# src/libfmt/dorfmt.c             sys/src/libc/fmt/dorfmt.c               2002-04-27
# src/libfmt/errfmt.c             sys/src/libc/fmt/errfmt.c               2002-04-27
# src/libfmt/fltfmt.c             sys/src/libc/fmt/fltfmt.c
# src/libfmt/fmt.c                sys/src/libc/fmt/fmt.c
# src/libfmt/fmtdef.h             sys/src/libc/fmt/fmtdef.h
# src/libfmt/fmtfd.c              sys/src/libc/fmt/fmtfd.c
# src/libfmt/fmtfdflush.c         sys/src/libc/fmt/vfprint.c (part)
# src/libfmt/fmtlock.c            sys/src/libc/fmt/fmtlock.c
# src/libfmt/fmtprint.c           sys/src/libc/fmt/fmtprint.c
# src/libfmt/fmtquote.c           sys/src/libc/fmt/fmtquote.c                                         Skip 2003-09-19
# src/libfmt/fmtrune.c            sys/src/libc/fmt/fmtrune.c
# src/libfmt/fmtstr.c (part)      sys/src/libc/fmt/fmtstr.c               2002-04-27  Skip 2003-03-28
# src/libfmt/fmtstr.c (part)      sys/src/libc/fmt/vsmprint.c (part)
# src/libfmt/fmtvprint.c          sys/src/libc/fmt/fmtvprint.c
# src/libfmt/fprint.c             sys/src/libc/fmt/fprint.c
# src/libfmt/mkfile               sys/src/libc/fmt/mkfile
# src/libfmt/pow10.c              sys/src/cmd/unix/drawterm/pow10.c
# src/libfmt/print.c              sys/src/libc/fmt/print.c
# src/libfmt/runefmtstr.c (part)  sys/src/libc/fmt/runefmtstr.c
# src/libfmt/runefmtstr.c (part)  sys/src/libc/fmt/runevsmprint.c (part)  2002-04-27  Skip 2003-04-16, 2003-04-15, 2003-03-28
# src/libfmt/runeseprint.c        sys/src/libc/fmt/runeseprint.c
# src/libfmt/runesmprint.c        sys/src/libc/fmt/runesmprint.c
# src/libfmt/runesnprint.c        sys/src/libc/fmt/runesnprint.c
# src/libfmt/runesprint.c         sys/src/libc/fmt/runesprint.c
# src/libfmt/runevseprint.c       sys/src/libc/fmt/runevseprint.c
# src/libfmt/runevsmprint.c       sys/src/libc/fmt/runevsmprint.c         2002-04-27  Skip 2003-04-16, 2003-04-15, 2003-03-28
# src/libfmt/runevsnprint.c       sys/src/libc/fmt/runevsnprint.c
# src/libfmt/seprint.c            sys/src/libc/fmt/seprint.c
# src/libfmt/smprint.c            sys/src/libc/fmt/smprint.c
# src/libfmt/snprint.c            sys/src/libc/fmt/snprint.c
# src/libfmt/sprint.c             sys/src/libc/fmt/sprint.c
# src/libfmt/strtod.c             sys/src/libc/port/strtod.c
# src/libfmt/vfprint.c            sys/src/libc/fmt/vfprint.c
# src/libfmt/vseprint.c           sys/src/libc/fmt/vseprint.c
# src/libfmt/vsmprint.c           sys/src/libc/fmt/vsmprint.c
# src/libfmt/vsnprint.c           sys/src/libc/fmt/vsnprint.c

# src/libregexp/mkfile            sys/src/libregexp/mkfile                N/A
# src/libregexp/regaux.c          sys/src/libregexp/regaux.c              1995-04-05  Skip 2000-06-07
# src/libregexp/regcomp.c         sys/src/libregexp/regcomp.c             1995-04-05
# src/libregexp/regcomp.h         sys/src/libregexp/regcomp.h             1995-04-05  Skip 2002-12-30, 2000-06-07
# src/libregexp/regerror.c        sys/src/libregexp/regerror.c            1992-09-21
# src/libregexp/regexec.c         sys/src/libregexp/regexec.c             2000-06-07  Skip 2003-07-14
# src/libregexp/regexp9.3         sys/man/2/regexp                        2002-04-27
# src/libregexp/regexp9.7         sys/man/6/regexp                        2000-06-0
# src/libregexp/regsub.c          sys/src/libregexp/regsub.c              2002-04-27
# src/libregexp/rregexec.c        sys/src/libregexp/rregexec.c            2000-06-07  Skip 2003-07-14
# src/libregexp/rregsub.c         sys/src/libregexp/rregsub.c             2002-04-27
# src/libregexp/test.c            sys/src/libregexp/test.c                1992-09-21  Skip 1995-04-05
# src/libregexp/test2.c           sys/src/libregexp/test2.c               1992-09-21  Skip 1995-04-05

# src/libutf/rune.c               sys/src/libc/port/rune.c
# src/libutf/runestrcat.c         sys/src/libc/port/runestrcat.c
# src/libutf/runestrchr.c         sys/src/libc/port/runestrchr.c
# src/libutf/runestrcmp.c         sys/src/libc/port/runestrcmp.c
# src/libutf/runestrcpy.c         sys/src/libc/port/runestrcpy.c
# src/libutf/runestrdup.c         sys/src/libc/port/runestrdup.c
# src/libutf/runestrecpy.c        sys/src/libc/port/runestrecpy.c
# src/libutf/runestrlen.c         sys/src/libc/port/runestrlen.c
# src/libutf/runestrncat.c        sys/src/libc/port/runestrncat.c
# src/libutf/runestrncmp.c        sys/src/libc/port/runestrncmp.c
# src/libutf/runestrncpy.c        sys/src/libc/port/runestrncpy.c
# src/libutf/runestrrchr.c        sys/src/libc/port/runestrrchr.c
# src/libutf/runestrstr.c         sys/src/libc/port/runestrstr.c
# src/libutf/runetype.c           sys/src/libc/port/runetype.c
# src/libutf/utf.7                sys/man/6/utf
# src/libutf/utfecpy.c            sys/src/libc/port/utfecpy.c
# src/libutf/utflen.c             sys/src/libc/port/utflen.c
# src/libutf/utfnlen.c            sys/src/libc/port/utfnlen.c
# src/libutf/utfrrune.c           sys/src/libc/port/utfrrune.c
# src/libutf/utfrune.c            sys/src/libc/port/utfrune.c
# src/libutf/utfutf.c             sys/src/libc/port/utfutf.c

# There is no unifying version for libbio. I assume files were copied
# individually, ad hoc, into a fork and changes were only sometimes
# incorporated. Rather than merging separate histories for each, revert commits
# are simpler to implement and likely to understand.

cp man/man3/bio.3 src/libbio/bio.3
cp include/bio.h src/libbio/bio.h
cp man/man3/fmtinstall.3 src/libfmt/fmtinstall.3
cp man/man3/print.3 src/libfmt/print.3
cp man/man3/regexp9.3 src/libregexp/regexp9.3
cp include/regexp9.h src/libregexp/regexp9.h
cp man/man3/isalpharune.3 src/libutf/isalpharune.3
cp man/man3/rune.3 src/libutf/rune.3
cp man/man3/runestrcat.3 src/libutf/runestrcat.3
git add -A
git commit -m 'Copy man3 docs and headers into libraries'

mkdir -p sys/src/libc/port
git checkout 3e12c5d1bb89fc02707907988834ef147769ddaf -- sys/src/libc/port/charstod.c
git rm src/libfmt/charstod.c
git mv sys/src/libc/port/charstod.c src/libfmt/charstod.c
git tcommit -m 'libfmt: Revert Third Edition 2000-10-14 changes to charstod.c

This partially reverts https://github.com/plan9foundation/plan9/commit/59cc4ca53493a3c6d2349fe2b7f7c40f7dce7294'

mkdir -p sys/src/libc/port
git checkout 9a747e4fd48b9f4522c70c07e8f882a15030f964 -- sys/src/libc/port/encodefmt.c
git rm src/lib9/encodefmt.c
git mv sys/src/libc/port/encodefmt.c src/lib9/encodefmt.c
git commit -m 'lib9: Revert Fourth Edition 2003-02-06 changes to encodefmt.c

This partially reverts https://github.com/plan9foundation/plan9/commit/7fd46167d91ac0c2e35d4b71179b3ebdd8b6621a'

mkdir -p sys/src/libbio
git checkout 7dd7cddf99dd7472612f1413b4da293630e6b1bc~ -- sys/src/libbio/{binit,bputc,bwrite}.c
git rm src/libbio/{binit,bputc,bwrite}.c
git mv sys/src/libbio/{binit,bputc,bwrite}.c src/libbio/
git commit -m 'libbio: Revert Third Edition 2000-06-07 changes to binit.c, bputc.c, and bwrite.c

This partially reverts https://github.com/plan9foundation/plan9/commit/7dd7cddf99dd7472612f1413b4da293630e6b1bc'

mkdir -p sys/src/libbio
git checkout 9a747e4fd48b9f4522c70c07e8f882a15030f964~ -- sys/src/libbio/bprint.c
git rm src/libbio/bprint.c
git mv sys/src/libbio/bprint.c src/libbio/bprint.c
git commit -m 'libbio: Revert bprint.c changes in Fourth Edition 2002-04-27

This partially reverts https://github.com/plan9foundation/plan9/commit/9a747e4fd48b9f4522c70c07e8f882a15030f964'

mkdir -p sys/src/libbio
git checkout 59cc4ca53493a3c6d2349fe2b7f7c40f7dce7294~ -- sys/src/libbio/bread.c
git rm src/libbio/bread.c
git mv sys/src/libbio/bread.c src/libbio/bread.c
git commit -m 'libbio: Revert Third Edition 2000-10-14 changes to bread.c

This partially reverts https://github.com/plan9foundation/plan9/commit/59cc4ca53493a3c6d2349fe2b7f7c40f7dce7294'

mkdir -p sys/src/libc/fmt
git checkout 65fa3f8b9a469d1a1f534b0eb39ee25caab832bb~ -- sys/src/libc/fmt/fmtstr.c
git rm src/libfmt/fmtstr.c
git mv sys/src/libc/fmt/fmtstr.c src/libfmt/fmtstr.c
GIT_AUTHOR_DATE='2024-01-16 01:26:06 -0800' GIT_COMMITTER_DATE='2024-01-16 01:26:06 -0800' \
git commit -m 'libfmt: Revert Fourth Edition 2003-03-28 changes to fmtstr.c

This partially reverts https://github.com/plan9foundation/plan9/commit/65fa3f8b9a469d1a1f534b0eb39ee25caab832bb'

# Reviewed for abnormal changes:
# - src/lib9
# - src/libbio
# - src/libfmt, through print.c

# TODO:
# - src/libbio/bio.h
# - src/libbio/lib9.h
# - src/libfmt/fmtdef.h
# - src/libfmt/pow10.c makes more sense coming from sys/src/libc/port/pow10.c
#   and reverting Third Edition 2000-10-14 59cc4ca53493a3c6d2349fe2b7f7c40f7dce7294
