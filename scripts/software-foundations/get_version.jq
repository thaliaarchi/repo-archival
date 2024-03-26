def fmt_err(msg): "Error in \($expected_slug)-\($expected_version): \(msg)\n";
def err(msg): fmt_err(msg) | halt_error(1);
def warn(msg): fmt_err(msg) | stderr;

if (
  length == 4 and
  map(.tag) == ["title", "a", "a", "p"] and
  .[1].text == "Read" and .[1].href == "toc.html" and
  .[2].text == "Download" |
  not
) then err("unexpected HTML format: \(tojson)") end |

.[0].text as $title |
.[2].href as $download |

(
  .[3].text |
  capture(
    "^(?:Version|VERSION) (?<version>\\d+(?:\\.\\d+){0,2})" +
    " \\(" +
      "(?:" +
        "(?<date1>\\d{4}-\\d\\d-\\d\\d \\d\\d:\\d\\d)|" +
        "(?<date2_d>\\d{1,2}) (?<date2_m>Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (?<date2_y>\\d{4})|" +
        "(?<date3_season>SUMMER) (?<date3_y>\\d{4})" +
      ")" +
      "(?:, Coq (?<coq_version>\\d+(?:\\.\\d+){0,2})(?: or later){0,2})?" +
    "\\)" +
    "(?: Compatible with VST (?<vst_version>\\d+(?:\\.\\d+){0,2}(?: \\((?:January|February|March|April|May|June|July|August|September|October|November|December) \\d{4}\\))?))?" +
    "\\.?$"
  )
  // err("cannot parse version: \(.)")
) as $match |

$match as {$version, $coq_version, $vst_version} |
if $title != $expected_title then
  warn("expected title \($expected_title | tojson), but got \($title | tojson)") end |
if $download != "\($expected_slug).tgz" then
  err("expected filename \($expected_slug).tgz, but got \($download)") end |
if $version != $expected_version then
  err("expected version \($expected_version), but got \($version)\n") end |

(
  $match |
  if .date1 != null then .date1
  elif .date2_d != null then
    { "Jan": 1, "Feb": 2, "Mar": 3, "Apr": 4, "May": 5, "Jun": 6,
      "Jul": 7, "Aug": 8, "Sep": 9, "Oct": 10, "Nov": 11, "Dec": 12}[.date2_m] as $m |
    "\(.date2_y)-\("0\($m)"[-2:])-\("0\(.date2_d)"[-2:])"
  elif .date3_season != null then
    "\(.date3_y) \(.date3_season | ascii_downcase)"
  else err("unreachable date match")
  end
) as $date |

{
  $version,
  $date,
  $coq_version,
} +
if $vst_version != null then { $vst_version } else {} end +
{
  index: $url,
  download: ($url | sub("/[^/]*$"; "") + "/" + $download),
}
