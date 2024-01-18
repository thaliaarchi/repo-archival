#!/bin/bash -e

. base.sh

mkdir -p inferno
cd inferno

copy_submodule github.com/inferno-os/inferno-1e0
# Two spurious commits add, then delete .gitignore
git filter-repo --quiet --invert-path --path .gitignore
