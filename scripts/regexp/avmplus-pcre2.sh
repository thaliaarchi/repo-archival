#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p regexp
cd regexp

clone_submodule https://github.com/PCRE2Project/pcre2 avmplus-pcre2
cd avmplus-pcre2
git remote remove origin
git reset -q --hard pcre2-10.20~
git rm -q '*'

# Last-Modified              URL
# 2015-07-02 12:17:00 +0000  https://web.archive.org/web/20170826025657/https://ftp.pcre.org/pub/pcre/pcre2-10.20.tar.bz2
# 2015-07-02 12:16:00 +0000  https://web.archive.org/web/20170826024411/https://ftp.pcre.org/pub/pcre/pcre2-10.20.tar.gz
# 2015-07-02 12:17:00 +0000  https://web.archive.org/web/20170826025025/https://ftp.pcre.org/pub/pcre/pcre2-10.20.zip
# 2022-01-25 16:34:29 +0000  https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.20/pcre2-10.20.tar.bz2
# 2022-01-25 16:40:11 +0000  https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.20/pcre2-10.20.tar.gz
# 2022-01-25 16:41:47 +0000  https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.20/pcre2-10.20.zip

# The latest file in the archives was modified 2015-07-02 13:14:23 (local) and
# the archives were uploaded 2015-07-02 12:17:00 +0000. Release 10.20 was tagged
# as pcre2-10.20 (Tag release 10.20, 2015-07-02 13:18:57 +0000) and its final
# commit was 865b2d5 (Final file tidies for 10.20, 2015-07-02 13:18:14 +0000).
# The archives and commits are offset an hour after the upload. Since PCRE2 used
# SVN at this point (see maint/README, section “Preparing for a PCRE2 release”),
# the commits use the timezone of the server, which seems to have been +0100.
# This matches later commits by Philip in +0100.

tar xf "$(get_cached_path https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.20/pcre2-10.20.tar.bz2)" --strip-components=1
git add -Af
# Since the archives were created before the final commit and tag, match the tag
# time. Match the two final LFs (which I presume come from git-svn with the
# git-svm-id lines stripped).
GIT_AUTHOR_NAME='Philip.Hazel' GIT_AUTHOR_EMAIL='Philip.Hazel@gmail.com' GIT_AUTHOR_DATE='2015-07-02 13:18:57 +0000' \
GIT_COMMITTER_NAME='Philip.Hazel' GIT_COMMITTER_EMAIL='Philip.Hazel@gmail.com' GIT_COMMITTER_DATE='2015-07-02 13:18:57 +0000' \
git commit -q -m 'Distribute release 10.20

Source: https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.20/pcre2-10.20.tar.bz2'
cd ..

clone_submodule https://github.com/adobe/avmplus
cd avmplus
if (( $(git log --format=%h -- pcre2 | wc -l) != 1 )); then
  echo 'More than one commit modifies pcre2/' >&2
  exit 1
fi
git filter-repo --quiet \
  --path README.md --path-rename README.md:README.avmplus.md \
  --path LICENSE --path-rename LICENSE:LICENSE.avmplus \
  --path pcre2 --path-rename pcre2/: \
  --commit-callback '
    commit.message = re.sub(br"\n+$", b"", commit.message)
    commit.message += b"\n\nSource: https://github.com/adobe/avmplus/commit/" + commit.original_id + b"\n"
  '

git remote add pcre2 ../avmplus-pcre2
git fetch -q pcre2 master
git replace master~ pcre2/master
git filter-repo --quiet --force
cd ..

cd avmplus-pcre2
git remote add avmplus ../avmplus
git fetch -q avmplus master
git reset -q avmplus/master
git remote remove avmplus

rm -rf ../avmplus
