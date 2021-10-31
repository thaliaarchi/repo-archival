#!/bin/sh -e

git clone https://github.com/KeenS/whitelie
git clone https://gist.github.com/KeenS/6081b0c802a4e575ddbacb1930680870 whitelie-aux

# Overwrite synthetic time of 2020-04-01 00:00:00 +0000
git -C whitelie filter-repo --commit-callback '
  if commit.message == b"create it\n": commit.author_date = commit.committer_date'
# Adjust UTC times from GitHub Gist to +0900
git -C whitelie-aux filter-repo --commit-callback '
  commit.author_date = re.sub(br"\+0000", b"+0900", commit.author_date)
  commit.committer_date = re.sub(br"\+0000", b"+0900", commit.committer_date)'

git -C whitelie branch -m master main
git -C whitelie-aux branch -m master main

cd whitelie
git remote add aux ../whitelie-aux
git fetch aux
git merge --allow-unrelated-histories --no-edit aux/main

git log --format='%ad %h %s'
# 2021-08-07 22:57:55 +0200 ba3fe69 Merge remote-tracking branch 'aux/main'
# 2020-04-02 09:27:41 +0900 ef7f438 fix a bug of program size calcuration
# 2020-04-02 09:24:44 +0900 f1c5d46
# 2020-04-02 00:19:19 +0900 7b9d613 add README
# 2020-04-02 00:16:39 +0900 e380295 add copying
# 2020-04-01 23:52:26 +0900 a4885a5
# 2020-03-31 23:46:45 +0900 419aa00 create it

git rebase -i --root --empty=drop
# From:
#   pick 419aa00 create it
#   pick e380295 add copying
#   pick 7b9d613 add README
#   pick ef7f438 fix a bug of program size calcuration
#   pick a4885a5
#   pick f1c5d46
# To:
#   pick 419aa00 create it
#   reword a4885a5
#   pick e380295 add copying
#   pick 7b9d613 add README
#   pick f1c5d46
#   squash ef7f438 fix a bug of program size calcuration
#
# Reword a4885a5 as "add assembler and copying"
# Accept f1c5d46+ef7f438 squashed message as-is

git filter-repo --commit-callback '
  commit.committer_name = commit.author_name
  commit.committer_email = commit.author_email
  commit.committer_date = commit.author_date'

git log --format='%ad %h %s'
# 2020-04-02 09:24:44 +0900 11673cf fix a bug of program size calcuration
# 2020-04-02 00:19:19 +0900 f7d120c add README
# 2020-04-01 23:52:26 +0900 a373ecd add assembler and copying
# 2020-03-31 23:46:45 +0900 419aa00 create it

git remote add origin https://github.com/wspace/keen-whitelie
