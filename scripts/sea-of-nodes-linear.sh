#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

IFS=$'\n'

mkdir sea-of-nodes
cd sea-of-nodes

# Unify author aliases for proper sort order.
cat <<EOF >.mailmap
Dibyendu Majumdar <mobile@majumdar.org.uk> dibyendumajumdar <mobile@majumdar.org.uk>
Dibyendu Majumdar <mobile@majumdar.org.uk> Dibyendu Majumdar <dibyendumajumdar@users.noreply.github.com>
EOF

git -C "$(submodule_path https://github.com/SeaOfNodes/Simple)" ls-tree HEAD --name-only |
  grep '^chapter' |
while read -r chapter; do
  echo "Processing $chapter"
  clone_submodule https://github.com/SeaOfNodes/Simple "$chapter"
  cd "$chapter"

  # Filter the repo to just this chapter.
  chronic git filter-repo \
    --path "$chapter" \
    --path-rename "$chapter/README.md:$chapter.md" \
    --path-rename "$chapter/pom.xml:$chapter.pom.xml" \
    --path-rename "$chapter/:"

  number="$(sed 's/^chapter0*//' <<< "$chapter")"
  message="Chapter $number"$'\n\n'
  first_author=

  # Extract chapter authors and rank by number of commits.
  authors="$(git -c mailmap.file=../.mailmap log --format='%aN <%aE>' --use-mailmap --no-merges |
    sort | uniq -c | sort -nr | sed -E 's/^ *[0-9]+ //')"
  while read -r author; do
    if [[ -z $first_author ]]; then
      first_author="$author"
    else
      message+="Co-authored-by: $author"$'\n'
    fi
  done <<< "$authors"

  echo "Author: $first_author"
  echo -n "$message"

  cd ..
done
