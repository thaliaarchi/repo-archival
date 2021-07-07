#!/bin/bash -e

callback="$1"

git filter-repo --commit-callback "$(cat "$callback")"

git config --local --unset-all --fixed-value user.name dummy
git config --local --unset-all --fixed-value user.email dummy@example.com
