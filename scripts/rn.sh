#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - "code for rn speedup by buffering" https://usenetarchives.com/view.php?id=net.sources&mid=PDUxNUBsc3VjLlVVQ1A%2B
# - "Rn 4.3 patches 1-10" https://usenetarchives.com/view.php?id=net.sources&mid=PDExNzhAcHVjYy1qPg

# Email from README, rn.c, rn.man, and Configure.
export AUTHOR='Larry Wall <lwall@sdcrdcf.UUCP>'

mkdir rn
cd rn
git init -q

unshar_usenet_post PDEzMzJAc2RjcmRjZi5VVUNQPg
unshar_usenet_post PDEzMzNAc2RjcmRjZi5VVUNQPg
unshar_usenet_post PDEzMzRAc2RjcmRjZi5VVUNQPg
unshar_usenet_post PDEzMzVAc2RjcmRjZi5VVUNQPg
unshar_usenet_post PDEzMzZAc2RjcmRjZi5VVUNQPg
unshar_usenet_post PDEzMzdAc2RjcmRjZi5VVUNQPg
unshar_usenet_post PDEzMzhAc2RjcmRjZi5VVUNQPg
unshar_usenet_post PDEzMzlAc2RjcmRjZi5VVUNQPg
rm kit{1,2,3,4,5,6,7,8}isdone
git add -A

commit "$(get_usenet_post_date PDEzMzJAc2RjcmRjZi5VVUNQPg)" \
'rn version 4.1

Source: net.sources
* "rn version 4.1 distribution kit (part 1 of 8)" https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzJAc2RjcmRjZi5VVUNQPg
* "rn version 4.1 distribution kit (part 2 of 8)" https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzNAc2RjcmRjZi5VVUNQPg
* "rn version 4.1 distribution kit (part 3 of 8)" https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzRAc2RjcmRjZi5VVUNQPg
* "rn version 4.1 distribution kit (part 4 of 8)" https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzVAc2RjcmRjZi5VVUNQPg
* "rn version 4.1 distribution kit (part 5 of 8)" https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzZAc2RjcmRjZi5VVUNQPg
* "rn version 4.1 distribution kit (part 6 of 8)" https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzdAc2RjcmRjZi5VVUNQPg
* "rn version 4.1 distribution kit (part 7 of 8)" https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzhAc2RjcmRjZi5VVUNQPg
* "rn version 4.1 distribution kit (part 8 of 8)" https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzlAc2RjcmRjZi5VVUNQPg'

git rm -qr .
unshar_usenet_post PDEzNThAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 1 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post PDEzNTlAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 2 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post PDEzNjBAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 3 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post PDEzNjFAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 7 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post PDEzODBAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 4 of 8 (reposting 4,5,6 & 8)
unshar_usenet_post PDEzODFAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 5 of 8 (reposting 4,5,6 & 8)
unshar_usenet_post PDEzODJAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 8 of 8 (reposting 4,5,6 & 8)
unshar_usenet_post PDEzODNAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 6 of 8 (reposting 4,5,6 & 8)
rm kit{1,2,3,4,5,6,7,8}isdone
git add -A
git diff --quiet --cached || echo 'Repost is not identical'

# "rn - part 1 of 8 (reposting)" is a garbled shar a month later by Adrian Pell
# https://usenetarchives.com/view.php?id=net.sources&mid=PDc4NUBydS1jczQ0LlVVQ1A%2B

git rm -qr .
get_usenet_post PDgxOUBnZW5yYWQuVVVDUD4
get_usenet_post PDgyMUBnZW5yYWQuVVVDUD4
get_usenet_post PDgyMkBnZW5yYWQuVVVDUD4
get_usenet_post PDgyM0BnZW5yYWQuVVVDUD4
get_usenet_post PDgyNUBnZW5yYWQuVVVDUD4
get_usenet_post PDgyNkBnZW5yYWQuVVVDUD4
get_usenet_post PDgyN0BnZW5yYWQuVVVDUD4
get_usenet_post PDgyOEBnZW5yYWQuVVVDUD4
get_usenet_post PDgyOUBnZW5yYWQuVVVDUD4
get_usenet_post PDgzMEBnZW5yYWQuVVVDUD4
chronic sh <(usenet_post_contents PDgyMUBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents PDgyMkBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents PDgyM0BnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents PDgyNUBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents PDgyNkBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents PDgyN0BnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents PDgyOEBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents PDgyOUBnZW5yYWQuVVVDUD4 | tail -n+4)
chronic sh <(usenet_post_contents PDgzMEBnZW5yYWQuVVVDUD4 | tail -n+4)
rm kit{1,2,3,4,5,6,7,8,9}isdone
git add -A

commit "$(get_usenet_post_date PDgxOUBnZW5yYWQuVVVDUD4)" \
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

Source: mod.sources
* "The REAL rn (rn 4.3 - part 0 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgxOUBnZW5yYWQuVVVDUD4
* "rn version 4.3 (kit 1 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyMUBnZW5yYWQuVVVDUD4
* "rn version 4.3 (kit 2 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyMkBnZW5yYWQuVVVDUD4
* "rn version 4.3 (kit 3 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyM0BnZW5yYWQuVVVDUD4
* "rn version 4.3 (kit 4 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyNUBnZW5yYWQuVVVDUD4
* "rn version 4.3 (kit 5 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyNkBnZW5yYWQuVVVDUD4
* "rn version 4.3 (kit 6 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyN0BnZW5yYWQuVVVDUD4
* "rn version 4.3 (kit 7 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyOEBnZW5yYWQuVVVDUD4
* "rn version 4.3 (kit 8 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyOUBnZW5yYWQuVVVDUD4
* "rn version 4.3 (kit 9 of 9)" https://usenetarchives.com/view.php?id=mod.sources&mid=PDgzMEBnZW5yYWQuVVVDUD4'
