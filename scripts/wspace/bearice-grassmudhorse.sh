#!/bin/bash -e

. base.sh

# TODO merge in the wiki from here:
# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=http://grass-mud-horse.googlecode.com/svn/

# TODO merge in this fork:
# https://github.com/charlestian/grass-mud-horse

# TODO potentially include these archives:
# https://web.archive.org/web/20160114185408/https://code.google.com/p/grass-mud-horse/downloads/list
# https://web.archive.org/web/20160114184908/https://grass-mud-horse.googlecode.com/files/gmh_hesui_1.1.7z
# https://web.archive.org/web/20160114184907/https://grass-mud-horse.googlecode.com/files/Grass-Mud-Horse-beta1-src-bin.zip
# https://web.archive.org/web/20160114184914/https://grass-mud-horse.googlecode.com/files/Grass-Mud-Horse-beta1-src-bin.rar

copy_submodule github.com/google-code-export/grass-mud-horse wspace/bearice-grassmudhorse
cd wspace/bearice-grassmudhorse

git filter-repo --quiet \
  --message-callback 'return message if message.endswith(b"\n") or message == b"" else message + b"\n"' \
  --mailmap <(echo '
Bearice Ren <bearice@icybear.net> bearice <bearice@2d120894-194e-11de-9433-ad2e3fad96c5>
jcj1988 <jcj1988@gmail.com> jcj1988 <jcj1988@2d120894-194e-11de-9433-ad2e3fad96c5>
')
git branch -m master main
git remote add origin https://github.com/wspace/bearice-grassmudhorse
