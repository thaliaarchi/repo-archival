#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

# Initial commit:  https://gist.github.com/Andreal2000/8d876ba97b70240b50b68e5993119584
# sbt project:     https://github.com/wspace/andreal2000-scala
# Further commits: https://github.com/Andreal2000/WhitespaceEvaluator

clone_submodule https://github.com/Andreal2000/WhitespaceEvaluator andreal2000-scala
cd andreal2000-scala

# Graft the hard-fork initial commit onto the wspace repo.
git remote add wspace "$(submodule_path https://github.com/wspace/andreal2000-scala)"
git fetch -q wspace
git replace e98b5b5744051ff49fca267c5506a6cc1edb9bb3 97832fc8875cdab38b139eac9875a1e8ae637654
git filter-repo -f --quiet
git remote remove wspace

git remote add origin https://github.com/wspace/andreal2000-scala
