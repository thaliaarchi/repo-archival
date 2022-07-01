#!/bin/bash -e

. base.sh
copy_submodule omurakazuaki-rust
cd omurakazuaki-rust
git filter-repo --quiet --subdirectory-filter rust/whitespace
git remote add origin https://github.com/wspace/omurakazuaki-rust
