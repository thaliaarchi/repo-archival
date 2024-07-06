#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - Include all volumes in the repo.
# - Retrieve the author information from the BibTeX in Preface.html.

mkdir software-foundations
cd software-foundations
git init -q

source <(
jq -rf <(cat <<EOF
.[0] | del(.versions) * .versions[] |
"commit_archive '\(.title) authors <> latest' '\(.title) \(.version)' '\(.download)'"
EOF
) "$TOPLEVEL/scripts/software-foundations/versions.json"
)
