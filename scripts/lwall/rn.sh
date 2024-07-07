#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - Apply *.pat patches that are distributed with 4.1 and 4.3
# - Handle manifake and manimake
# - "code for rn speedup by buffering" https://usenetarchives.com/view.php?id=net.sources&mid=PDUxNUBsc3VjLlVVQ1A%2B

# Email from README, rn.c, rn.man, and Configure.
export AUTHOR='Larry Wall <lwall@sdcrdcf.UUCP>'

mkdir -p lwall
cd lwall
mkdir rn
cd rn
git init -q

unshar_usenet_post net.sources PDEzMzJAc2RjcmRjZi5VVUNQPg
unshar_usenet_post net.sources PDEzMzNAc2RjcmRjZi5VVUNQPg
unshar_usenet_post net.sources PDEzMzRAc2RjcmRjZi5VVUNQPg
unshar_usenet_post net.sources PDEzMzVAc2RjcmRjZi5VVUNQPg
unshar_usenet_post net.sources PDEzMzZAc2RjcmRjZi5VVUNQPg
unshar_usenet_post net.sources PDEzMzdAc2RjcmRjZi5VVUNQPg
unshar_usenet_post net.sources PDEzMzhAc2RjcmRjZi5VVUNQPg
unshar_usenet_post net.sources PDEzMzlAc2RjcmRjZi5VVUNQPg
rm kit{1,2,3,4,5,6,7,8}isdone
git add -A

commit "$(get_usenet_post_date net.sources PDEzMzJAc2RjcmRjZi5VVUNQPg)" \
'rn version 4.1

Synthesized-from: net.sources
  * "rn version 4.1 distribution kit (part 1 of 8)" https://groups.google.com/g/net.sources/c/xUGB_4Meno8
    https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzJAc2RjcmRjZi5VVUNQPg
  * "rn version 4.1 distribution kit (part 2 of 8)" https://groups.google.com/g/net.sources/c/XUBHx73xK7s
    https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzNAc2RjcmRjZi5VVUNQPg
  * "rn version 4.1 distribution kit (part 3 of 8)" https://groups.google.com/g/net.sources/c/X78CZnttHqg
    https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzRAc2RjcmRjZi5VVUNQPg
  * "rn version 4.1 distribution kit (part 4 of 8)" https://groups.google.com/g/net.sources/c/U8wjLYgZ9XQ
    https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzVAc2RjcmRjZi5VVUNQPg
  * "rn version 4.1 distribution kit (part 5 of 8)" https://groups.google.com/g/net.sources/c/9MA0hI3j4iI
    https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzZAc2RjcmRjZi5VVUNQPg
  * "rn version 4.1 distribution kit (part 6 of 8)" https://groups.google.com/g/net.sources/c/FFbGY5bbixE
    https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzdAc2RjcmRjZi5VVUNQPg
  * "rn version 4.1 distribution kit (part 7 of 8)" https://groups.google.com/g/net.sources/c/iLF8GYR36k8
    https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzhAc2RjcmRjZi5VVUNQPg
  * "rn version 4.1 distribution kit (part 8 of 8)" https://groups.google.com/g/net.sources/c/g8oUj9EgApA
    https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzlAc2RjcmRjZi5VVUNQPg'

git rm -qr .
unshar_usenet_post net.sources PDEzNThAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 1 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post net.sources PDEzNTlAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 2 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post net.sources PDEzNjBAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 3 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post net.sources PDEzNjFAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 7 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post net.sources PDEzODBAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 4 of 8 (reposting 4,5,6 & 8)
unshar_usenet_post net.sources PDEzODFAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 5 of 8 (reposting 4,5,6 & 8)
unshar_usenet_post net.sources PDEzODJAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 8 of 8 (reposting 4,5,6 & 8)
unshar_usenet_post net.sources PDEzODNAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 6 of 8 (reposting 4,5,6 & 8)
rm kit{1,2,3,4,5,6,7,8}isdone
git add -A
git diff --quiet --cached || echo 'Repost is not identical'

