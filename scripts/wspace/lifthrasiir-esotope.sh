#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# A directory snapshot was saved on BitBucket:
# https://web.archive.org/web/20200622005938/https://bitbucket.org/lifthrasiir/esotope-esotope/get/2a3f6489a176.zip

# The repo was saved on the Software Heritage archive
# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/lifthrasiir/esotope-esotope
#
# To request a cooked git-bare archive for the latest revision on master:
# $ curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:89cd61de9d2dda065ed587bd38df31d3c09ca915/
# (API docs: https://archive.softwareheritage.org/api/1/vault/git-bare/doc/)
#
# All commits are in +0900:
# $ for commit in $(git log --reverse --format=%H); do
#     echo "$commit"
#     curl -s "https://archive.softwareheritage.org/api/1/revision/$commit/" |
#       jq -r '.extra_headers[] | select(.[0] == "time_offset_seconds") | .[1]'
#   done

tar xf ../../swh/bitbucket.org/lifthrasiir/esotope-esotope/swh_1_rev_89cd61de9d2dda065ed587bd38df31d3c09ca915.git.tar
git clone -q swh:1:rev:89cd61de9d2dda065ed587bd38df31d3c09ca915.git lifthrasiir-esotope
rm -rf swh:1:rev:89cd61de9d2dda065ed587bd38df31d3c09ca915.git

cd lifthrasiir-esotope

# Adjust UTC times to +0900
git filter-repo --quiet \
  --message-callback 'return re.sub(br"\n*$", b"\n", message)' \
  --commit-callback '
    commit.author_date = re.sub(br"\+0000", b"+0900", commit.author_date)
    commit.committer_date = re.sub(br"\+0000", b"+0900", commit.committer_date)' \
  --path-rename .hgignore:.gitignore \
  --replace-text <(echo 'regex:syntax: glob\n==>')

git branch -m master main

git remote add origin https://github.com/wspace/lifthrasiir-esotope
