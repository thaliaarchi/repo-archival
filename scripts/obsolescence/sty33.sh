#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p obsolescence
cd obsolescence

clone_submodule https://github.com/obsolescence/pidp11 pidp11-sty

cd pidp11-sty

# Only two commits modify sty. Their relevant files are:

# commit 6fcc60e746b1b986822c1e42fb5e730679ceba28
# 2024-11-30 13:48:08 +0100  Various fixes
#
# :000000 100644 0000000 4cdd64c A	bin/sounds/README.md
# :000000 100644 0000000 ....... A	bin/sounds/*.wav
# :000000 100644 0000000 0725423 A	install/TTY33MAlc-Book.ttf
# :000000 100644 0000000 9eeeb51 A	src/sty33.zip

# commit a311e7ae42a27e324803b9026579ac2f08d82e44
# 2024-12-01 14:11:05 +0100  add sty src
#
# :000000 100644 0000000 561ad7b A	src/sty/Makefile
# :000000 100644 0000000 6a846ed A	src/sty/README
# :000000 100644 0000000 a22e019 A	src/sty/arg.h
# :000000 100644 0000000 6224c9e A	src/sty/config.h
# :000000 100644 0000000 5a14788 A	src/sty/config.mk
# :000000 100644 0000000 661e562 A	src/sty/newwin.c
# :000000 100644 0000000 ef3e461 A	src/sty/sounds.c
# :000000 100644 0000000 4cdd64c A	src/sty/sounds/README.md
# :000000 100644 0000000 ....... A	src/sty/sounds/*.wav
# :000000 100644 0000000 72a143d A	src/sty/st.c
# :000000 100644 0000000 2bdb438 A	src/sty/st.h
# :000000 100644 0000000 6de960d A	src/sty/win.h
# :000000 100644 0000000 982f5b3 A	src/sty/wintest.c
# :000000 100644 0000000 1a42a35 A	src/sty/x.c
# :100644 000000 9eeeb51 0000000 D	src/sty33.zip

# Keep only sty and sounds and a font for it. Merge the identical bin/sounds/
# and src/sty/sounds/. Ignore src/sty33.zip, as it is an empty zip.
git filter-repo --quiet \
  --path src/sty/ --path-rename src/sty/: \
  --path bin/sounds/ --path-rename bin/: \
  --path install/TTY33MAlc-Book.ttf --path-rename install/:

git remote add upstream "$(submodule_path git://git.suckless.org/st)"
git fetch -q upstream
# Replace "Various fixes" instead of grafting a root commit, because it is
# incomplete when extracted like this, "add sty src" adds the rest, and they are
# only a day apart.
git replace "$(git rev-list --max-parents=0 HEAD)" 0.9
git filter-repo --quiet
