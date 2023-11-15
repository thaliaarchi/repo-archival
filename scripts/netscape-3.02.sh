#!/bin/bash -e

. base.sh

# This appears to be a CVS check-out (i.e., no history) of Netscape 3.02 by
# Jamie Zawinski with personal changes noted in README.jwz and wrapped in
# `#ifdef DEBUG_jwz`.
#
# The earliest file modtime is 1995-08-15 10:05:23 UTC (ns302/nspr/include/os/Makefile)
# and the latest file modtime is 2004-11-02 23:45:24 UTC (ns302/lib/libmime/Makefile).
# Several directories were modified 2010-09-01 10:37:42 UTC, possibly when it
# was archived. It was uploaded to the Internet Archive 2011-10-28 by Jason
# Scott.
#
# Netscape 3.02 was released some time between August 1996 and July 1997 (https://en.wikipedia.org/wiki/Netscape_(web_browser)#Release_history).
# For comparison, the first commit in the Gecko source tree was
# 1998-03-28 02:44:41 +0000 (https://github.com/mozilla/gecko-dev/tree/3b56a9af51519d2e77e05efa672a13e6be2e9ebc).
#
# A commenter on IA notes that it only has the X Window front-end (xfe) and is
# missing the Mac (macfe) and Windows (winfe) front-ends. A blog post remarks on
# other missing components (https://virtuallyfun.com/2021/03/19/netscape-3-02-aka-hiding-in-plain-site/).

# https://archive.org/details/netscape-communicator-3-0-2-source
tar xf "$(get_cached_path https://archive.org/download/netscape-communicator-3-0-2-source/ns302.tar.bz2)"
mv ns302 netscape-3.02

cd netscape-3.02
git init
git add -Af

# Use the date of the last modified file in the archive.
GIT_AUTHOR_NAME='Jamie Zawinski' GIT_AUTHOR_EMAIL='jwz@netscape.com' GIT_AUTHOR_DATE='2004-11-02 23:45:24 +0000' \
GIT_COMMITTER_NAME='Jamie Zawinski' GIT_COMMITTER_EMAIL='jwz@netscape.com' GIT_COMMITTER_DATE='2004-11-02 23:45:24 +0000' \
git commit -m ''

git remote add origin https://github.com/thaliaarchi/netscape-3.02
