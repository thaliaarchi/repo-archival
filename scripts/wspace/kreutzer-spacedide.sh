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

# TODO: SourceForge README and licenses.txt
cp -p ../../../files/wspace/kreutzer-spacedide/README.md .
get_cached https://master.dl.sourceforge.net/project/spacedide/license.txt?viasf=1 license.txt

# Files
# README.txt            2013-02-26 16:11:00 +0000  https://sourceforge.net/projects/spacedide/files/README.txt/download
# spaced_ide_1.1.jar    2013-02-26 16:05:35 +0000  https://sourceforge.net/projects/spacedide/files/spaced_ide_1.1.jar/download
# spaced_ide_1.0.1.jar  2013-02-21 08:02:06 +0000  https://sourceforge.net/projects/spacedide/files/spaced_ide_1.0.1.jar/download
# license.txt           2013-02-20 02:45:19 +0000  https://sourceforge.net/projects/spacedide/files/license.txt/download
#
# README.txt is identical to src/README.txt, committed 2013-03-02 13:35:17 +0000

# v1.1 screenshots
mkdir screenshots
get_cached https://a.fsdn.com/con/app/proj/spacedide/screenshots/spaced_ide_2.png/max/max/1 screenshots/spaced_ide_2.png
get_cached https://a.fsdn.com/con/app/proj/spacedide/screenshots/spaced_ide_3.png/max/max/1 screenshots/spaced_ide_3.png

git remote add origin https://github.com/wspace/kreutzer-spacedide