# "rn - part 1 of 8 (reposting)" is a garbled shar a month later by Adrian Pell
# https://usenetarchives.com/view.php?id=net.sources&mid=PDc4NUBydS1jczQ0LlVVQ1A%2B

git rm -qr .
chronic sh <(usenet_post_contents mod.sources PDgyMUBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents mod.sources PDgyMkBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents mod.sources PDgyM0BnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents mod.sources PDgyNUBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents mod.sources PDgyNkBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents mod.sources PDgyN0BnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents mod.sources PDgyOEBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents mod.sources PDgyOUBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents mod.sources PDgzMEBnZW5yYWQuVVVDUD4 | tail -n+4)
rm kit{1,2,3,4,5,6,7,8,9}isdone
git add -A

commit "$(get_usenet_post_date mod.sources PDgxOUBnZW5yYWQuVVVDUD4)" \
'rn version 4.3

I'\''ve just posted the new release of rn (version 4.3) to mod.sources.
 [For those who don'\''t already know:  rn is a news reading program that
  is an alternative to readnews or vnews - mod]

As soon as it works its way over to genrad, [it made it! - mod] you
should see it.  It now comes in nine, count '\''em, nine kits weighing
in at about half a Meg total.

This is primarily a cleanup release, but there are some new features.
The biggie is macros and keymaps.

Thank you all for your encouragement and ideas (even the ones I haven'\''t
done yet).  This is truly a net-wide project.

Larry Wall
{allegra,burdvax,cbosgd,hplabs,ihnp4,sdcsvax}!sdcrdcf!lwall

[ I have unpacked the newest rn, and run the Configure program.  You will
  be happy to hear that Configure is as entertaining in this release as
  it was in the previous release.   I will be posting the nine parts of
  rn 4.3 over the next several days, so don'\''t panic if you dont get it all
  at once.

               -   John Nelson,   moderator mod.sources

  P.S.  THIS rn has ABSOLUTELY nothing to do with the "rn" posted to
        net.sources several days ago.  This is the REAL rn.
]

Synthesized-from: mod.sources
  * "The REAL rn (rn 4.3 - part 0 of 9)" https://groups.google.com/g/mod.sources/c/ZGohbRfEi2w
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgxOUBnZW5yYWQuVVVDUD4
  * "rn version 4.3 (kit 1 of 9)" https://groups.google.com/g/mod.sources/c/hJok66uiWTU
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyMUBnZW5yYWQuVVVDUD4
  * "rn version 4.3 (kit 2 of 9)" https://groups.google.com/g/mod.sources/c/H7mx3N-0jk4
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyMkBnZW5yYWQuVVVDUD4
  * "rn version 4.3 (kit 3 of 9)" https://groups.google.com/g/mod.sources/c/27eQUTed3J0
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyM0BnZW5yYWQuVVVDUD4
  * "rn version 4.3 (kit 4 of 9)" https://groups.google.com/g/mod.sources/c/QzOejfSBrdQ
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyNUBnZW5yYWQuVVVDUD4
  * "rn version 4.3 (kit 5 of 9)" https://groups.google.com/g/mod.sources/c/hvSc-jCBMmY
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyNkBnZW5yYWQuVVVDUD4
  * "rn version 4.3 (kit 6 of 9)" https://groups.google.com/g/mod.sources/c/RM9voSBl-98
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyN0BnZW5yYWQuVVVDUD4
  * "rn version 4.3 (kit 7 of 9)" https://groups.google.com/g/mod.sources/c/WAihOBJZf7A
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyOEBnZW5yYWQuVVVDUD4
  * "rn version 4.3 (kit 8 of 9)" https://groups.google.com/g/mod.sources/c/jLfBDURu-_8
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyOUBnZW5yYWQuVVVDUD4
  * "rn version 4.3 (kit 9 of 9)" https://groups.google.com/g/mod.sources/c/0xMLaQS6V5s
    https://usenetarchives.com/view.php?id=mod.sources&mid=PDgzMEBnZW5yYWQuVVVDUD4'

