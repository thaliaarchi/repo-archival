#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

make_repo() {
  local url="$1"
  local revision="$2"
  local dest="$3"
  clone_swh "$url" "$revision" "$dest"
  git -C "$dest" branch -m master main
  git -C "$dest" remote set-url origin "https://github.com/wspace/$dest"
}

# master branches
make_repo https://github.com/whiteplanes/whiteplanes.cs        38c435a8cb1948a759688f80a59d1443dc3d5fd2 nutcrack-whiteplanes.cs
make_repo https://github.com/whiteplanes/whiteplanes.fs        8aa5c97adf8efb03088df194134f1d7caaa80e92 nutcrack-whiteplanes.fs
make_repo https://github.com/whiteplanes/whiteplanes.jl        0e47eb640593cf2b45ef39a9fdc9b8ad4c94ab1e nutcrack-whiteplanes.jl
make_repo https://github.com/whiteplanes/whiteplanes.js        cd85a089a960b397eac13b7df60e86f34d804f4d nutcrack-whiteplanes.js
make_repo https://github.com/whiteplanes/whiteplanes.php       70b63961921dbaa1026b6bcf154256f996ef6ab6 nutcrack-whiteplanes.php
make_repo https://github.com/whiteplanes/whiteplanes.py        86c2af2439188338dfb3e1decdc2850f6a369719 nutcrack-whiteplanes.py
make_repo https://github.com/whiteplanes/whiteplanes.r         b296859a5e87f9c91a4324b6ebac399cd976aab0 nutcrack-whiteplanes.r
make_repo https://github.com/whiteplanes/whiteplanes.rb        60f39b00b703fdd9c8a3784d52ed5c029a3bc798 nutcrack-whiteplanes.rb
make_repo https://github.com/whiteplanes/whiteplanes.swift     a4b0439db3827a3e4580383d4499d8c4e5e0a97e nutcrack-whiteplanes.swift
make_repo https://github.com/whiteplanes/whiteplanes.github.io 22db96f86ac5e18ce3b8448bc5178a0156e0bb3b nutcrack-whiteplanes.github.io

# release branch
clone_swh https://github.com/whiteplanes/whiteplanes.py 4f97167970accacfa73877c8d0e608931d78ee48 nutcrack-whiteplanes.py-release
cd nutcrack-whiteplanes.py
git remote add release ../nutcrack-whiteplanes.py-release
git fetch -q release
git branch -q release release/master
git remote remove release
cd ..
rm -rf nutcrack-whiteplanes.py-release

# whiteplanes.py is published on PyPI and identical to the release branch, other
# than package manager artifacts.
# https://pypi.org/project/whiteplanes/
# https://files.pythonhosted.org/packages/76/aa/ee00fea23bfc7abcbce61e8e52896758277d330c129624746385281e7b13/whiteplanes-0.0.1.tar.gz
