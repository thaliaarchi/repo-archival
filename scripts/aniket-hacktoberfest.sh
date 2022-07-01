#!/bin/bash -e

. base.sh
copy_submodule aniket-hacktoberfest
cd aniket-hacktoberfest
# Ignore dirty tree from conflicting case-sensitive files with --force
git filter-repo -f --quiet \
  --subdirectory-filter Whitespace --path LICENSE \
  --commit-callback '
    commit.file_changes = [c for c in commit.file_changes if c.type != b"D"]
    commit.author_name = commit.author_name + b"|" + commit.committer_name
    commit.author_email = commit.author_email + b"|" + commit.committer_email'
git rebase -q --committer-date-is-author-date --root
git filter-repo --quiet \
  --prune-empty=always \
  --commit-callback '
    commit.author_name, _, commit.committer_name = commit.author_name.partition(b"|")
    commit.author_email, _, commit.committer_email = commit.author_email.partition(b"|")'
git branch -m master main
git remote add origin https://github.com/wspace/aniket-hacktoberfest
