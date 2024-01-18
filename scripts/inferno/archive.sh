#!/bin/bash -e

. base.sh

mkdir -p inferno
cd inferno
mkdir inferno-1e0 inferno-os-hg inferno-os-hg-git

## inferno-1e0

copy_submodule github.com/inferno-os/inferno-1e0
# Two spurious commits add, then delete .gitignore
git -C inferno-1e0 filter-repo --quiet --invert-path --path .gitignore

## inferno-os-hg

# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/inferno-os/inferno-os-hg
# https://bitbucket-archive.softwareheritage.org/projects/in/inferno-os/inferno-os-hg.html
tar xf "$(get_cached_path https://bitbucket-archive.softwareheritage.org/new-static/dc/dc139a99-1421-4196-9b08-0479cdc057ae/dc139a99-1421-4196-9b08-0479cdc057ae-repository.tar.gz)" \
  --strip-components=1 \
  -C inferno-os-hg

# The hg-to-git conversion by SWH does not match commit hashes. Luckily,
# hg-fast-export produces the same hashes as appear on GitHub.
cd inferno-os-hg-git
git init -q
git config core.ignoreCase false
# https://github.com/frej/fast-export
hg-fast-export -r ../inferno-os-hg -M main
git checkout -q HEAD

# Verify that hg-to-git HEAD is contained within git master.
git remote add origin "$TOPLEVEL/git/github.com/inferno-os/inferno-os"
git fetch -q origin
if git merge-base --is-ancestor HEAD origin/master; then
  echo 'https://github.com/inferno-os/inferno-os continues from https://bitbucket.org/inferno-os/inferno-os-hg at commit:'
  git log -1
else
  echo 'https://github.com/inferno-os/inferno-os does not contain the history of https://bitbucket.org/inferno-os/inferno-os-hg' >&2
  exit 1
fi

rm -rf inferno-os-hg
