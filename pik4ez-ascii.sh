#!/bin/sh -e

# https://gist.github.com/pik4ez/a2b0ece78c999e3b9ca54369ffd484f3 brooks
# https://gist.github.com/pik4ez/61c0678799dbd4a7fc5a6ca08959b7b4 hopper
# https://gist.github.com/pik4ez/8274216220511d0e42de7881eca782da rameev
# https://gist.github.com/pik4ez/fb76073886531d9b888a5c86e870bccd shura-bura
# https://gist.github.com/pik4ez/e3d776091bae3a41e18ae1404bdccac1 lamarr

# brooks contains the entirety of the other repos at earlier dates,
# however the history is messy:

# 1. add gistfile1.txt
# 2. edit gistfile1.txt (remove placeholder header)
# 3. rename gistfile1.txt -> hedi_ascii.ws
# 4. add brooks.ws
#    add hopper.ws
#    rename hedi_ascii.ws -> lamarr.ws
#    add rameev.ws
#    add shura-bura.ws
# 5. edit brooks.ws (replace placeholder)
#    edit hopper.ws (replace placeholder)
#    edit rameev.ws (replace placeholder)
#    edit shura-bura.ws (replace placeholder)
# 6. delete hopper.ws
#    delete lamarr.ws
#    delete rameev.ws
#    delete shura-bura.ws

git clone https://gist.github.com/pik4ez/a2b0ece78c999e3b9ca54369ffd484f3 pik4ez-ascii
cd pik4ez-ascii

# Remove file deletions and fix lamarr.ws filename:
git filter-repo \
  --path-rename gistfile1.txt:lamarr.ws \
  --path-rename hedi_ascii.ws:lamarr.ws \
  --commit-callback '
    commit.file_changes = [c for c in commit.file_changes if c.type != b"D"]
    commit.message = commit.author_date'

# Squash placeholder text commits:
#   pick 99e0669 1534347757 +0300
#   squash 2e75f1c 1534354829 +0300
#   pick 23b06bb 1534438966 +0300
#   squash 138d65b 1534439105 +0300
git rebase -i --root --committer-date-is-author-date

# Set messages to names of files, since only changes are now adds:
git filter-repo --commit-callback '
  filenames = [c.filename for c in commit.file_changes]
  if len(filenames) > 1:
    filenames[-1] = b"and " + filenames[-1]
  commit.message = b"Add " + b", ".join(filenames)
  commit.committer_name = commit.author_name
  commit.committer_email = commit.author_email'

git branch -m master main
git remote add origin https://github.com/wspace/pik4ez-ascii
