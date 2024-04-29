#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p regexp/decus-grep
cd regexp/decus-grep

clone_submodule https://github.com/aros-development-team/contrib aros-contrib
cd aros-contrib
git filter-repo --force --path fish/grep/grep.c --path-rename fish/grep/:
