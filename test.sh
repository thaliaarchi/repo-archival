#!/bin/bash -e

if [[ -e target ]]; then
  echo 'target/ already exists' >&2
  exit 1
fi

# Automatic (git-only)
GIT_ONLY=(
  akers-lolcode
  aniket-hacktoberfest
  bearice-grassmudhorse
  emilbahnsen-assembler
  hogelog-c
  omurakazuaki-rust
  remigascou-c
  shimo-yukicoder
  ssiegl-wsdebug_github
  ytaka-whitespace
)
errors=()
for script in "${GIT_ONLY[@]}"; do
  ./scripts/"$script.sh"
  repo="${script%%_*}" # Hack for ssiegl-wsdebug_github, for now
  pushd "target/$repo"
  git fetch origin
  git branch --set-upstream-to origin/main
  ahead="$(git rev-list '@{u}..@' --count)"
  if [[ $ahead -gt 0 ]]; then
    errors+=("Generated $repo is $ahead commits ahead of remote")
  fi
  popd
done
if [[ ${#errors[@]} -gt 0 ]]; then
  echo >&2
  echo 'Errors:' >&2
  for error in "${errors[@]}"; do
    echo "- $error" >&2
  done
  exit 1
fi

# Automatic, non-deterministic (git-only)
# - pik4ez-ascii
# - qeedquan-go
# - wysang-java

# Automatic (online)
# - hapyli
# - kreutzer-spacedide
# - mesquita-markov
# - mkoelbl-perl
# - nutcrack-whiteplanes
# - pdewacht-tetris
# - progopedia
# - programs
# - ssiegl-wsdebug
# - stellwag-wspacegen
# - stephenchappell-python
# - wconrad-ruby

# Automatic, non-deterministic (online)
# - smithers-bluespace

# Manual rebase
# - 0qol-prime
# - ilikepython256-whitespace-unc
# - keen-whitelie
