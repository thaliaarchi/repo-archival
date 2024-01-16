#!/bin/bash

# Disable unreachable lint
# shellcheck disable=SC2317
echo 'Run manually'
exit 1

# The fork point of plan9port:
# at the latest 2003-09-30 f3e9c68aaa10d1977af2e6856bf303a75133e353
# NO  2003-09-30 f3e9c68aaa10d1977af2e6856bf303a75133e353
# NO  2003-09-19 67031067871d8cd705958f437682c703f042b640
# NO  2003-07-14 e34dbc32159cf6b992e3c875383330eae3abc0be
# ?
# yes 2003-04-12 f314cdf7834bd43eca346fc56576f76e4a83155b
# yes 2003-04-04 679c15e8e2152a2cec27f8698add03aa0b7ed835 for sys/src/libc/9sys/qlock.c
# NO  2003-02-06 7fd46167d91ac0c2e35d4b71179b3ebdd8b6621a for sys/src/libc/port/encodefmt.c
# yes 2002-12-13 6a9fc400c33447ef5e1cda7185cb4de2c8e8010e for sys/src/libc/fmt/dofmt.c
# yes 2002-12-12 d9306527b4a7229dcf0cf3c58aed36bb9da82854 (tagged)
# yes 2002-09-26 3ff48bf5ed603850fcd251ddf13025d23d693782 (tagged)
# yes 2002-05-03 b7b24591a7db843bfad3c8422d030e105c7ea168 (tagged)
# yes 2002-04-27 9a747e4fd48b9f4522c70c07e8f882a15030f964 (tagged)

cp man/man3/bio.3 src/libbio/bio.3
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
# src/lib9
# src/libbio
# src/libfmt, through print.c

# TODO:
# src/libbio/bio.h
# src/libbio/lib9.h
# src/libfmt/fmtdef.h
# src/libfmt/pow10.c might make more sense coming from sys/src/libc/port/pow10.c and reverting
