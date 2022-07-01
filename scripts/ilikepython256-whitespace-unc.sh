#!/bin/bash -e

. base.sh

copy_submodule ilikepython256-whitespace-unc/master ilikepython256-whitespace-unc
cd ilikepython256-whitespace-unc

echo '# Whitespace UnC (Web)==># Whitespace UnC' > ../replacements.txt

# Remove commit "Delete WhitespaceCompiler.py"
git filter-repo \
  --replace-text ../replacements.txt \
  --commit-callback '
    commit.file_changes = [c for c in commit.file_changes if c.type != b"D"]
    commit.author_name = commit.author_name + b"|" + commit.committer_name + b"|" + commit.committer_email + b"|" + commit.committer_date
  '
rm ../replacements.txt

# Drop commit "Update README.md"
git rebase -i HEAD~2
# drop 9ea9921 Update README.md
# pick 4b528ea Update WhitespaceCompiler.py

git merge --no-edit web
git rebase --root

git filter-repo \
  --commit-callback '
    [commit.author_name, commit.committer_name, commit.committer_email, commit.committer_date] = commit.author_name.split(b"|")
  '

git branch -m master main
git remote add origin https://github.com/wspace/ilikepython256-whitespace-unc
