#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

mkdir kevincruijssen-codegolf
cd kevincruijssen-codegolf
git init -q

commit_README() {
  date="$1"
  author="$2"
  message="$3"
  slug="$4"
  revision_url="$5"
  source_url="$6"

  answer_id="${revision_url%/*}"
  answer_id="${answer_id##*/}"
  revision_number="${revision_url##*/}"
  cache_path="../../../cache/codegolf-$answer_id-$revision_number.md"
  if [ ! -f "$cache_path" ]; then
    wget -q "$source_url" -O "$cache_path"
  fi
  mkdir -p "$slug"

  # Extract answer from page
  htmlq --text 'body > pre' -o "$slug/README.md" < "$cache_path"
  # Remove superfluous LF at the end of the file from htmlq serialization
  truncate -s-1 "$cache_path"
  # Extract code block from answer
  grep '^    ' "$slug/README.md" | cut -b5- > "$slug/code.ws"
  git add "$slug"

  GIT_AUTHOR_NAME="$author" GIT_AUTHOR_EMAIL='' GIT_AUTHOR_DATE="$date" \
  GIT_COMMITTER_NAME="$author" GIT_COMMITTER_EMAIL='' GIT_COMMITTER_DATE="$date" \
  git commit -q -m "$message

$revision_url"
}

# Kevin is located in the Netherlands

# Created 2018-04-06 09:10:53Z by Kevin Cruijssen https://codegolf.stackexchange.com/revisions/161445/1 https://codegolf.stackexchange.com/revisions/01bfc4ca-bb88-4356-a413-1649b13884af/view-source
# Edited  2020-06-17 09:04:33Z by Community [bot] https://codegolf.stackexchange.com/revisions/161445/2 https://codegolf.stackexchange.com/revisions/1b0daa8c-9719-46cc-8fee-5215e3b7fa79/view-source
#   Commonmark migration

# Raw code from https://tio.run/##VY5LCoAwDETXmVPM1UQKdicoePzYtGkdaSHMJ488R73LdW57cSdp7SGmMWaM@GlhNJrsPtTUikEISyUoA5UcwH86@YIZEFn@6vOOBeM6JfNOAkUawrPuAe4v
# TODO: Preserve potential line ending differences.
cp -r ../../../files/wspace/kevincruijssen-codegolf/all-your-base-are-belong-to-us .
git add all-your-base-are-belong-to-us

commit_README '2018-04-06 11:10:53 +0200' 'Kevin Cruijssen' \
  'Answer All Your Base Are Belong To Us (Restricted)' all-your-base-are-belong-to-us \
  https://codegolf.stackexchange.com/revisions/161445/1 https://codegolf.stackexchange.com/revisions/01bfc4ca-bb88-4356-a413-1649b13884af/view-source

commit_README '2020-06-17 09:04:33 +0000' 'Community [bot]' \
  'Commonmark migration' all-your-base-are-belong-to-us \
  https://codegolf.stackexchange.com/revisions/161445/2 https://codegolf.stackexchange.com/revisions/1b0daa8c-9719-46cc-8fee-5215e3b7fa79/view-source

# TODO: Other answers listed at https://github.com/wspace/corpus#code-golf-challenges
