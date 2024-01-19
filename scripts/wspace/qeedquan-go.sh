#!/bin/bash -e

. base.sh
copy_submodule github.com/qeedquan/misc_utilities wspace/qeedquan-go
cd wspace/qeedquan-go
git filter-repo -f --quiet \
  --subdirectory-filter esolang/whitespace \
  --path AUTHORS \
  --path LICENSE
git branch -m master main

# Every change is made to this repo by force-pushing a single changed initial
# commit. For consistency, since the filtered subdirectory has never changed,
# the date is reset to the earliest-known date used. There were certainly
# earlier dates, but none are preserved locally or in the GitHub events API.
if [ $(git log --format=%h | wc -l) = 1 ]; then
  GIT_AUTHOR_NAME="$(git show -s --format=%an)" GIT_COMMITTER_NAME="$(git show -s --format=%cn)" \
  GIT_AUTHOR_EMAIL="$(git show -s --format=%ae)" GIT_COMMITTER_EMAIL="$(git show -s --format=%ce)" \
  GIT_AUTHOR_DATE='2021-11-10 21:20:39 -0600' GIT_COMMITTER_DATE='2021-11-10 21:20:39 -0600' \
  git commit -q --amend --no-edit --reset-author
fi

git remote add origin https://github.com/wspace/qeedquan-go
