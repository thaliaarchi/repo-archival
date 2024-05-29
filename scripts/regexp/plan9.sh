#!/bin/bash -e

. base.sh

mkdir -p regexp
cd regexp

clone_submodule https://github.com/plan9foundation/plan9
cd plan9

git filter-repo \
  --commit-callback '
    commit.author_name = b"Glenda"
    commit.committer_name = b"Glenda"
    commit.author_email = b""
    commit.committer_email = b""
    commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: https://github.com/plan9foundation/plan9/commit/" + commit.original_id + b"\n"
  ' \
  --paths-from-file <(cat <<EOF

# First Edition 1992-09-21
sys/include/ape/regexp.h
sys/include/regexp.h
sys/man/2/regexp
sys/man/6/regexp
sys/src/ape/lib/regexp/mkfile
sys/src/ape/lib/regexp/regaux.c
sys/src/ape/lib/regexp/regcomp.c
sys/src/ape/lib/regexp/regcomp.h
sys/src/ape/lib/regexp/regerror.c
sys/src/ape/lib/regexp/regexec.c
sys/src/ape/lib/regexp/regsub.c
sys/src/ape/lib/regexp/rregexec.c
sys/src/ape/lib/regexp/rregsub.c
sys/src/cmd/awk/re.c
sys/src/cmd/sam/regexp.c
sys/src/cmd/upas/README
sys/src/libregexp/mkfile
sys/src/libregexp/regaux.c
sys/src/libregexp/regcomp.c
sys/src/libregexp/regcomp.h
sys/src/libregexp/regerror.c
sys/src/libregexp/regexec.c
sys/src/libregexp/regsub.c
sys/src/libregexp/rregexec.c
sys/src/libregexp/rregsub.c
## Deleted in Second Edition 1995-04-05
sys/src/libregexp/test.c
sys/src/libregexp/test2.c

# Second Edition 1995-04-05
sys/src/ape/cmd/README
sys/src/ape/cmd/expr/regexp.h
## Deleted in Third Edition 2000-06-07
sys/include/alef/regexp.h
sys/src/alef/lib/libregexp/acid.mips
sys/src/alef/lib/libregexp/mkfile
sys/src/alef/lib/libregexp/regaux.l
sys/src/alef/lib/libregexp/regcomp.h
sys/src/alef/lib/libregexp/regcomp.l
sys/src/alef/lib/libregexp/regerror.l
sys/src/alef/lib/libregexp/regexec.l
sys/src/alef/lib/libregexp/regsub.l
sys/src/alef/lib/libregexp/rregexec.l
sys/src/alef/lib/libregexp/rregsub.l
## Renamed in Third Edition 2000-06-07
sys/src/cmd/acme/regx.l

# Third Edition 2000-06-07
LICENSE
LICENSE.old
NOTICE
NOTICE.old
README
sys/src/cmd/acme/regx.c
sys/src/NOTICE
sys/src/NOTICE.old
## Only for Lucida fonts
#LICENSE.lucida

# Fourth Edition 2002-04-27
sys/src/ape/cmd/pax/PATCHLEVEL
sys/src/ape/cmd/pax/README
sys/src/ape/cmd/pax/regexp.c
sys/src/ape/cmd/pax/regexp.h

# Fourth Edition 2003-02-26
sys/src/ape/cmd/diff/COPYING
sys/src/ape/cmd/diff/NEWS
sys/src/ape/cmd/diff/README
sys/src/ape/cmd/diff/regex.c
sys/src/ape/cmd/diff/regex.h

# Fourth Edition 2003-06-26
LICENSE.gpl

# Fourth Edition 2003-06-29
## Only for AFPL Ghostscript
#LICENSE.afpl

# Fourth Edition 2003-09-20
sys/src/cmd/upas/bayes/dfa.c
sys/src/cmd/upas/bayes/dfa.h
sys/src/cmd/upas/bayes/regcomp.c
sys/src/cmd/upas/bayes/regen.c

# Fourth Edition 2013-03-01
## Deleted in Fourth Edition 2013-03-02
sys/src/cmd/rc/unix/include/regexp9.h

EOF
)

# Delete all tags, since denoting dated releases is less useful in a subset
# history.
git tag | chronic xargs git tag -d

patch -s -p1 < "$(get_cached_path http://9legacy.org/9legacy/patch/libregexp-fixes.diff)"
git add -A

# Metadata listed at http://9legacy.org/patch.html
commit 'David du Colombier <0intro@gmail.com> 2015-08-09 00:00:00 +0000' 'Various fixes in libregexp' \
  --trailer Source:http://9legacy.org/9legacy/patch/libregexp-fixes.diff
