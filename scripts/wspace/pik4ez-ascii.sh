#!/bin/bash -e

. base.sh

# https://gist.github.com/pik4ez/ff8419892f0a71383aee01588e06e104 jonas.bf
# https://gist.github.com/pik4ez/a2b0ece78c999e3b9ca54369ffd484f3 brooks.ws
# https://gist.github.com/pik4ez/61c0678799dbd4a7fc5a6ca08959b7b4 hopper.ws
# https://gist.github.com/pik4ez/8274216220511d0e42de7881eca782da rameev.ws
# https://gist.github.com/pik4ez/fb76073886531d9b888a5c86e870bccd shura-bura.ws
# https://gist.github.com/pik4ez/e3d776091bae3a41e18ae1404bdccac1 lamarr.ws

# brooks contains the entirety of the other .ws repos at earlier dates, however
# the history is messy. jonas is separate.

# jonas:
# 1. 2017-11-11 14:52:47 +0300: add jonas.bf

# brooks:
# 1. 2018-08-15 18:42:37 +0300
#    add gistfile1.txt
# 2. 2018-08-15 20:40:29 +0300
#    edit gistfile1.txt (remove placeholder header)
# 3. 2018-08-15 20:41:06 +0300
#    rename gistfile1.txt -> hedi_ascii.ws
# 4. 2018-08-16 20:02:46 +0300
#    add brooks.ws
#    add hopper.ws
#    rename hedi_ascii.ws -> lamarr.ws
#    add rameev.ws
#    add shura-bura.ws
# 5. 2018-08-16 20:05:05 +0300
#    edit brooks.ws (replace placeholder)
#    edit hopper.ws (replace placeholder)
#    edit rameev.ws (replace placeholder)
#    edit shura-bura.ws (replace placeholder)
# 6. 2018-08-16 20:10:46 +0300
#    delete hopper.ws
#    delete lamarr.ws
#    delete rameev.ws
#    delete shura-bura.ws

# hopper:
# 1. 2018-08-16 20:06:38 +0300: add hopper.ws
# 2. 2018-08-16 20:06:53 +0300: edit hopper.ws (replace placeholder)

# rameev:
# 1. 2018-08-16 20:07:43 +0300: add rameev.ws
# 2. 2018-08-16 20:08:04 +0300: edit rameev.ws (replace placeholder)

# shura-bura:
# 1. 2018-08-16 20:08:53 +0300: add shura-bura.ws
# 2. 2018-08-16 20:09:08 +0300: edit shura-bura.ws (replace placeholder)

# lamarr:
# 1. 2018-08-16 20:09:57 +0300: add lamarr.ws
# 2. 2018-08-16 20:10:19 +0300: edit lamarr.ws (replace placeholder)

clone_submodule https://gist.github.com/pik4ez/a2b0ece78c999e3b9ca54369ffd484f3 wspace/pik4ez-ascii
cd wspace/pik4ez-ascii

git remote add jonas "$(submodule_path https://gist.github.com/pik4ez/ff8419892f0a71383aee01588e06e104)"
git fetch -q jonas
git rebase -q jonas/master --committer-date-is-author-date
git remote remove jonas

# Fix the gistfile1.txt filename and drop file deletions.
# Set the commit message to list the files added or modified (both are listed as
# type M) and on successive occurrences of the same files changed, mark it with
# "amend!".
# Since filter-repo does not report renames, crudely check for the hedi_ascii.ws
# -> lamarr.ws rename.
git filter-repo --quiet --force \
  --path-rename gistfile1.txt:hedi_ascii.ws \
  --commit-callback '
    filenames = set(c.filename for c in commit.file_changes)

    modified = [c.filename for c in commit.file_changes if c.type != b"D"
      and not (c.filename == b"lamarr.ws" and b"hedi_ascii.ws" in filenames)];
    if len(modified) > 1:
      modified[-1] = b"and " + modified[-1]
    commit.message = b"Add " + b", ".join(modified) + b"\n"

    global commits
    if not "commits" in globals(): commits = set()
    if commit.message in commits:
      commit.message = b"squash! " + commit.message
    else:
      commits.add(commit.message)

    commit.file_changes = [c for c in commit.file_changes if c.type != b"D"
      or c.filename == b"hedi_ascii.ws" and b"lamarr.ws" in filenames]
  '

# Squash placeholder text fixup commits, making their author dates become the
# committer dates of the base commits.
GIT_EDITOR=: git rebase -q --root --autosquash --committer-date-is-author-date

# Fix committer.
git filter-repo --quiet \
  --commit-callback '
    commit.committer_name = commit.author_name
    commit.committer_email = commit.author_email
  '

git branch -m master main
git remote add origin https://github.com/wspace/pik4ez-ascii
