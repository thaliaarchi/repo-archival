#!/bin/bash -e

. base.sh

mkdir -p regexp
cd regexp
mkdir re1

# https://code.google.com/archive/p/re1/
unzip -q "$(get_cached_path https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/re1/source-archive.zip)"

hg_to_git re1
cd re1

# Filename          Summary                       Upload date                Corresponding commit       URL
# re1-20121208.tgz  source tree as of 2012-12-08  2012-12-08 10:02:02 +0000  2012-12-08 02:23:54 +0000  https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/re1/re1-20121208.tgz
# re1-20121021.tgz  source tree as of 2012-10-21  2012-10-21 13:43:48 +0000  2011-02-16 20:39:25 +0000  https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/re1/re1-20121021.tgz
# https://storage.googleapis.com/google-code-archive/v2/code.google.com/re1/downloads-page-1.json

# Sequence of events:
# 2009-12-07 07:50:26 -0800  Project re1 created               http://web.archive.org/web/20100304012308/http://code.google.com/p/re1/updates/list
# 2009-12-07 07:53:31 -0800  "initial checkin" committed
# 2009-12-07 07:54:34 -0800  "initial checkin" pushed          http://web.archive.org/web/20100304012308/http://code.google.com/p/re1/updates/list
# 2009-12-10 09:00:00 -0800  Announcement blog post published  http://web.archive.org/web/20091215023721/http://research.swtch.com/2009/12/regular-expression-article-2.html  http://web.archive.org/web/20091224200903/http://research.swtch.com/feeds/posts/default?alt=rss
# 2009-12-11 09:55:22 -0800  Earliest post modification time   http://web.archive.org/web/20091215183916/http://swtch.com/~rsc/regexp/regexp2.html

# Amend the initial commit with the project Markdown summary
jq -r '"# \(.name)\n\n\(.description)"' "$(get_cached_path https://storage.googleapis.com/google-code-archive/v2/code.google.com/re1/project.json)" > README.md
git add README.md
git commit -q --fixup "$(git log --reverse --format=%H | head -n1)"

git remote add origin https://github.com/thaliaarchi/re1-archive
