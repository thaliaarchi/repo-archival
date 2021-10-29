#!/bin/sh -e

# Repos have simple histories with only one file and one commit
git clone https://gist.github.com/y-taka-23/7353571 pumpkin
git clone https://gist.github.com/y-taka-23/7353594 fizzbuzz
git clone https://gist.github.com/y-taka-23/7353612 sieve

# Don't bother with "and" because each repo has only one file
git -C pumpkin filter-repo --commit-callback 'commit.message = b"Add " + b", ".join([c.filename for c in commit.file_changes])'
git -C fizzbuzz filter-repo --commit-callback 'commit.message = b"Add " + b", ".join([c.filename for c in commit.file_changes])'
git -C sieve filter-repo --commit-callback 'commit.message = b"Add " + b", ".join([c.filename for c in commit.file_changes])'
git -C pumpkin branch -m master main
git -C fizzbuzz branch -m master main
git -C sieve branch -m master main

mkdir ytaka-whitespace
cd ytaka-whitespace
git init
git remote add pumpkin ../pumpkin
git remote add fizzbuzz ../fizzbuzz
git remote add sieve ../sieve
git fetch pumpkin
git fetch fizzbuzz
git fetch sieve
git merge --allow-unrelated-histories --no-edit pumpkin/main
git merge --allow-unrelated-histories --no-edit fizzbuzz/main
git merge --allow-unrelated-histories --no-edit sieve/main
git remote remove pumpkin
git remote remove fizzbuzz
git remote remove sieve

# Automatically sorts by author date and drops merge commits.
# Accept change list as-is.
git rebase -i --root --committer-date-is-author-date
git filter-repo -f --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'

git remote add origin https://github.com/wspace/ytaka-whitespace
