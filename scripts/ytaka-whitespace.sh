#!/bin/bash -e

. base.sh

mkdir ytaka-whitespace

# Repos have simple histories with only one file and one commit
copy_submodule ytaka-whitespace/pumpkin
copy_submodule ytaka-whitespace/fizzbuzz
copy_submodule ytaka-whitespace/sieve

# Don't bother with "and" because each repo has only one file
git -C pumpkin filter-repo --commit-callback 'commit.message = b"Add " + b", ".join([c.filename for c in commit.file_changes])'
git -C fizzbuzz filter-repo --commit-callback 'commit.message = b"Add " + b", ".join([c.filename for c in commit.file_changes])'
git -C sieve filter-repo --commit-callback 'commit.message = b"Add " + b", ".join([c.filename for c in commit.file_changes])'
git -C pumpkin branch -m master main
git -C fizzbuzz branch -m master main
git -C sieve branch -m master main

cd ytaka-whitespace
git init
merge_repo pumpkin
merge_repo fizzbuzz
merge_repo sieve
git rebase --committer-date-is-author-date --root

git filter-repo -f --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'

git remote add origin https://github.com/wspace/ytaka-whitespace
