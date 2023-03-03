#!/bin/bash -e

. base.sh
copy_submodule github.com/omurakazuaki/WriteCodeEveryDay wspace/omurakazuaki-rust
cd wspace/omurakazuaki-rust
git filter-repo --quiet --subdirectory-filter rust/whitespace
git remote add origin https://github.com/wspace/omurakazuaki-rust
