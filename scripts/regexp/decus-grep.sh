#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p regexp/decus-grep
cd regexp/decus-grep

git init -q

get_cached https://web.archive.org/web/19980418215251/http://snippets.org/GREP.C
git add GREP.C
# The date is when it was last modified, as written in the file. It has no HTTP
# Last-Modified header. The SNIPPETS collection was first released in 1992 or
# earlier (see https://web.archive.org/web/19980418181553/http://snippets.org/SNIPPETS.TXT).
GIT_AUTHOR_EMAIL='Bob Stout' GIT_AUTHOR_EMAIL='rbs@snippets.org' GIT_AUTHOR_DATE='1997-07-05 00:00:00 +0000' \
GIT_COMMITTER_EMAIL='Bob Stout' GIT_COMMITTER_EMAIL='rbs@snippets.org' GIT_COMMITTER_DATE='1997-07-05 00:00:00 +0000' \
git commit -q -m '"Real" grep - free with some strings

Source: https://web.archive.org/web/19980418215251/http://snippets.org/GREP.C'

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
