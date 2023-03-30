#!/bin/bash -e

. base.sh

cd ..

while read -r line; do
  if [[ -n $line ]]; then
    sum="${line%%  *}"
    url="${line#*  }"
    sha1sum -c --quiet 2>/dev/null <<< "$sum  $(get_cached_path $url)" || :
  fi
done < scripts/wspace/stribb-debian/sha1sums
