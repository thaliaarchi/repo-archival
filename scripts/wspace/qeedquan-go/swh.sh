#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p wspace
cd wspace
mkdir qeedquan-go-swh
cd qeedquan-go-swh

origin_url=https://github.com/qeedquan/misc_utilities

master_revisions="$(
  set -eEuo pipefail &&
  curl -s "https://archive.softwareheritage.org/api/1/origin/$origin_url/visits/?per_page=1000" |
  jq --raw-output0 '
    if type != "array" then "expected array: \(.)\n" | halt_error(1) end |
    sort_by(.date)[] |
    if .snapshot_url == null and .status != "partial" then
      "non-partial snapshot is missing URL: \(.)\n" | halt_error(1)
    end |
    .snapshot_url | select(. != null)
  ' |
  while read -r -d $'\0' snapshot_url; do
    jq -r '
      . as $snapshot |
      .branches |
      # Exclude HEAD, when it references another branch. In earlier snapshots,
      # HEAD was a regular branch. Now, it is an alias.
      if (.HEAD.target_type == "alias" and has(.HEAD.target)) or
          ([del(.HEAD)[].target] | contains([$snapshot.branches.HEAD.target])) then
        del(.HEAD)
      end |
      to_entries |
      if length != 1 or .[0].key != "refs/heads/master" then
        "branches changed from just master: \($snapshot)\n" | halt_error(1)
      end |
      .[0].value.target
    ' "$(get_cached_path "$snapshot_url" || echo "fail! $snapshot_url")"
  done |
  uniq
)"

all_revisions_cooked=true
while read -r revision; do
  if ! request_swh "$revision"; then
    all_revisions_cooked=false
  fi
done <<< "$master_revisions"

if [[ $all_revisions_cooked != true ]]; then
  echo "Not all revisions have been cooked yet. Try running this again later." >&2
  exit 1
fi

i=1
git init -q qeedquan-go
while read -r revision; do
  echo "Importing revision $revision as snapshot-$i"
  clone_swh_bare "$origin_url" "$revision" "snapshot-$i.git"
  git -C qeedquan-go remote add "snapshot-$i" "../snapshot-$i.git"
  git -C qeedquan-go fetch -q "snapshot-$i"
  i=$((i+1))
done <<< "$master_revisions"
