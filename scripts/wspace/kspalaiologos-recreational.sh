#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p wspace
cd wspace

# kspalaiologos' code golf and other programming puzzle solutions lived in
# https://web.archive.org/web/20230622203235/https://github.com/kspalaiologos/codegolf-submissions,
# from 2019-08-14 to 2022-03-21, which I've archived at https://github.com/wspace/kspalaiologos-codegolf.
# She restarted in https://github.com/kspalaiologos/recreational with an empty
# Git history on 2022-03-02 and copied the codegolf-submissions files into it on
# 2023-11-12. Graft those histories together.

clone_submodule https://github.com/kspalaiologos/recreational kspalaiologos-recreational
codegolf_submodule="$(submodule_path https://github.com/wspace/kspalaiologos-codegolf)"
cd kspalaiologos-recreational

git remote add codegolf "$codegolf_submodule"
git fetch -q codegolf

# The bulk of codegolf was copied into recreational in b0b31d9 (more stuff from
# cgse, 2023-11-12). Make that commit into into a merge commit, where its first
# parent remains 93b3082 (Create 41-4.b, 2023-08-24) from recreational and its
# second parent becomes 85ded3d (Create 239831.apl, 2022-03-21), the last commit
# of codegolf.
git replace --graft b0b31d9e8d56c6986613a3b49762b61a658a9eb8 \
  93b3082bb547296d11411578181aeff928e1531b \
  codegolf/main

git remote remove codegolf