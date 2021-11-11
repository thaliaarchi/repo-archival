#!/bin/sh -e

. base.sh

git clone https://gist.github.com/0qol/a57b28d3353cdef08aac34cce8b1d9dc check1
git clone https://gist.github.com/0qol/55ab44a35c0faba659448f340af8db70 check2
git clone https://gist.github.com/0qol/a317e241860518a79a36c879e710de38 factor

git -C check1 filter-repo --prune-empty=always --commit-callback 'commit.message = commit.author_date'
git -C check2 filter-repo --prune-empty=always --commit-callback 'commit.message = commit.author_date'
git -C factor filter-repo --prune-empty=always --commit-callback 'commit.message = commit.author_date'

git -C check1 branch -m master main
git -C check2 branch -m master main
git -C factor branch -m master main

mkdir 0qol-prime
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