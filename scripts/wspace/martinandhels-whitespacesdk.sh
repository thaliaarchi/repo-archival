#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# https://code.google.com/archive/p/whitespacesdk/
svnadmin create martinandhels-whitespacesdk-svn
gunzip -c "$(get_cached_path https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/whitespacesdk/repo.svndump.gz)" |
  svnadmin load martinandhels-whitespacesdk-svn

git svn clone "file://$(pwd)/martinandhels-whitespacesdk-svn" martinandhels-whitespacesdk \
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
cd martinandhels-whitespacesdk
git filter-repo -f \
  --commit-callback '
    if commit.author_name == b"MArtin SHerratt":
      commit.author_date = commit.author_date.replace(b"+0000", b"+0100")
      commit.committer_date = commit.committer_date.replace(b"+0000", b"+0100")'

# Snapshot 0.1 is identical to commit 2010-04-28 06:39:20 +0100 "Program exit
# and Exception handling.".
# https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/whitespacesdk/whitespace_snapshot_0.1.zip
