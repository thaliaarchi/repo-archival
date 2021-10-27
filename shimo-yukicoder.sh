#!/bin/sh -e

git clone https://github.com/shi-mo/yukicoder shimo-yukicoder
cd shimo-yukicoder
git filter-repo --subdirectory-filter whitespace \
  --message-callback 'return re.sub(b"whitespace/", b"", message)'
git branch -m master main
git remote add origin https://github.com/wspace/shimo-yukicoder
