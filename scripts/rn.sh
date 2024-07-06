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

# https://usenetarchives.com/threads.php?id=net.sources&y=NaN&r=NaN&p=78
unshar_usenet_post PDEzMzJAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 1 of 8)
unshar_usenet_post PDEzMzNAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 2 of 8)
unshar_usenet_post PDEzMzRAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 3 of 8)
unshar_usenet_post PDEzMzVAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 4 of 8)
unshar_usenet_post PDEzMzZAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 5 of 8)
unshar_usenet_post PDEzMzdAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 6 of 8)
unshar_usenet_post PDEzMzhAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 7 of 8)
unshar_usenet_post PDEzMzlAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 8 of 8)

rm kit{1,2,3,4,5,6,7,8}isdone
git add -A

commit "$(get_usenet_post_date PDEzMzJAc2RjcmRjZi5VVUNQPg)" \
'rn version 4.1

Source: "rn version 4.1 distribution kit" in net.sources
- part 1: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzJAc2RjcmRjZi5VVUNQPg
- part 2: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzNAc2RjcmRjZi5VVUNQPg
- part 3: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzRAc2RjcmRjZi5VVUNQPg
- part 4: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzVAc2RjcmRjZi5VVUNQPg
- part 5: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzZAc2RjcmRjZi5VVUNQPg
- part 6: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzdAc2RjcmRjZi5VVUNQPg
- part 7: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzhAc2RjcmRjZi5VVUNQPg
- part 8: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzlAc2RjcmRjZi5VVUNQPg'

git rm -qr .

# https://usenetarchives.com/threads.php?id=net.sources&y=NaN&r=NaN&p=80
unshar_usenet_post PDEzNThAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 1 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post PDEzNTlAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 2 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post PDEzNjBAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 3 of 8 (reposting 1,2,3 & 7)
unshar_usenet_post PDEzNjFAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 7 of 8 (reposting 1,2,3 & 7)
# https://usenetarchives.com/threads.php?id=net.sources&y=NaN&r=NaN&p=82
unshar_usenet_post PDEzODBAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 4 of 8 (reposting 4,5,6 & 8)
unshar_usenet_post PDEzODFAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 5 of 8 (reposting 4,5,6 & 8)
unshar_usenet_post PDEzODJAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 8 of 8 (reposting 4,5,6 & 8)
unshar_usenet_post PDEzODNAc2RjcmRjZi5VVUNQPg # Rn version 4.1, part 6 of 8 (reposting 4,5,6 & 8)

rm kit{1,2,3,4,5,6,7,8}isdone
git add -A
git diff --quiet --cached || echo 'Repost is not identical'

# "rn - part 1 of 8 (reposting)" is a garbled shar a month later by Adrian Pell
# https://usenetarchives.com/view.php?id=net.sources&mid=PDc4NUBydS1jczQ0LlVVQ1A%2B
