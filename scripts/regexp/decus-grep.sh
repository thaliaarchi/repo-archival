#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p regexp/decus-grep
cd regexp/decus-grep

git init -q

# TODO: SNIPPETS

# Extract fish/grep/grep.c. Rewrite git-svn trailers for the decommissioned SVN
# to be to the current GitHub repo.
# TODO: Are there other greps/regexp engines in here?
clone_submodule https://github.com/aros-development-team/contrib aros-contrib
cd aros-contrib
git filter-repo --force --quiet \
  --path fish/grep/grep.c --path-rename fish/grep/: \
  --commit-callback '
    commit.message = re.sub(
      br"\n+git-svn-id: https://svn\.aros\.org/svn/aros/trunk@\d+ fb15a70f-31f2-0310-bbcc-cdcc74a49acc\n$|\n*$", b"", commit.message)
    if not b"\nSigned-off-by: " in commit.message:
      commit.message += b"\n"
    commit.message += b"\nSource: https://github.com/aros-development-team/contrib/commit/" + commit.original_id + b"\n"
    commit.author_email = commit.author_email.removesuffix(b"@fb15a70f-31f2-0310-bbcc-cdcc74a49acc")
    commit.committer_email = commit.committer_email.removesuffix(b"@fb15a70f-31f2-0310-bbcc-cdcc74a49acc")
  '
# Linearize merge and drop duplicate commit.
git rebase --root
cd ..

clone_submodule https://github.com/thaliaarchi/zeus-editor-archive zeus
# Extract only GREP.C from V2.15. Since it is the same in both Zeus for Windows
# and WIN32, remove the OS from the message. Use the modified date of GREP.C
# (the same for both). GREP.C has its own license, so do not include the Zeus
# license.
git -C zeus filter-repo --quiet \
  --path GREP.C \
  --commit-callback '
    if commit.message == b"Zeus Programmers Editor for Windows V2.15\n\nSource: https://archive.org/details/ZEUSV215_ZIP\n":
      commit.message = b"GREP.C from Zeus Programmers Editor V2.15\n"
      commit.author_date = commit.committer_date = b"829131866 +0000" # 1996-04-10 10:24:26
    commit.message += b"\nSource: https://github.com/thaliaarchi/zeus-editor-archive/commit/" + commit.original_id + b"\n"
  '

clone_submodule https://gitlab.com/zsaleeba/picoc.git
git -C picoc filter-repo --quiet \
  --path tests/46_grep.c --path-rename tests/: \
  --prune-empty always \
  --commit-callback '
    commit.message = re.sub(
      br"\n+git-svn-id: http://picoc.googlecode.com/svn/trunk@\d+ 21eae674-98b7-11dd-bd71-f92a316d2d60\n$|\n*$", b"", commit.message)
    commit.message += b"\n\nSource: https://gitlab.com/zsaleeba/picoc/-/commit/" + commit.original_id + b"\n"
    commit.author_email = commit.author_email.removesuffix(b"@21eae674-98b7-11dd-bd71-f92a316d2d60")
    commit.committer_email = commit.committer_email.removesuffix(b"@21eae674-98b7-11dd-bd71-f92a316d2d60")
  '

clone_submodule https://repo.or.cz/tinycc.git
cd tinycc
git filter-repo --quiet \
  --path tests2/46_grep.c --path-rename tests2/: \
  --path tests/tests2/46_grep.c --path-rename tests/tests2/: \
  --preserve-commit-encoding \
  --commit-callback '
    commit.message = re.sub(br"\n+$", b"", commit.message)
    commit.message += b"\n\nSource: https://repo.or.cz/tinycc.git/commit/" + commit.original_id + b"\n"
  '
git tag | chronic xargs git tag -d
git branch -m tinycc

git remote add picoc ../picoc
git fetch -q picoc
git branch -q picoc picoc/master
git remote remove picoc
git replace --graft "$(git rev-list --max-parents=0 HEAD)" picoc
git filter-repo --force --quiet
cd ..
rm -rf picoc
