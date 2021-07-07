#!/bin/bash -e

# Clone both repos.
# whitespacers is the base and rebol-whitespacers is left unchanged.
git clone https://github.com/hostilefork/rebol-whitespacers
git clone https://github.com/hostilefork/whitespacers rebol-whitespacers-concat
cd rebol-whitespacers-concat

# Only include Rebol- and Ren-C-related files.
# If you want to verify that these paths are correct for all commits,
# including deletions and renames, you can run `git filter-repo --analyze`
# to generate a report at .git/filter-repo/analysis/path-all-sizes.txt.
git filter-repo --path rebol --path ren-c --path .github --path README

# Rename master to main to match rebol-whitespacers.
git branch -m master main

# Merge rebol-whitespacers into whitespacers. This adds all files from
# rebol-whitespacers at their new paths, so there are duplicates for
# now. The merge commit is later discarded by the rebase, so don't worry
# about the commit message.
git remote add rebol ../rebol-whitespacers
git fetch rebol
git merge --allow-unrelated-histories --no-edit rebol/main
git remote remove rebol

# Record committer information so that it can be recovered after rebase.
../record_committers.bash ../committers.py

# Rebase to make the following changes:
# - Remove the penultimate whitespacers commit because it deletes files
#   that are used in rebol-whitespacers.
# - Squash the first two commits of rebol-whitespacers to move files to
#   their new paths and get rid of the dummy README.md.
#
# Start the rebase at "fdd7acb GitHub Actions workflow to test Rebol Whitespacers".
# If the commit hash is different, you have rewritten history
# differently and need to replace the hash in the rebase invocation.
#
# When the interactive editor opens, change pick to drop/edit/squash as
# follows:
#
#   drop 233e029 Prepare for switching to archived repository
#   pick 9b3c3fb Fix typo in Rebol/Ren-C titles; update filenames to current
#   edit 02daa2c Initial commit
#   squash aff5261 Get R3-Alpha/Ren-C interpreters from collection
#   pick 0447490 Take filename on the command line
#   pick 102a453 Break Dialect and Runtime into Separate Files
#   pick c429a5d Pretend UPARSE is the official PARSE behavior
#   pick d18e0ee Disable Syntax Highlighting for Rebol Files
#   pick 234d2b3 Update README.md
#
git rebase -i --committer-date-is-author-date fdd7acb

# Edit the rebol-whitespacers initial commit to move files to their new
# paths and get rid of the dummy README.md.
mkdir historical
git rm README README.md
git mv rebol/whitespace.reb historical/whitespace-old.reb
git mv ren-c/{whitespace.reb,README.md} .
git mv .github/workflows/test-{rebol,whitespacers}.yml
rmdir rebol ren-c
git commit --amend --no-edit

# Resolve conflicts in "Get R3-Alpha/Ren-C interpreters from collection",
# automatically choosing the changes from rebol-whitespacers.
git rebase --continue || :
git diff --name-only --diff-filter=U | xargs git checkout --theirs
git add --all

# Squash these two commits. Reword the new commit message to make sense
# in this new context (at least remove the "Initial commit" line).
git rebase --continue

# Restore accurate committer information.
../restore_committers.bash ../committers.py
rm ../committers.py

# Delete excessive replacement objects.
git replace --delete $(git replace --list)
