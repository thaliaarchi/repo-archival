#!/bin/bash -e

. base.sh

mkdir 0qol-prime

copy_submodule 0qol-prime/check1
copy_submodule 0qol-prime/check2
copy_submodule 0qol-prime/factor

git -C check1 filter-repo --prune-empty=always --commit-callback 'commit.message = commit.author_date'
git -C check2 filter-repo --prune-empty=always --commit-callback 'commit.message = commit.author_date'
git -C factor filter-repo --prune-empty=always --commit-callback 'commit.message = commit.author_date'

git -C check1 branch -m master main
git -C check2 branch -m master main
git -C factor branch -m master main

cd 0qol-prime
git init
merge_repo check1
merge_repo check2
merge_repo factor
git rebase --committer-date-is-author-date --root

git filter-repo -f --commit-callback '
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
git filter-repo -f --commit-callback '
  commit.committer_name = commit.author_name
  commit.committer_email = commit.author_email
  commit.committer_date = commit.author_date'

git remote add origin https://github.com/wspace/0qol-prime
