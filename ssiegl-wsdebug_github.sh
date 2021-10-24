#!/bin/sh -e

git clone https://github.com/BackupTheBerlios/wsdebug
cd wsdebug

# Author/committer: stesie <stesie>
# Author and committer dates equal
git filter-repo \
  --message-callback '
    return b"" if message == b"*** empty log message ***\n" else message' \
  --commit-callback '
    commit.author_name = commit.committer_name = b"Stefan Siegl"
    commit.author_email = commit.committer_email = b"ssiegl@gmx.de"' \
  --path-rename wsdebug/.cvsignore:wsdebug/.gitignore

git remote add origin https://github.com/wspace/ssiegl-wsdebug
