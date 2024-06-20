#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

IFS=$'\n'

mkdir sea-of-nodes
cd sea-of-nodes
git init -q

repo="$(submodule_path https://github.com/SeaOfNodes/Simple)"

last_committer_date='0 +0000'

git -C "$repo" ls-tree HEAD --name-only | grep '^chapter' |
while read -r chapter; do
  echo "Processing $chapter"

  # Unify author aliases for proper sort order.
  cat <<EOF >.mailmap
Dibyendu Majumdar <mobile@majumdar.org.uk> dibyendumajumdar <mobile@majumdar.org.uk>
Dibyendu Majumdar <mobile@majumdar.org.uk> Dibyendu Majumdar <dibyendumajumdar@users.noreply.github.com>
EOF

  chapter_number="$(gsed 's/^chapter0*//' <<< "$chapter")"
  message="Chapter $chapter_number"$'\n\n'
  first_author=

  # Extract chapter authors and rank by number of commits.
  authors="$(
    git -C "$repo" -c mailmap.file="$PWD/.mailmap" log \
      --format='%aN <%aE>' --use-mailmap --no-merges "$chapter" |
    sort | uniq -c | sort -nr | gsed -E 's/^ *[0-9]+ //')"
  while read -r author; do
    if [[ -z $first_author ]]; then
      first_author="$author"
    else
      message+="Co-authored-by: $author"$'\n'
    fi
  done <<< "$authors"
  rm .mailmap

  # Get the first and last dates this chapter was modified.
  root_files=(README.md LICENSE pom.xml .gitignore .dir-locals.el)
  author_root_files=()
  if [[ $chapter = chapter01 ]]; then
    # Only include the commit date of the root files for chapter01.
    author_root_files+=("${root_files[@]}")
  fi
  author_date="$(git -C "$repo" log --format=%ad --date=raw "$chapter" "${author_root_files[@]}" | tail -n1)"
  committer_date="$(git -C "$repo" log --format=%ad --date=raw -1 "$chapter" "${root_files[@]}")"
  if [[ $committer_date < $last_committer_date ]]; then
    committer_date="$last_committer_date"
  fi

  # Add the files for the chapter.
  git rm -qr --ignore-unmatch .
  cp -r "$repo/$chapter/" .
  mv README.md docs/
  mv docs chapter_docs
  rm pom.xml
  git add .

  # Add the shared files in the root, except for README.md and pom.xml.
  root_files=(LICENSE .gitignore .dir-locals.el)
  cp "${root_files[@]/#/"$repo/"}" .
  git add "${root_files[@]}"

  # Fix README.md, docs/chapter??/README.md, and pom.xml.
  if git rev-parse HEAD >/dev/null 2>/dev/null; then
    # Restore the documentation and pom.xml from the previous chapter.
    git diff --staged --diff-filter=D --name-only -- docs README.md pom.xml | xargs git checkout -q HEAD
  else
    # This is the first commit; setup shared files.
    cp "$repo"/{README.md,pom.xml} .
    mkdir docs
    # Remove links to chapters.
    gsed -Ei 's,\[Chapter ([0-9]+)\]\(chapter0?\1/README\.md\),Chapter \1,' README.md
    # Remove the <modules> section from pom.xml for a single-project structure.
    gsed -i '/<modules>/,/^$/d' pom.xml
  fi
  git mv chapter_docs "docs/$chapter"
  # Restore the link to this chapter.
  gsed -Ei "s,^\* Chapter $chapter_number: ,* [Chapter $chapter_number](docs/$chapter/README.md): ," README.md
  # Repair links for this chapter.
  gsed -Ei 's,\bdocs/,,' "docs/$chapter/README.md"
  git add README.md "docs/$chapter/README.md" pom.xml

  commit "$first_author $author_date, $committer_date" "$message"
done
