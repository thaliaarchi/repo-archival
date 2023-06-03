#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# Convert SVN repo
git svn clone svn://svn.code.sf.net/p/redlandside/code/ marktraceur-redlandside \
  --no-metadata \
  --authors-file=<(echo '
marktraceur = Mark Holmquist <marktraceur@gmail.com>
lostinaudio89 = Logan May <lostinaudio89@users.sourceforge.net>
')
cd marktraceur-redlandside
git branch svn
git filter-repo -f --quiet \
  --refs svn \
  --message-callback 'return re.sub(br"[\s\n]*$", b"", message) + b"\n"'

commit_build() {
  local build="$1"
  local date="$2"
  local message="$3"
  git rm -qf '*'
  tar xf "$(get_cached_path "https://master.dl.sourceforge.net/project/redlandside/Sources/build_$build.tar.gz?viasf=1")" --strip-components=1
  rm -f -- test.py *.pyc 'icons/Redlands logo style 1 RGBb.jpg'
  git add -A
  GIT_AUTHOR_NAME='Mark Holmquist' GIT_AUTHOR_EMAIL='marktraceur@gmail.com' GIT_AUTHOR_DATE="$date" \
  GIT_COMMITTER_NAME='Mark Holmquist' GIT_COMMITTER_EMAIL='marktraceur@gmail.com' GIT_COMMITTER_DATE="$date" \
  git commit -q -m "$message"
  git clean -xqf
}

# Commit build archives
git checkout --orphan builds
commit_build 1 '2010-03-14 13:38:31 +0000' 'Build 0.1' # pre-SVN
commit_build 2 '2010-03-22 11:33:55 +0000' 'Build 2'   # pre-SVN
commit_build 3 '2010-03-29 01:41:01 +0000' 'Build 3'   # Corresponding commit: 2010-03-29 01:38:37 +0000
commit_build 4 '2010-04-16 07:36:45 +0000' 'Build 4'   # Corresponding commit: 2010-04-16 07:36:33 +0000

# Append truncated git repo
git remote add git https://github.com/MarkTraceur/redlandside
git fetch -a
git branch git git/master
git remote remove git

git checkout main
git reset --hard git
GIT_SEQUENCE_EDITOR='touch' rebase_with_metadata -i -q --committer-date-is-author-date svn
GIT_SEQUENCE_EDITOR='touch' rebase_with_metadata -i -q --committer-date-is-author-date builds~2 || :
git rm compiler.py
GIT_EDITOR='touch' git rebase --continue || :
git rebase --skip

git filter-repo -f --quiet \
  --refs main \
  --replace-message <(echo 'First commit==>Convert to git')

git remote add origin https://github.com/wspace/marktraceur-redlandside
