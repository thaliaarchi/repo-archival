#!/bin/bash -e

. base.sh

# Verify that HEAD is contained within the master branch of inferno-os.
git_verify_is_ancestor() {
  local repo="$1"
  pushd "$repo" > /dev/null
  git remote add inferno-os "$TOPLEVEL/git/github.com/inferno-os/inferno-os"
  git fetch -q inferno-os
  if git merge-base --is-ancestor HEAD inferno-os/master; then
    echo "inferno-os continues from $repo at commit"
    git log -1 --format='%H %ai %s'
  else
    echo "inferno-os does not contain the history of $repo" >&2
    exit 1
  fi
  git remote remove inferno-os
  popd > /dev/null
}

section() {
  local name="$1"
  echo_header "$name"
  if [[ -d $name ]]; then
    echo 'Already completed'
  else
    "$name"
  fi
}

inferno-1e0() {
  copy_submodule github.com/inferno-os/inferno-1e0
  # Two spurious commits add, then delete .gitignore
  git -C inferno-1e0 filter-repo --quiet --invert-path --path .gitignore
}

# Inferno 4E Mercurial repo
inferno-os-hg-git() {
  # https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/inferno-os/inferno-os-hg
  # https://bitbucket-archive.softwareheritage.org/projects/in/inferno-os/inferno-os-hg.html
  mkdir inferno-os-hg
  tar xf "$(get_cached_path https://bitbucket-archive.softwareheritage.org/new-static/dc/dc139a99-1421-4196-9b08-0479cdc057ae/dc139a99-1421-4196-9b08-0479cdc057ae-repository.tar.gz)" \
    --strip-components=1 \
    -C inferno-os-hg
  # The hg-to-git conversion by SWH does not match commit hashes. Luckily,
  # hg-fast-export produces the same hashes as appear on GitHub.
  hg_to_git inferno-os-hg inferno-os-hg-git
  git_verify_is_ancestor inferno-os-hg-git
  rm -r inferno-os-hg
}

# Inferno 4E Mercurial checkout with Unix executables
inferno-4e-20150328() {
  tar xf "$(get_cached_path https://www.vitanuova.com/dist/4e/inferno-20150328.tgz)"
  fix_perms inferno
  mv inferno inferno-4e-20150328-hg
  hg_to_git inferno-4e-20150328-hg inferno-4e-20150328
  git_verify_is_ancestor inferno-4e-20150328
}

# Inferno 4E Mercurial checkout with Windows executables
inferno-4e-win() {
  unzip -q "$(get_cached_path https://www.vitanuova.com/dist/4e/inferno.zip)"
  mv inferno inferno-4e-win-hg
  hg_to_git inferno-4e-win-hg inferno-4e-win
  git_verify_is_ancestor inferno-4e-win
}

mkdir -p inferno
cd inferno
section inferno-1e0
section inferno-os-hg-git
section inferno-4e-20150328
section inferno-4e-win
