#!/bin/sh -e

git clone https://github.com/Aniket965/Hello-world aniket-hacktoberfest-2018
cd aniket-hacktoberfest-2018
# Ignore dirty tree from conflicting case-sensitive files with --force
git filter-repo --force \
  --subdirectory-filter Whitespace --path LICENSE \
  --commit-callback 'commit.file_changes = [c for c in commit.file_changes if c.type != b"D"]' \
  --prune-degenerate=always
git rebase --root --committer-date-is-author-date
git filter-repo --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'
git branch -m master main
git remote add origin https://github.com/wspace/aniket-hacktoberfest-2018
