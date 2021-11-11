#!/bin/sh -e

git clone https://github.com/Aniket965/Hello-world aniket-hacktoberfest-2018
cd aniket-hacktoberfest-2018
# Ignore dirty tree from conflicting case-sensitive files with --force
git filter-repo --force \
  --subdirectory-filter Whitespace --path LICENSE \
  --commit-callback '
    commit.file_changes = [c for c in commit.file_changes if c.type != b"D"]
    commit.author_name = commit.author_name + b"|" + commit.committer_name
    commit.author_email = commit.author_email + b"|" + commit.committer_email
  '
git rebase --committer-date-is-author-date --root
git filter-repo \
  --prune-empty=always \
  --commit-callback '
    commit.author_name, _, commit.committer_name = commit.author_name.partition(b"|")
    commit.author_email, _, commit.committer_email = commit.author_email.partition(b"|")
  '
git branch -m master main
git remote add origin https://github.com/wspace/aniket-hacktoberfest-2018
