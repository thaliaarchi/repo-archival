#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

IFS=$'\n'

mkdir sea-of-nodes
cd sea-of-nodes
git init -q

repo="$(submodule_path https://github.com/SeaOfNodes/Simple)"

git -C "$repo" ls-tree HEAD --name-only | grep '^chapter' |
while read -r chapter; do
  echo "Processing $chapter"

  # Unify author aliases for proper sort order.
  cat <<EOF >.mailmap
Dibyendu Majumdar <mobile@majumdar.org.uk> dibyendumajumdar <mobile@majumdar.org.uk>
Dibyendu Majumdar <mobile@majumdar.org.uk> Dibyendu Majumdar <dibyendumajumdar@users.noreply.github.com>
EOF

  number="$(sed 's/^chapter0*//' <<< "$chapter")"
  message="Chapter $number"$'\n\n'
  first_author=

  # Extract chapter authors and rank by number of commits.
  authors="$(
    git -C "$repo" -c mailmap.file="$PWD/.mailmap" log \
      --format='%aN <%aE>' --use-mailmap --no-merges "$chapter" |
    sort | uniq -c | sort -nr | sed -E 's/^ *[0-9]+ //')"
  while read -r author; do
    if [[ -z $first_author ]]; then
      first_author="$author"
    else
      message+="Co-authored-by: $author"$'\n'
    fi
  done <<< "$authors"
  rm .mailmap

  root_files=(README.md LICENSE .gitignore .dir-locals.el)

  # Get the first and last dates this chapter was modified.
  author_root_files=()
  if [[ $chapter = chapter01 ]]; then
    # Only include the commit date of the root files for chapter01.
    author_root_files+=("${root_files[@]}")
  fi
  author_date="$(git -C "$repo" log --format=%ad --date=raw --reverse "$chapter" "${author_root_files[@]}" | head -n1)"
  committer_date="$(git -C "$repo" log --format=%ad --date=raw -1 "$chapter" "${root_files[@]}")"

  # Add the files for the chapter.
  git rm -qr --ignore-unmatch .
  cp -r "$repo/$chapter/" .
  mv README.md "$chapter.md"
  mv pom.xml "$chapter.pom.xml"
  git add .

  # Add the shared files in the root.
  cp "${root_files[@]/#/"$repo/"}" .
  git add "${root_files[@]}"

  commit "$first_author $author_date, $committer_date" "$message"
done
