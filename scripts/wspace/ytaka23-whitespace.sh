#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

mkdir ytaka23-whitespace
git init -q ytaka23-whitespace

# Repos have simple histories with only one file and one commit
for gist in 7353571 7353594 7353612; do
  clone_submodule "https://gist.github.com/y-taka-23/$gist"
  # Don't bother with "and" because each repo has only one file
  git -C "$gist" filter-repo --quiet \
    --commit-callback 'commit.message = b"Add " + b", ".join([c.filename for c in commit.file_changes])'
  git -C "$gist" branch -m master main
  cd ytaka23-whitespace
  merge_repo "$gist"
  cd ..
done

cd ytaka23-whitespace
git rebase -q --committer-date-is-author-date --root
git filter-repo -f --quiet \
  --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'

git remote add origin https://github.com/wspace/ytaka23-whitespace
