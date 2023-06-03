#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

git svn clone svn://svn.code.sf.net/p/redlandside/code/ marktraceur-redlandside \
  --no-metadata \
  --authors-file=<(echo '
marktraceur = Mark Holmquist <marktraceur@gmail.com>
lostinaudio89 = Logan May <lostinaudio89>
')
cd marktraceur-redlandside

git remote add truncated ../../../git/github.com/MarkTraceur/redlandside
git fetch -a
git reset --hard truncated/master

GIT_SEQUENCE_EDITOR='touch' \
git -c rebase.instructionFormat="%s%nexec GIT_COMMITTER_NAME='%cn' GIT_COMMITTER_EMAIL='%ce' GIT_COMMITTER_DATE='%ci' git commit --amend --no-edit --allow-empty --allow-empty-message" \
  rebase -i -q --committer-date-is-author-date git-svn

git filter-repo -f \
  --message-callback 'return re.sub(br"[\s\n]*$", b"", message) + b"\n"' \
  --replace-message <(echo 'First commit==>Convert to git')

git remote add origin https://github.com/wspace/marktraceur-redlandside
