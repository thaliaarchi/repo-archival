#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p regexp
cd regexp
mkdir redis-stringmatch
cd redis-stringmatch

# Filter the files relevant to stringmatch.
filter() {
  local dir="$1"
  local url="$2"
  clone_submodule "$url" "$dir"
  git -C "$dir" filter-repo --quiet \
    --path src/util.c --path src/util.h \
    --path redis.c --path src/redis.h \
    --path COPYING --path LICENSE.txt --path REDISCONTRIBUTIONS.txt \
    --path src/.clang-format \
    --commit-callback '
      commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: '"$url"'/commit/" + commit.original_id + b"\n"
    '
}

filter redis https://github.com/redis/redis
filter valkey https://github.com/valkey-io/valkey
filter keydb https://github.com/Snapchat/KeyDB

# Relevant commits:

# 2009-03-22 10:30:00 +0100 ed9b544e1 first commit
# 2010-02-19 11:23:57 +0100 12d090d2d A problem with replication with multiple slaves connectiong to a single master fixed. It was due to a typo, and reported on github by the user micmac. Also the copyright year fixed from many files.
# 2010-03-24 21:46:51 +0100 500ece7c1 CONFIG command implemened -- just a start but already useful
# 2010-06-22 00:07:48 +0200 e2641e09c redis.c split into many different C files.
# 2011-04-27 13:24:52 +0200 5d0819312 Tests for string2ll; move isObject* to object.c
# 2011-05-16 17:20:27 +0200 330c90b01 fmacros in utils.c to avoid warning about strcasecmp()
# 2012-11-08 18:25:23 +0100 4365e5b2d BSD license added to every C source and header file.
# 2012-11-08 19:14:29 +0100 5513397de Copyright date fixed in COPYING file.
# 2014-02-03 02:10:54 -0800 79270cae6 update copyright year
# 2014-11-12 21:58:57 -0500 8febcffdc Allow all code tests to run using Redis args
# 2015-04-21 18:54:49 +0300 921ca063f update copyright year
# 2017-12-12 01:25:03 +0100 f43eb5adc Prevent off-by-one read in stringmatchlen() (fixes #4527)
# 2018-12-11 13:18:52 +0100 c710d4afd Fix stringmatchlen() read past buffer bug.
# 2018-12-11 13:29:30 +0100 a31ca8d75 stringmatchlen() fuzz test added.
# 2020-05-06 16:18:21 +0200 e17f9311c stringmatchlen() should not expect null terminated strings.
# 2020-06-23 09:51:12 -0700 2d6d9f755 updated copyright year
# 2023-02-12 15:23:29 +0800 7dae142a2 Reclaim page cache of RDB file (#11248)
# 2023-02-28 15:15:26 +0200 dcbfcb916 String pattern matching had exponential time complexity on pathological patterns (CVE-2022-36021) (#11858)
# 2023-11-23 13:22:20 +0200 2e854bccc Fix async safety in signal handlers (#12658)
# 2024-03-20 22:38:24 +0000 0b3439692 Change license from BSD-3 to dual RSALv2+SSPLv1 (#13157)
