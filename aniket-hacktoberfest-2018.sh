#!/bin/sh -e

git clone https://github.com/Aniket965/Hello-world aniket-hacktoberfest-2018
cd aniket-hacktoberfest-2018
# Ignore dirty tree from conflicting case-sensitive files with --force
git filter-repo --force --subdirectory-filter Whitespace --path LICENSE
git branch -m master main
git remote add origin https://github.com/wspace/aniket-hacktoberfest-2018
