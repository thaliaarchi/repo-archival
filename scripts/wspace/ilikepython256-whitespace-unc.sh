#!/bin/bash -e

. base.sh

clone_submodule https://github.com/ILikePython256/Whitespace_UnC@master wspace/ilikepython256-whitespace-unc
cd wspace/ilikepython256-whitespace-unc

# Remove commit "Delete WhitespaceCompiler.py"
git filter-repo --quiet \
  --replace-text <(echo '
# Whitespace UnC (Web)==># Whitespace UnC
') \
  --commit-callback '
    commit.file_changes = [c for c in commit.file_changes if c.type != b"D"]
    commit.author_name = commit.author_name + b"|" + commit.committer_name + b"|" + commit.committer_email + b"|" + commit.committer_date
  '

# Drop commit "Update README.md"
git rebase -i HEAD~2
# drop 9ea9921 Update README.md
# pick 4b528ea Update WhitespaceCompiler.py

git merge -q --no-edit web
git rebase -q --root

git filter-repo --quiet \
  --commit-callback '
    [commit.author_name, commit.committer_name, commit.committer_email, commit.committer_date] = commit.author_name.split(b"|")'

git branch -m master main
git remote add origin https://github.com/wspace/ilikepython256-whitespace-unc
