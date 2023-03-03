#!/bin/bash -e

. base.sh
git svn clone --stdlayout https://svn.code.sf.net/p/spacedide/code wspace/spacedide
git -C wspace/spacedide filter-repo -f \
  --message-callback '
    return b"Initial commit\n" if message.startswith(b"Initial commit") else re.sub(
      br"^\n+git-svn-id: https://svn.code.sf.net/p/spacedide/code@(\d+) 253eaa7e-a5eb-43a2-a586-e43a4db1c6d0\n$", br"r\1\n", message)' \
  --commit-callback '
    commit.author_email = commit.author_name + b"@users.sourceforge.net"
    commit.committer_email = commit.committer_name + b"@users.sourceforge.net"'
