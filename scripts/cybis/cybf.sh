#!/bin/bash -e

. base.sh

NAME='Cybis'
EMAIL='cybis-fdp@hotmail.com'

commit() {
  GIT_AUTHOR_DATE="$1" GIT_COMMITTER_DATE="$1" \
  git -c user.name="$NAME" -c user.email="$EMAIL" \
    commit -q -m "$2"
}

mkdir -p cybis
cd cybis

# SVN repo
unzip -q ../../files/cybis/repos/CyBF.zip
fix_perms CyBF
mv CyBF cybf-svn

# SVN checkout
unzip -q ../../files/cybis/checkouts/CyBF.zip
mv CyBF cybf-svn-checkout
svn relocate "file://$(pwd)/cybf-svn" cybf-svn-checkout

# git conversion
# It has trunk (which was renamed to CyBF), CyBF, and CyBF Library root
# directories, which are used more like subprojects than branches and multiple
# are sometimes updated in the same commit, so I don't use --stdlayout.
git svn clone "file://$(pwd)/cybf-svn" cybf \
  --authors-file=<(echo "Kevin = $NAME <$EMAIL>")
cd cybf

# Convert svn:ignore to .gitignore
# TODO convert .gitignore for all revisions
git svn create-ignore
find . -name .gitignore -exec unix2dos -q {} \;
git add '*.gitignore'
GIT_COMMITTER_NAME="$(git show -s --format=%an)" \
GIT_COMMITTER_EMAIL="$(git show -s --format=%ae)" \
GIT_COMMITTER_DATE="$(git show -s --format=%ai)" \
git commit --amend --no-edit

# Reformat git-svn metadata and collapse trunk
git filter-repo -f --quiet \
  --path-rename trunk/: \
  --message-callback '
    message = re.sub(br"^([\s\S]*?)\n*git-svn-id: .*@(\d+) c9d10fbd-33ba-bc4d-a72f-f4d6a9f61016\n$", br"[r\2] \1\n", message)
    message = re.sub(br"^(\[r\d+\])\s+$", br"\1\n", message)
    return message'

# Untracked and ignored files in SVN checkout:
# zip modified time                Stat Filename
# 2020-12-03 04:59:41.6404838 +0000  I  CyBF/.vs/*
# 2017-05-24 19:21:23.8607907 +0000  I  CyBF/Notes/API Notes.txt
# 2019-07-11 18:22:50.6659512 +0000  I  CyBF/Notes/Model Notes.txt
# 2019-06-28 14:09:37.8590063 +0000  I  CyBF/Notes/Recursion.txt
# 2017-05-26 16:24:04.3965753 +0000  I  CyBF/Notes/Sudoku Notes.txt
# 2020-12-03 04:59:41.8873414 +0000  I  CyBF/bin/*
# 2017-05-24 02:21:50.7530955 +0000  I  CyBF/bin/Debug/Program/ASM_code.txt
# 2017-05-24 02:21:50.7468454 +0000  I  CyBF/bin/Debug/Program/BFIL_code.txt
# 2017-05-24 02:21:50.7468454 +0000  I  CyBF/bin/Debug/Program/code.txt
# 2017-05-24 02:22:18.1392664 +0000  I  CyBF/bin/Debug/Program/Main.cbf
# 2020-12-03 04:59:41.9457248 +0000  I  CyBF/obj/*
# 2017-05-28 01:34:10.3490961 +0000  ?  CyBF Library/ASM_output.txt
# 2017-05-28 01:34:10.2728449 +0000  ?  CyBF Library/BFIL_output.txt
# 2017-05-26 19:16:08.8186862 +0000  ?  CyBF Library/Sudoku.7z
# 2017-05-26 19:06:04.3278666 +0000  ?  CyBF Library/Sudoku.bf
# 2017-05-26 20:31:50.0163044 +0000  ?  CyBF Library/Sudoku.py
# 2017-05-26 20:30:53.7985542 +0000  ?  CyBF Library/bfc.py
# 2017-05-28 01:34:10.2815950 +0000  ?  CyBF Library/output.txt

git config user.name Kevin
git config user.email cybis-fdp@hotmail.com

cp -Rp ../cybf-svn-checkout/CyBF/Notes CyBF/

rebase_break_before_date '2017-05-24 19:21:23 +0000'
git add -f 'CyBF/Notes/API Notes.txt'
commit '2017-05-24 19:21:23 +0000' 'Add API notes'
git rebase --continue

rebase_break_before_date '2017-05-26 16:24:04 +0000'
git add -f 'CyBF/Notes/Sudoku Notes.txt'
commit '2017-05-26 16:24:04 +0000' 'Add sudoku notes'
git rebase --continue

# Sudoku.bf
# zip last modified   2017-05-26 19:06:04.3278666 +0000                  CyBF Library/Sudoku.bf
# 7z last modified    2017-05-26 19:06:04.327867507 +0000                Sudoku.7z/Sudoku.bf
# zip last modified   2017-05-26 19:16:08.8186862 +0000                  CyBF Library/Sudoku.7z
# HTTP Last-Modified  2017-05-26 20:14:55 +0000                          https://what.thedailywtf.com/assets/uploads/files/1495829695493-sudoku.7z
# Posted              2017-05-26 20:34:53.111 +0000        Huf_Lungdung  https://what.thedailywtf.com/topic/23006/stupid-coding-tricks-sudoku-solver-in-brainfuck
cmp '../cybf-svn-checkout/CyBF Library/Sudoku.7z' "$(get_cached_path https://what.thedailywtf.com/assets/uploads/files/1495829695493-sudoku.7z)"
7z x '../cybf-svn-checkout/CyBF Library/Sudoku.7z'
cmp '../cybf-svn-checkout/CyBF Library/Sudoku.bf' Sudoku.bf
mv Sudoku.bf 'CyBF Library/'
rebase_break_before_date '2017-05-26 19:06:04 +0000'
git add 'CyBF Library/Sudoku.bf'
commit '2017-05-26 19:06:04 +0000' 'Compile sudoku solver to Brainfuck

https://what.thedailywtf.com/topic/23006/stupid-coding-tricks-sudoku-solver-in-brainfuck'
git rebase --continue

cp -p '../cybf-svn-checkout/CyBF Library/Sudoku.py' 'CyBF Library'
git add 'CyBF Library/Sudoku.py'
commit '2017-05-26 20:31:50 +0000' 'Compile sudoku solver to Python'

git add -f 'CyBF/Notes/Recursion.txt'
commit '2019-06-28 14:09:37 +0000' 'Add recursion notes'
# Model Notes.txt is empty

git config --unset user.name
git config --unset user.email

git remote add origin https://github.com/thaliaarchi/cybf-archive
