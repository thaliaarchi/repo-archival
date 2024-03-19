#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir phpicalendar
cd phpicalendar

# PHP iCalendar (https://sourceforge.net/projects/phpicalendar/)
rsync -ai a.cvs.sourceforge.net::cvsroot/phpicalendar/ phpicalendar.cvs
cd phpicalendar.cvs
find . -name '*,v' | cvs-fast-export > ../phpicalendar.fe
cd ../fe-fix-paths
# The cvs-fast-export stream contains paths starting with `/`, which are
# rejected by git fast-import with `fatal: Empty path component found in input`.
# Since sed cannot work with binary files, fix them in Rust:
cargo run ../phpicalendar.fe > ../phpicalendar.fe.patched
cd ..
git init phpicalendar.git
cd phpicalendar.git
git fast-import < ../phpicalendar.fe.patched
git filter-repo --force --blob-callback 'blob.data = blob.data.replace(b"\r\n", b"\n").replace(b"\r", b"\n")'
git checkout master
