#!/bin/bash -e

. base.sh

mkdir 0qol-prime
git init -q 0qol-prime

for repo in check1 check2 factor; do
  copy_submodule "0qol-prime/$repo"
  git -C "$repo" filter-repo --quiet \
    --prune-empty=always \
    --commit-callback 'commit.message = commit.author_date'
  git -C "$repo" branch -m master main
  cd 0qol-prime
  merge_repo "$repo"
  cd ..
done

cd 0qol-prime
git rebase -q --committer-date-is-author-date --root

git filter-repo -f --quiet \
  --commit-callback '
    commit.committer_name = commit.author_name
    commit.committer_email = commit.author_email

    modified = [c.filename for c in commit.file_changes if c.type == b"M"]
    deleted = [c.filename for c in commit.file_changes if c.type == b"D"]
    if len(modified) > 1: modified[-1] = b"and " + modified[-1]
    if len(deleted) > 1: deleted[-1] = b"and " + deleted[-1]
    if len(modified) > 0 and len(deleted) > 0:
      commit.message = b"Update " + b", ".join(modified) + b"; delete " + b", ".join(deleted)
    elif len(modified) > 0:
      commit.message = b"Update " + b", ".join(modified)
    elif len(deleted) > 0:
      commit.message = b"Delete " + b", ".join(deleted)
  '

# Reword to:
#   Add checkIfPrimeNumber.ws
#   Rename checkIfPrimeNumber.ws -> checkIfPrimeNumber1.ws
#   Add checkIfPrimeNumber2.ws
#   Update checkIfPrimeNumber2.ws
#   Add primeFactorization.ws
#   Add primeFactorization2.ws; update primeFactorization.ws
#   Update primeFactorization2.ws
git rebase -i --root
git filter-repo -f --quiet \
  --commit-callback '
    commit.committer_name = commit.author_name
    commit.committer_email = commit.author_email
    commit.committer_date = commit.author_date'

git remote add origin https://github.com/wspace/0qol-prime
