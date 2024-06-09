#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p regexp
cd regexp

# TODO:
# - Assemble history with earlier PCRE versions.
# - Check if any changes were cherry-picked from later PCRE releases.

clone_submodule https://github.com/adobe/avmplus avmplus-pcre
cd avmplus-pcre
git filter-repo --quiet \
  --path README.md --path-rename README.md:README.avmplus.md \
  --path LICENSE --path-rename LICENSE:LICENSE.avmplus \
  --path pcre --path-rename pcre/: \
  --mailmap <(echo 'Dave McAllister <dmcallis@adobe.com> dmcallis <dmcallis@adobe.com>') \
  --commit-callback '
    commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: https://github.com/adobe/avmplus/commit/" + commit.original_id + b"\n"
  '

# Last-Modified              URL
# 2007-08-28 19:36:27 +0000  https://sourceforge.net/projects/pcre/files/pcre/7.3/pcre-7.3.tar.bz2/download
# 2007-08-28 19:36:29 +0000  https://sourceforge.net/projects/pcre/files/pcre/7.3/pcre-7.3.tar.gz/download
# 2007-08-28 19:36:30 +0000  https://sourceforge.net/projects/pcre/files/pcre/7.3/pcre-7.3.zip/download

# The latest file in the archives was modified 2007-08-28 13:35:07 (local). This
# puts the author likely at -0600. Since Philip has only been observed in the
# PCRE2 Git repo at +0000 and +0100, I ignore the timezone offset.

git checkout -q --orphan pcre-7.3
git rm -qrf .
commit_archive 'Philip.Hazel <Philip.Hazel@gmail.com> 2007-08-28 19:36:27 +0000' 'Release PCRE 7.3' \
  https://sourceforge.net/projects/pcre/files/pcre/7.3/pcre-7.3.tar.bz2/download

git checkout -q master
# Replace the README- and LICENSE-only initial commit and keep the first commit
# with source, 65a0592 (Initial source code drop, 2013-12-02).
git replace "$(git rev-list --max-parents=0 HEAD)" pcre-7.3
git filter-repo --quiet --force
git branch -qd pcre-7.3
