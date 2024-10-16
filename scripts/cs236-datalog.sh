#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

export TZ=America/Denver
export AUTHOR='Cory Barker <barker@cs.byu.edu>'

mkdir cs236-datalog
cd cs236-datalog
git init -q

for archive in "$TOPLEVEL"/files/cs236-datalog/2022/*.zip; do
  dir="${archive%.zip}"
  dir="${dir##*/}"
  mkdir "$dir"
  echo "Extracting ${archive#$TOPLEVEL/}"
  unzip -q "$archive" -d "$dir"
done
git add -f .
commit latest 'Add project tests'

git rm -qr --ignore-unmatch .
for url in https://faculty.cs.byu.edu/~barker/cs236/tests/project{1,2,3,4,5}-{tests,passoff}.zip; do
  dir="${url%.zip}"
  dir="${dir##*/}"
  mkdir "$dir"
  echo "Extracting $url"
  unzip -q "$(get_cached_path "$url")" -d "$dir"
done
git add -f .
commit latest 'Update project tests'
