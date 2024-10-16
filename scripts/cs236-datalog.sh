#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir cs236-datalog
cd cs236-datalog
git init -q

for file in project{1,2,3,4,5}-{tests,passoff}.zip; do
  mkdir "${file%.zip}"
  echo "Extracting $file"
  unzip -q "$(get_cached_path "https://faculty.cs.byu.edu/~barker/cs236/tests/$file")" -d "${file%.zip}"
done
git add -f .
TZ=America/Denver commit 'Cory Barker <barker@cs.byu.edu> latest' 'Add project tests'
