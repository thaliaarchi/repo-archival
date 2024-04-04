#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p wspace
cd wspace

# Interleave the Git histories.

clone_submodule https://github.com/kspalaiologos/recreational kspalaiologos-recreational.interleaved
codegolf_submodule="$(submodule_path https://github.com/wspace/kspalaiologos-codegolf)"
cd kspalaiologos-recreational.interleaved

git remote add codegolf "$codegolf_submodule"
git fetch -q codegolf

# Interleave histories in date order, resolving merge conflicts (in README.md)
# in favor of recreational (“theirs”).
GIT_SEQUENCE_EDITOR='git log main codegolf/main --format="pick %h %ai %s" --reverse > ' \
git rebase -i --root -Xtheirs

# Remove now-duplicate files that started in codegolf-submissions and were added
# to recreational under different names or extracted in commit b0b31d9 (more
# stuff from cgse, 2023-11-12).
7z x 3815.7z
cmp 3815.mu 3815.mb
rm 3815.mu
7z x 196192.7z
mv stuff.hell 196192.hell
cmp stuff.mu 196192.mb
rm stuff.mu
cmp 138547.mu 138547.mb
cmp 190971.mu 190971.mb
cmp 191101.mu 191101.mb
cmp 201508.mu 201508.mb
git add 196192.hell
git rm 3815.7z 196192.7z 138547.mu 190971.mu 191101.mu 201508.mu

# Some files from codegolf-submissions were not manually added to recreational
# and are now reintroduced by the rebase. You should review them to see if you
# want them. Delete any you don't want here.

# Apply those deletions to the rebased version of b0b31d9 (more stuff from cgse,
# 2023-11-12).
cgse_commit="$(git log --grep='more stuff from cgse' --format=%H)"
git commit --fixup="$cgse_commit"
git rebase --autosquash "$cgse_commit^"

# TODO:
# - Committer ident is mangled.
# - Rebased commits are now unsigned.

git remote remove codegolf
