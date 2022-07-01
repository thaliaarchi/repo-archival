#!/bin/bash -e

. base.sh

mkdir ytaka-whitespace
git init -q ytaka-whitespace

# Repos have simple histories with only one file and one commit
for repo in pumpkin fizzbuzz sieve; do
  copy_submodule "ytaka-whitespace/$repo"
  # Don't bother with "and" because each repo has only one file
  git -C "$repo" filter-repo --quiet \
    --commit-callback 'commit.message = b"Add " + b", ".join([c.filename for c in commit.file_changes])'
  git -C "$repo" branch -m master main
  cd ytaka-whitespace
  merge_repo "$repo"
  cd ..
done

cd ytaka-whitespace
git rebase -q --committer-date-is-author-date --root
git filter-repo -f --quiet \
  --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'

git remote add origin https://github.com/wspace/ytaka-whitespace
