#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

mkdir 0qol-prime
git init -q 0qol-prime

for gist in a57b28d3353cdef08aac34cce8b1d9dc \
            55ab44a35c0faba659448f340af8db70 \
            a317e241860518a79a36c879e710de38; do
  clone_submodule "https://gist.github.com/0qol/$gist"
  git -C "$gist" filter-repo --quiet \
    --prune-empty=always \
    --commit-callback 'commit.message = commit.author_date'
  git -C "$gist" branch -m master main
  cd 0qol-prime
  merge_repo "$gist"
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
