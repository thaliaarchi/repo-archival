#!/bin/bash -e

. base.sh
copy_submodule github.com/shi-mo/yukicoder wspace/shimo-yukicoder
cd wspace/shimo-yukicoder
git filter-repo --quiet \
  --subdirectory-filter whitespace \
  --message-callback 'return re.sub(b"whitespace/", b"", message)'
git branch -m master main
git remote add origin https://github.com/wspace/shimo-yukicoder
