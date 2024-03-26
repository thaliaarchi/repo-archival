#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

get_release() {
  local title="$1"
  local slug="$2"
  local version="$3"
  local path
  local url=https://softwarefoundations.cis.upenn.edu/$slug-$version/index.html
  path="$(get_cached_path "$url")"
  echo "Get info $slug-$version" >&2
  pup 'title, #button_block > .button > a, #index_content > p json{}' < "$path" |
  jq --arg url "$url" \
     --arg expected_title "$title" \
     --arg expected_slug "$slug" \
     --arg expected_version "$version" \
     -f "$TOPLEVEL/scripts/software-foundations/get_version.jq"
}

get_releases() {
  local volume="$1"
  local title="$2"
  local slug="$3"
  for version in "${@:4}"; do
    get_release "$title" "$slug" "$version"
  done |
  jq -s --arg volume "$volume" \
        --arg title "$title" \
        --arg slug "$slug" \
    '{$volume, $title, $slug, versions: .}'
}

(
  get_releases 1 'Logical Foundations' lf \
    5.0 5.1 5.3 5.4 5.5 5.6 5.8 \
    6.0 6.1 6.2 6.3 6.5 6.6
  # Gaps: 5.2 5.7 6.4

  get_releases 2 'Programming Language Foundations' plf \
    5.0 5.3 5.4 5.5 5.6 5.7 5.8 \
    6.0 6.1 6.2 6.3 6.4 6.5 6.6
  # Gaps: 5.1 5.2

  get_releases 3 'Verified Functional Algorithms' vfa \
    1.0 1.1 1.2 1.3 1.4 \
    1.5 1.5.1 1.5.2 1.5.3 1.5.4

  get_releases 4 'QuickCheck: Property-Based Testing in Coq' qc \
    1.0 \
    1.1 \
    1.2 1.2.1 \
    1.3.1 1.3.2 1.3.3
  # Gaps: 1.3

  get_releases 5 'Verifiable C' vc \
    1.1.0 1.1.1 \
    1.2.1 1.2.2
  # Gaps: 1.2

  get_releases 6 'Separation Logic Foundations' slf \
    1.0 1.2 1.3 1.4 1.5 1.6 \
    2.0 2.1
) |
jq -s .
