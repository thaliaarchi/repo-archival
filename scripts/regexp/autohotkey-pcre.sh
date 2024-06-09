#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - Are releases available before the initial commit, 082a91fe (v1.0.47.06 -
#   Base AutoHotkey source, 2008-03-09)? Versions back to v1.0.44.04 are
#   available at http://www.autohotkey.org/, but the ones labeled as sources are
#   EXEs or strange ZIPs.
# - source/lib/regex.cpp wraps PCRE. Extracting it as a library may be useful.

mkdir -p regexp
cd regexp

clone_submodule https://github.com/AutoHotkey/AutoHotkey autohotkey-pcre
cd autohotkey-pcre
# filter-repo cannot handle nested tags, so delete v2.0-a078, which points to a
# tag.
git tag -qd v2.0-a078
git filter-repo --quiet \
  --path source/lib_pcre/pcre --path-rename source/lib_pcre/pcre/: \
  --path license.txt \
  --commit-callback '
    commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: https://github.com/AutoHotkey/AutoHotkey/commit/" + commit.original_id + b"\n"
  '
