#!/bin/bash -e

. base.sh
copy_submodule shimo-yukicoder
cd shimo-yukicoder
git filter-repo --quiet \
  --subdirectory-filter whitespace \
  --message-callback 'return re.sub(b"whitespace/", b"", message)'
git branch -m master main
git remote add origin https://github.com/wspace/shimo-yukicoder
