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
    --preserve-commit-hashes \
    --commit-callback '
      commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: '"$url"'/commit/" + commit.original_id + b"\n"
    '
}

filter redis https://github.com/redis/redis
filter valkey https://github.com/valkey-io/valkey
filter keydb https://github.com/Snapchat/KeyDB

# Relevant commits:
# 2009-03-22 10:30:00 +0100 redis:ed9b544e1 first commit
# 2010-02-19 11:23:57 +0100 redis:12d090d2d A problem with replication with multiple slaves connectiong to a single master fixed. It was due to a typo, and reported on github by the user micmac. Also the copyright year fixed from many files.
# 2010-03-24 21:46:51 +0100 redis:500ece7c1 CONFIG command implemened -- just a start but already useful
# 2010-06-22 00:07:48 +0200 redis:e2641e09c redis.c split into many different C files.
# 2011-04-27 13:24:52 +0200 redis:5d0819312 Tests for string2ll; move isObject* to object.c
# 2011-05-16 17:20:27 +0200 redis:330c90b01 fmacros in utils.c to avoid warning about strcasecmp()
# 2012-11-08 18:25:23 +0100 redis:4365e5b2d BSD license added to every C source and header file.
# 2012-11-08 19:14:29 +0100 redis:5513397de Copyright date fixed in COPYING file.
# 2014-02-03 02:10:54 -0800 redis:79270cae6 update copyright year
# 2014-11-12 21:58:57 -0500 redis:8febcffdc Allow all code tests to run using Redis args
# 2015-04-21 18:54:49 +0300 redis:921ca063f update copyright year
# 2017-12-12 01:25:03 +0100 redis:f43eb5adc Prevent off-by-one read in stringmatchlen() (fixes #4527)
# 2018-12-11 13:18:52 +0100 redis:c710d4afd Fix stringmatchlen() read past buffer bug.
# 2018-12-11 13:29:30 +0100 redis:a31ca8d75 stringmatchlen() fuzz test added.
# 2020-05-06 16:18:21 +0200 redis:e17f9311c stringmatchlen() should not expect null terminated strings.
# 2020-06-23 09:51:12 -0700 redis:2d6d9f755 updated copyright year
# 2023-02-12 15:23:29 +0800 redis:7dae142a2 Reclaim page cache of RDB file (#11248)
# 2023-02-28 15:15:26 +0200 redis:dcbfcb916 String pattern matching had exponential time complexity on pathological patterns (CVE-2022-36021) (#11858)
# 2023-11-23 13:22:20 +0200 redis:2e854bccc Fix async safety in signal handlers (#12658)
# 2024-03-20 22:38:24 +0000 redis:0b3439692 Change license from BSD-3 to dual RSALv2+SSPLv1 (#13157)

# KeyDB license updates:
# 2009-03-22 10:30:00 +0100 redis:ed9b544e1 first commit
# 2012-11-08 19:14:29 +0100 redis:5513397de Copyright date fixed in COPYING file.
# 2014-02-03 02:10:54 -0800 redis:79270cae6 update copyright year
# 2015-04-21 18:54:49 +0300 redis:921ca063f update copyright year
# 2019-02-23 02:27:19 -0500 KeyDB:d912013d1 Update copyright to include additional authorship
# 2019-11-19 22:22:16 -0500 KeyDB:93dae1f03 Clarify license
# 2020-06-23 09:51:12 -0700 redis:2d6d9f755 updated copyright year
# 2022-05-12 17:26:46 +0000 KeyDB:e2e1b4d5d Update license
