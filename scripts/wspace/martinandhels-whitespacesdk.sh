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

# Snapshot 0.1 is identical to commit 2010-04-28 05:39:20 +0000 "Program exit
# and Exception handling.".
# https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/whitespacesdk/whitespace_snapshot_0.1.zip
