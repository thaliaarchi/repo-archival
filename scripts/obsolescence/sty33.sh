#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p obsolescence
cd obsolescence

clone_submodule https://github.com/obsolescence/pidp10 pidp10-st-0.9.2
cd pidp10-st-0.9.2

# Only two commits modify src/st-0.9.2. They are self-contained:

# commit 74b481b61a6e45213a3b6856352160b8b3f71d4a
# 2024-05-02 03:35:08 +0200  add st as telcon
#
# :000000 100... 0000000 ....... A	src/st-0.9.2/*

# commit 662891c0cb389c951efbd50fd1d1135f591fd328
# 2024-05-02 03:50:26 +0200  fix
#
# :100644 100644 8600ab6 f8e4462 M	src/st-0.9.2/config.h

git filter-repo --quiet --subdirectory-filter src/st-0.9.2

git remote add upstream "$(submodule_path git://git.suckless.org/st)"
git fetch -q upstream
# Graft 0.9.2 as the root commit.
git replace --graft "$(git rev-list --max-parents=0 HEAD)" 0.9.2
git filter-repo --quiet
cd ..

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

# Keep only sty and sounds and a font for it. Ignore the redundant bin/sounds/
# and the empty zip src/sty33.zip.
git diff --no-index bin/sounds/ src/sty/sounds/
git filter-repo --quiet \
  --subdirectory-filter src/sty \
  --path install/TTY33MAlc-Book.ttf --path-rename install/:

git remote add upstream "$(submodule_path git://git.suckless.org/st)"
git fetch -q upstream
# Replace "Various fixes" instead of grafting a root commit, because it is
# incomplete when extracted like this, "add sty src" adds the rest, and they are
# only a day apart.
git replace "$(git rev-list --max-parents=0 HEAD)" 0.9
git filter-repo --quiet
