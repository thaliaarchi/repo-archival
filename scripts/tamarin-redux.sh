#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

hg_repo="$TOPLEVEL/hg/hg.mozilla.org/tamarin-redux"
if [[ ! -e $hg_repo ]]; then
  hg clone https://hg.mozilla.org/tamarin-redux "$hg_repo"
fi

hg_to_git "$hg_repo" tamarin-redux

# hg-fast-export does not produce the same converted repo as pnkfelix's mirror
# at https://github.com/pnkfelix/tamarin-redux. The first differing commit is
# Mercurial changeset [ef6478309778](https://hg.mozilla.org/tamarin-redux/rev/ef6478309778b65fdf6935817b2bb1344a432f97)
# (Merge Sampler additions, we want the one from CVS, 2007-05-11), which
# converts to hg-fast-export commit 7423c4a218f039b017f7cad56a81cf7d6f84a363
# and pnkfelix commit 0862bbd043273d6e802ac71c3ea1151686a1e603. The difference
# is the order of the parents is swapped. hg-fast-export reproduces the correct
# topology.

# The topology in Mercurial at that point:

# o    changeset:   85:ef6478309778
# |\   parent:      83:b08e0e979c05
# | |  parent:      84:f904bf95ec8c
# | |  date:        Fri May 11 19:43:01 2007 -0400
# | |  summary:     Merge Sampler additions, we want the one from CVS.
# | |
# | o  changeset:   84:f904bf95ec8c
# | |  parent:      82:7d9ae3389f5d
# | |  date:        Fri May 11 16:03:41 2007 -0400
# | |  summary:     add missing core/Sampler.cpp and core/Sampler.h files
# | |
# o |  changeset:   83:b08e0e979c05
# |/   date:        Fri May 11 19:34:31 2007 -0400
# |    summary:     Missing Sampler files from CVS import
# |
# o  changeset:   82:7d9ae3389f5d
# |  date:        Tue Mar 27 19:06:49 2007 +0000
# |  summary:     bug 375561.  Make Linux happy.

# The topology as converted by hg-fast-export:

# *   7423c4a21 (parents 02a50fb1e 6d480e8b1) Merge Sampler additions, we want the one from CVS.
# |\
# | * 6d480e8b1 (parents e4f020223) add missing core/Sampler.cpp and core/Sampler.h files
# * | 02a50fb1e (parents e4f020223) Missing Sampler files from CVS import
# |/
# * e4f020223 (parents bc00a91e9)      bug 375561.  Make Linux happy.

# The topology of pnkfelix's mirror:

# *   0862bbd04 (parents 6d480e8b1 02a50fb1e) Merge Sampler additions, we want the one from CVS.
# |\
# | * 02a50fb1e (parents e4f020223) Missing Sampler files from CVS import
# * | 6d480e8b1 (parents e4f020223) add missing core/Sampler.cpp and core/Sampler.h files
# |/
# * e4f020223 (parents bc00a91e9)      bug 375561.  Make Linux happy.
