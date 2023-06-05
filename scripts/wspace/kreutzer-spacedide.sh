#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

git svn clone https://svn.code.sf.net/p/spacedide/code kreutzer-spacedide \
  --stdlayout \
  --authors-file <(echo '
spacedide = Sebastian Kreutzer <spacedide@users.sourceforge.net>
allura = Apache Allura <allura>
')
cd kreutzer-spacedide

git filter-repo -f --quiet \
  --message-callback '
    message = re.sub(br"^([\s\S]*?)\n*git-svn-id: .*@(\d+) 253eaa7e-a5eb-43a2-a586-e43a4db1c6d0\n$", br"[r\2] \1\n", message)
    message = re.sub(br"^(\[r\d+\])\s+$", br"\1\n", message)
    return message'

git remote add origin https://github.com/wspace/kreutzer-spacedide
