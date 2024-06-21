#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

sort_authors() {
  # Unify author aliases.
  sed -e 's/^dibyendumajumdar <mobile@majumdar\.org\.uk>$/Dibyendu Majumdar <mobile@majumdar.org.uk>/g' \
      -e 's/^Dibyendu Majumdar <dibyendumajumdar@users\.noreply\.github\.com>$/Dibyendu Majumdar <mobile@majumdar.org.uk>/g' |
  # Rank by number of commits.
  sort | uniq -c | sort -nr | gsed -E 's/^ *[0-9]+ //'
}

IFS=$'\n'

mkdir sea-of-nodes-linear
cd sea-of-nodes-linear
git init -q

repo="$(submodule_path https://github.com/SeaOfNodes/Simple)"

last_committer_date='0 +0000'

git -C "$repo" ls-tree HEAD --name-only | grep '^chapter' |
while read -r chapter; do
  echo "Processing $chapter"

  chapter_number="$(gsed 's/^chapter0*//' <<< "$chapter")"
  message="Chapter $chapter_number"$'\n\n'

  # Extract the authors for this chapter from commit authors and the
  # Co-authored-by trailer.
  authors="$(git -C "$repo" log --format='%an <%ae>' --no-merges "$chapter")"
  co_authors="$(git -C "$repo" log --format=%B --no-merges "$chapter" |
    dos2unix | grep '^ *Co-authored-by: ' | cut -d' ' -f2-)"
  first_author="$(sort_authors <<< "$authors" | head -n1)"
  all_authors="$(sort_authors <<< "$authors"$'\n'"$co_authors")"

  while read -r author; do
    if [[ "$author" != "$first_author" ]]; then
      message+="Co-authored-by: $author"$'\n'
    fi
  done <<< "$all_authors"

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
    # Change to a JAR and delete the modules, for a single-project structure.
    gsed -i -e 's,<packaging>pom</packaging>,<packaging>jar</packaging>,' \
            -e '/<modules>/,/^$/d' pom.xml
  fi
  git mv chapter_docs "docs/$chapter"
  # Restore the link to this chapter.
  gsed -Ei "s,^\* Chapter $chapter_number: ,* [Chapter $chapter_number](docs/$chapter/README.md): ," README.md
  # Repair links for this chapter.
  gsed -Ei 's,\bdocs/,,' "docs/$chapter/README.md"
  git add README.md "docs/$chapter/README.md" pom.xml

  commit "$first_author $author_date, $committer_date" "$message"
done
