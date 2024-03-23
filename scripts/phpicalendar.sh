#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir phpicalendar
cd phpicalendar

# Convert PHP iCalendar from CVS at https://sourceforge.net/projects/phpicalendar/.
rsync -ai a.cvs.sourceforge.net::cvsroot/phpicalendar/ phpicalendar.cvs
cd phpicalendar.cvs
find . -name '*,v' | cvs-fast-export > ../phpicalendar.fe
cd ..
# The cvs-fast-export stream contains paths starting with `/`, which are
# rejected by git fast-import with `fatal: Empty path component found in input`.
# Get around that by removing the leading `/`. (I should upstream a proper fix.)
LC_ALL=C sed -E 's,(^M [0-9]{6} (:[0-9]+|inline) )/,\1,' phpicalendar.fe > phpicalendar.fe.patched

git init -q phpicalendar.git
cd phpicalendar.git
git fast-import < ../phpicalendar.fe.patched
# Normalize line endings to improve diffs for files with CR-only line endings.
git filter-repo --force --blob-callback 'blob.data = blob.data.replace(b"\r\n", b"\n").replace(b"\r", b"\n")'
git checkout -q master
git branch -m master main
