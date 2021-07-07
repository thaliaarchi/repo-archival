#!/bin/bash -e

callback="$1"

# Set your name locally to "dummy" so that we can detect commits for
# which rebase changed the committer.
git config --local --add user.name dummy
git config --local --add user.email dummy@example.com

# Generate callback for filter-repo.
echo 'p = re.compile(br"\n\n\[ref:([0-9a-f]{40})\]\n")
match = p.search(commit.message)
if match:
  ref = match.group(1)
  commit.message = p.sub(b"", commit.message)

if not match or commit.committer_name != b"dummy":
  pass' > "$callback"

git log --date=raw --format='elif ref == b"%H":
  commit.author_name = b"""%an"""
  commit.author_email = b"""%ae"""
  commit.author_date = b"%ad" # %ai
  commit.committer_name = b"""%cn"""
  commit.committer_email = b"""%ce"""
  commit.committer_date = b"%cd" # %ci' >> "$callback"

# Append commit hash to each commit message.
git filter-repo --commit-callback 'commit.message += b"\n\n[ref:%s]\n" % commit.original_id'