# This post seems to have been interpreted as Shift JIS, as `\` from the
# original file has been encoded as UTF-8 `¥`.
chronic sh <(usenet_post_contents net.sources PDExNzhAcHVjYy1qPg | tail -n+13 | iconv -f UTF-8 -t SHIFT-JIS)

# Metadata from the patches
# File           Old                  New
#
## patch.1
# art.c          1985-05-10 13:52:54  1985-05-10 13:52:59
# head.c         1985-05-10 13:52:36  1985-05-10 13:52:39
#
## patch.2
# kfile.c        1985-05-10 14:22:47  1985-05-10 14:22:49
#
## patch.3
# ngstuff.c      1985-05-10 14:32:57  1985-05-10 14:32:59
#
## patch.4
# art.c          1985-05-13 09:32:42  1985-05-13 09:32:48
# artstate.h     1985-05-13 09:31:51  1985-05-13 09:31:52
# common.h       1985-05-13 09:31:29  1985-05-13 09:31:33
# ng.c           1985-05-13 09:32:07  1985-05-13 09:32:13
# rn.1           1985-05-13 09:33:24  1985-05-13 09:33:34
#
## patch.5
# rn.c           1985-05-13 09:36:19  1985-05-13 09:36:25
#
## patch.6
# term.h         1985-05-13 15:53:05  1985-05-13 15:53:09
#
## patch.7
# Makefile.SH    1985-05-13 17:22:15  1985-05-13 17:22:17
# Configure      1985-05-13 15:59:49  1985-05-13 16:00:35
# makedepend.SH  1985-05-13 15:59:22  1985-05-13 15:59:24
# config.sh      1985-04-01 16:18:20  1985-05-13 16:26:07
#
## patch.8
# respond.c      1985-05-14 08:57:20  1985-05-14 08:57:24
#
## patch.9
# intrp.c        1985-05-15 14:47:52  1985-05-15 14:48:07
# ndir.c         1985-05-15 14:50:24  1985-05-15 14:50:26
# respond.c      1985-05-15 14:49:17  1985-05-15 14:49:31
# util.c         1985-05-15 14:49:49  1985-05-15 14:49:53

commit_patch() {
  local patch="$1" date="$2"
  if [[ $patch = 7 ]]; then
    # Skip the patch to config.sh:
    # > NOTE: if patch says "File to patch:", it just means you haven't run
    # > Configure yet, and don't need the following patch.  Just type interrupt and
    # > you're done.
    sed '/Index: config\.sh/,$d' patch.7 | patch -s
  else
    patch -s < "patch.$patch"
  fi
  rm "patch.$patch"
  git add -u
  # The date is (probably) local. Since his timezone is unknown, use UTC.
  commit "$date +0000" 'rn 4.3 patch '"$patch"'

Synthesized-from: net.sources
  * "Rn 4.3 patches 1-10" https://groups.google.com/g/net.sources/c/ELYIv7jkrZs
    https://usenetarchives.com/view.php?id=net.sources&mid=PDExNzhAcHVjYy1qPg'
}

echo 'Patch #: 0' > patchlevel
commit_patch 1 '1985-05-10 13:52:59'
commit_patch 2 '1985-05-10 14:22:49'
commit_patch 3 '1985-05-10 14:32:59'
commit_patch 4 '1985-05-13 09:33:34'
commit_patch 5 '1985-05-13 09:36:25'
commit_patch 6 '1985-05-13 15:53:09'
commit_patch 7 '1985-05-13 17:22:17'
commit_patch 8 '1985-05-14 08:57:24'
commit_patch 9 '1985-05-15 14:50:26'
rm patchlevel
