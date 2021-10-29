#!/bin/sh -e

# https://gist.github.com/search?q=user%3Apik4ez+extension%3Aws

git clone https://gist.github.com/pik4ez/a2b0ece78c999e3b9ca54369ffd484f3 brooks
git clone https://gist.github.com/pik4ez/61c0678799dbd4a7fc5a6ca08959b7b4 hopper
git clone https://gist.github.com/pik4ez/8274216220511d0e42de7881eca782da rameev
git clone https://gist.github.com/pik4ez/fb76073886531d9b888a5c86e870bccd shura-bura
git clone https://gist.github.com/pik4ez/e3d776091bae3a41e18ae1404bdccac1 lamarr

git -C brooks filter-repo --path brooks.ws --commit-callback 'commit.message = b"Add brooks.ws" if len(commit.parents) == 0 else b"Update brooks.ws"'
git -C hopper filter-repo --commit-callback 'commit.message = b"Add hopper.ws" if len(commit.parents) == 0 else b"Update hopper.ws"'
git -C rameev filter-repo --commit-callback 'commit.message = b"Add rameev.ws" if len(commit.parents) == 0 else b"Update rameev.ws"'
git -C shura-bura filter-repo --commit-callback 'commit.message = b"Add shura-bura.ws" if len(commit.parents) == 0 else b"Update shura-bura.ws"'
git -C lamarr filter-repo --commit-callback 'commit.message = b"Add lamarr.ws" if len(commit.parents) == 0 else b"Update lamarr.ws"'

git -C brooks branch -m master main
git -C hopper branch -m master main
git -C rameev branch -m master main
git -C shura-bura branch -m master main
git -C lamarr branch -m master main

# Squash placeholder text commits:

# pick b11d3e4 Add brooks.ws
# squash 80e8765 Update brooks.ws
git -C brooks rebase -i --root --committer-date-is-author-date
# pick 9967a1a Add hopper.ws
# squash b4f044a Update hopper.ws
git -C hopper rebase -i --root --committer-date-is-author-date
# pick 389083a Add rameev.ws
# squash c32541c Update rameev.ws
git -C rameev rebase -i --root --committer-date-is-author-date
# pick f000050 Add shura-bura.ws
# squash b15338c Update shura-bura.ws
git -C shura-bura rebase -i --root --committer-date-is-author-date
# pick 395f248 Add lamarr.ws
# squash cf6687d Update lamarr.ws
git -C lamarr rebase -i --root --committer-date-is-author-date

git -C brooks filter-repo --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'
git -C hopper filter-repo --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'
git -C rameev filter-repo --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'
git -C shura-bura filter-repo --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'
git -C lamarr filter-repo --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'

mkdir pik4ez
cd pik4ez
git init
git remote add brooks ../brooks
git remote add hopper ../hopper
git remote add rameev ../rameev
git remote add shura-bura ../shura-bura
git remote add lamarr ../lamarr
git fetch brooks
git fetch hopper
git fetch rameev
git fetch shura-bura
git fetch lamarr
git merge --allow-unrelated-histories --no-edit brooks/main
git merge --allow-unrelated-histories --no-edit hopper/main
git merge --allow-unrelated-histories --no-edit rameev/main
git merge --allow-unrelated-histories --no-edit shura-bura/main
git merge --allow-unrelated-histories --no-edit lamarr/main
git remote remove brooks
git remote remove hopper
git remote remove rameev
git remote remove shura-bura
git remote remove lamarr

# Automatically sorts by author date and drops merge commits.
# Accept change list as-is.
git rebase -i --root --committer-date-is-author-date
git filter-repo -f --commit-callback 'commit.committer_name = commit.author_name; commit.committer_email = commit.author_email'
