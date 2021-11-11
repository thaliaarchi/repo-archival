#!/bin/sh -e

git clone https://github.com/omurakazuaki/WriteCodeEveryDay omurakazuaki-rust
cd omurakazuaki-rust
git filter-repo --subdirectory-filter rust/whitespace
git remote add origin https://github.com/wspace/omurakazuaki-rust
