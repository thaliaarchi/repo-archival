I noticed that your new [hostilefork/rebol-whitespacers](https://github.com/hostilefork/rebol-whitespacers) repo doesn't preserve any git history, so I used a combination of git filter-repo and git rebase to concatenate the whitespacers and rebol-whitespacers histories.

I've published this version with preserved history at [wspace/rebol-whitespacers](https://github.com/wspace/rebol-whitespacers) for now. Let me know if you'd rather have it on your user profile or in the wspace org. If hostilefork/ and you give me the go ahead, I'll do a `push --force` with the preserved history. If wspace/, it would be best to transfer the repo to the org so that it will redirect from your profile and the star will be preserved; I'd set you as the owner.

Here's how I did it:

git filter-repo makes it easy to remove all files that don't match the given patterns. This invocation filters whitespacers to only the files used in rebol-whitespacers (and it would be all you'd need if there was no hard fork):

```sh
git filter-repo --path rebol --path ren-c --path .github --path README
```

I then used rebase to replay the new rebol-whitespacers commits on top of whitespacers by

- removing the “Prepare for switching to archived repository” whitespacers commit because it deletes files that are used in rebol-whitespacers.
- removing the “Initial commit” rebol-whitespacers commit because it adds a dummy README.md
- and editing the “Get R3-Alpha/Ren-C interpreters from collection” rebol-whitespacers commit so that the files are moved to the reorganized paths

Unfortunately, rebase overwrites the committer name, email, and time for every modified commit, so I wrote a script that stores the committer information before rebasing, then applies it afterwards. This was dreadfully annoying.

I've included the scripts I wrote to do this below. The entire process is deterministic (given a deterministic squash commit message), but I wasn't able to automate two interactive parts, so it's probably not worth trying. I've verified that the rewrite preserved all history and metadata, automatically and manually.

<details>
<summary>concat_histories.bash</summary>

```bash
#!/bin/bash -e

# Clone both repos.
# whitespacers is the base and rebol-whitespacers is left unchanged.
git clone https://github.com/hostilefork/rebol-whitespacers
git clone https://github.com/hostilefork/whitespacers rebol-whitespacers-concat
cd rebol-whitespacers-concat

# Only include Rebol- and Ren-C-related files.
# If you want to verify that these paths are correct for all commits,
# including deletions and renames, you can run `git filter-repo --analyze`
# to generate a report at .git/filter-repo/analysis/path-all-sizes.txt.
git filter-repo --path rebol --path ren-c --path .github --path README

# Rename master to main to match rebol-whitespacers.
git branch -m master main

# Merge rebol-whitespacers into whitespacers. This adds all files from
# rebol-whitespacers at their new paths, so there are duplicates for
# now. The merge commit is later discarded by the rebase, so don't worry
# about the commit message.
git remote add rebol ../rebol-whitespacers
git fetch rebol
git merge --allow-unrelated-histories --no-edit rebol/main
git remote remove rebol

# Record committer information so that it can be recovered after rebase.
../record_committers.bash ../committers.py

# Rebase to make the following changes:
# - Remove the penultimate whitespacers commit because it deletes files
#   that are used in rebol-whitespacers.
# - Squash the first two commits of rebol-whitespacers to move files to
#   their new paths and get rid of the dummy README.md.
#
# Start the rebase at "fdd7acb GitHub Actions workflow to test Rebol Whitespacers".
# If the commit hash is different, you have rewritten history
# differently and need to replace the hash in the rebase invocation.
#
# When the interactive editor opens, change pick to drop/edit/squash as
# follows:
#
#   drop 233e029 Prepare for switching to archived repository
#   pick 9b3c3fb Fix typo in Rebol/Ren-C titles; update filenames to current
#   edit 02daa2c Initial commit
#   squash aff5261 Get R3-Alpha/Ren-C interpreters from collection
#   pick 0447490 Take filename on the command line
#   pick 102a453 Break Dialect and Runtime into Separate Files
#   pick c429a5d Pretend UPARSE is the official PARSE behavior
#   pick d18e0ee Disable Syntax Highlighting for Rebol Files
#   pick 234d2b3 Update README.md
#
git rebase -i --committer-date-is-author-date fdd7acb

# Edit the rebol-whitespacers initial commit to move files to their new
# paths and get rid of the dummy README.md.
mkdir historical
git rm README README.md
git mv rebol/whitespace.reb historical/whitespace-old.reb
git mv ren-c/{whitespace.reb,README.md} .
git mv .github/workflows/test-{rebol,whitespacers}.yml
rmdir rebol ren-c
git commit --amend --no-edit

# Resolve conflicts in "Get R3-Alpha/Ren-C interpreters from collection",
# automatically choosing the changes from rebol-whitespacers.
git rebase --continue || :
git diff --name-only --diff-filter=U | xargs git checkout --theirs
git add --all

# Squash these two commits. Reword the new commit message to make sense
# in this new context (at least remove the "Initial commit" line).
git rebase --continue

# Restore accurate committer information.
../restore_committers.bash ../committers.py
rm ../committers.py

# Delete excessive replacement objects.
git replace --delete $(git replace --list)
```

</details>

<details>
<summary>record_committers.bash</summary>

```sh
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
```

</details>

<details>
<summary>restore_committers.bash</summary>

```sh
#!/bin/bash -e

callback="$1"

git filter-repo --commit-callback "$(cat "$callback")"

git config --local --unset-all --fixed-value user.name dummy
git config --local --unset-all --fixed-value user.email dummy@example.com
```

</details>
