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
  pup 'title, #button_block > .button > a, #index_content > p json{}' < "$path" |
  jq --arg url "$url" \
     --arg expected_title "$title" \
     --arg expected_slug "$slug" \
     --arg expected_version "$version" \
  '
    if (
      length == 4 and
      map(.tag) == ["title", "a", "a", "p"] and
      .[1].text == "Read" and .[1].href == "toc.html" and
      .[2].text == "Download" |
      not
    ) then "unexpected HTML format: \(tojson)\n" | halt_error end |
    .[0].text as $title |
    .[2].href as $download |
    (
      .[3].text |
      capture(
        "^(?:Version|VERSION) (?<version>\\d+(?:\\.\\d+){0,2})" +
        " \\(" +
        "(?<date>\\d{4}-\\d\\d-\\d\\d \\d\\d:\\d\\d|\\d{1,2} (?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) \\d{4}|SUMMER \\d{4})" +
        "(?:, Coq (?<coq_version>\\d+(?:\\.\\d+){0,2})(?: or later){0,2})?" +
        "\\)" +
        "(?: Compatible with VST (?<vst_version>\\d+(?:\\.\\d+){0,2}(?: \\((?:January|February|March|April|May|June|July|August|September|October|November|December) \\d{4}\\))?))?" +
        "\\.?$"
      )
      // ("unrecognized version: \(.)\n" | halt_error)
    ) as {$version, $date, $coq_version, $vst_version} |
    if $title != $expected_title then
      "expected title \($expected_title | tojson), but got \($title | tojson)\n" | stderr end |
    if $download != "\($expected_slug).tgz" then
      "expected filename \($expected_slug).tgz, but got \($download)\n" | halt_error end |
    if $version != $expected_version then
      "expected version \($expected_version), but got \($version)\n" | halt_error end |
    {
      $version,
      $date,
      $coq_version,
      $vst_version,
      index: $url,
      download: ($url | sub("/[^/]*$"; "") + "/" + $download),
    }
  '
}

get_releases() {
  local title="$1"
  local slug="$2"
  for version in "${@:3}"; do
    get_release "$title" "$slug" "$version"
  done
}

get_releases 'Logical Foundations' lf \
  5.0 5.1 5.3 5.4 5.5 5.6 5.8 \
  6.0 6.1 6.2 6.3 6.5 6.6
# Gaps: 5.2 5.7 6.4

get_releases 'Programming Language Foundations' plf \
  5.0 5.3 5.4 5.5 5.6 5.7 5.8 \
  6.0 6.1 6.2 6.3 6.4 6.5 6.6
# Gaps: 5.1 5.2

get_releases 'Verified Functional Algorithms' vfa \
  1.0 1.1 1.2 1.3 1.4 \
  1.5 1.5.1 1.5.2 1.5.3 1.5.4

get_releases 'QuickCheck: Property-Based Testing in Coq' qc \
  1.0 \
  1.1 \
  1.2 1.2.1 \
  1.3.1 1.3.2 1.3.3
# Gaps: 1.3

get_releases 'Verifiable C' vc \
  1.1.0 1.1.1 \
  1.2.1 1.2.2
# Gaps: 1.2

get_releases 'Separation Logic Foundations' slf \
  1.0 1.2 1.3 1.4 1.5 1.6 \
  2.0 2.1
