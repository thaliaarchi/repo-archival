#!/bin/bash -e

. base.sh

# TODO extract programs from more repos

git clone https://github.com/wspace/stephenchappell-python
git -C stephenchappell-python filter-repo \
  --path LICENSE.md \
  --path Assembly --path-rename Assembly/: \
  --blob-callback 'if b"bmp.py" in blob.data: blob.skip()' \
  --commit-callback '
    if len(commit.file_changes) == 1 and commit.file_changes[0].filename == b"LICENSE.md":
      commit.message = b"Update LICENSE.md\n"
    else:
      commit.message = re.sub(br"https://code\.activestate\.com\S+", b"https://github.com/wspace/stephenchappell-python/commit/" + commit.original_id, commit.message)
  '
# Manual rebase to squash LICENSE.md update commits
