#!/bin/bash -e

. base.sh

mkdir -p regexp
cd regexp

copy_submodule github.com/9fans/plan9port
cd plan9port

git filter-repo \
  --commit-callback '
    commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: https://github.com/9fans/plan9port/commit/" + commit.original_id + b"\n"
  ' \
  --paths-from-file <(cat <<EOF

CHANGES
LICENSE
README.md
include/regexp.h
include/regexp9.h
man/man3/regexp.html
man/man3/regexp9.3
man/man3/regexp.3
man/man7/regexp.html
man/man7/regexp9.7
man/man7/regexp.7
src/cmd/acme/regx.c
src/cmd/awk/README
src/cmd/awk/re.c
src/cmd/sam/LICENSE
src/cmd/sam/README
src/cmd/sam/regexp.c
src/libregexp/
unix/NOTICE.regexp
unix/README
unix/README.dot
unix/mkfile.regexp
unix/make/Makefile.regexp
unix/man/regexp9.3
unix/man/regexp9.7

EOF
)

git branch -m master main
