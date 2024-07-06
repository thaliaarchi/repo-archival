#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

extract_post() {
  local post_id="$1"
  local file
  file="$(get_usenet_post "$post_id")"
  sh <(jq -r '
    def assert(pred; message): if pred | not then error(message) end;
    assert(length == 1; "expected 1 post") | .[0].body |
    assert(length == 1; "expected 1 body") | .[0].content
  ' "$file")
}

mkdir rn
cd rn
git init -q

extract_post PDEzMzJAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 1 of 8)
extract_post PDEzMzNAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 2 of 8)
extract_post PDEzMzRAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 3 of 8)
extract_post PDEzMzVAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 4 of 8)
extract_post PDEzMzZAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 5 of 8)
extract_post PDEzMzdAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 6 of 8)
extract_post PDEzMzhAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 7 of 8)
extract_post PDEzMzlAc2RjcmRjZi5VVUNQPg # rn version 4.1 distribution kit (part 8 of 8)

date="$(jq -r '.[0].header.date' "$TOPLEVEL/cache/usenetarchives/PDEzMzJAc2RjcmRjZi5VVUNQPg.json")"
rm kit{1,2,3,4,5,6,7,8}isdone
git add -A

commit "Larry Wall <lwall@sdcrdcf.UUCP> $date" 'rn version 4.1

Source: rn version 4.1 distribution kit
- part 1: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzJAc2RjcmRjZi5VVUNQPg
- part 2: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzNAc2RjcmRjZi5VVUNQPg
- part 3: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzRAc2RjcmRjZi5VVUNQPg
- part 4: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzVAc2RjcmRjZi5VVUNQPg
- part 5: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzZAc2RjcmRjZi5VVUNQPg
- part 6: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzdAc2RjcmRjZi5VVUNQPg
- part 7: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzhAc2RjcmRjZi5VVUNQPg
- part 8: https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzlAc2RjcmRjZi5VVUNQPg'
