#!/bin/bash -e

. base.sh

as_martin() {
  GIT_AUTHOR_NAME='MArtin SHerratt' GIT_AUTHOR_EMAIL='martinandhels@yahoo.co.uk' GIT_AUTHOR_DATE="$1" \
  GIT_COMMITTER_NAME='MArtin SHerratt' GIT_COMMITTER_EMAIL='martinandhels@yahoo.co.uk' GIT_COMMITTER_DATE="$1" \
  "${@:2}"
}

mkdir -p wspace
cd wspace

# https://code.google.com/archive/p/whitespacesdk/
svnadmin create mash-whitespacesdk-svn
gunzip -c "$(get_cached_path https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/whitespacesdk/repo.svndump.gz)" |
  svnadmin load mash-whitespacesdk-svn

git svn clone "file://$(pwd)/mash-whitespacesdk-svn" mash-whitespacesdk \
  --stdlayout \
  --no-metadata \
  --authors-file=<(echo '
martinandhels@yahoo.co.uk = MArtin SHerratt <martinandhels@yahoo.co.uk>
(no author) = MArtin SHerratt <martinandhels@yahoo.co.uk>
spike.chris = spike.chris <spike.chris>
')

# MArtin is in the UK in UTC+1, as evidenced by the UTC commits being an hour
# ahead of corresponding local modification times in whitespace_snapshot_0.1.zip
# and the .co.uk TLDs. It is unclear for spike.chris.
cd mash-whitespacesdk
git filter-repo -f \
  --commit-callback '
    if commit.author_name == b"MArtin SHerratt":
      commit.author_date = commit.author_date.replace(b"+0000", b"+0100")
      commit.committer_date = commit.committer_date.replace(b"+0000", b"+0100")'

# Snapshot 0.1 is identical to commit 2010-04-28 06:39:20 +0100 "Program exit
# and Exception handling.".
# Summary:     snapshot source v0.1
# Upload date: 1272434147 (2010-04-28 06:55:47 +0100)
# https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/whitespacesdk/whitespace_snapshot_0.1.zip
# https://storage.googleapis.com/google-code-archive/v2/code.google.com/whitespacesdk/downloads-page-1.json
rebase_break_before_date '2010-04-28 06:55:47 +0100'
as_martin '2010-04-28 06:55:47 +0100' git tag -a v0.1 -m 'Snapshot v0.1'

# Commit the repository Markdown summary. Google Code no longer exposes the list
# of updates and it was not archived, so I have no dates for changes to the
# repository and use the upload date of snapshot v0.1 as a proxy for that.
jq -r '"# \(.name)\n\n\(.summary)\n\n\(.description)"' "$(get_cached_path https://storage.googleapis.com/google-code-archive/v2/code.google.com/whitespacesdk/project.json)" > README.md
git add README.md
as_martin '2010-04-28 06:55:47 +0100' git commit -q -m 'Uploaded snapshot v0.1'
git rebase --continue

git remote add origin https://github.com/wspace/mash-whitespacesdk
