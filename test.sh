#!/bin/bash -e

SCRIPTS=(
  'cybis/cybf'
  'cybis/hapyli'
  'foones/cratylus'
  'foones/eightfold'
  'mt19937/archive, mt19937'
  'quine-relay'
  're1'
  # 'wspace/0qol-prime' # manual rebase
  'wspace/0x0dea-lolcode'
  'wspace/aniket965-hacktoberfest'
  'wspace/bearice-grassmudhorse'
  'wspace/burghard, wspace/burghard-wsa'
  'wspace/burghard, wspace/burghard-wsintercpp'
  'wspace/burghard, wspace/burghard-wsinterws'
  # 'wspace/edwinb-wspace/archive, wspace/edwinb-wspace' # unfinished
  'wspace/emilbahnsen-assembler'
  'wspace/hogelog-c'
  # 'wspace/ilikepython256-whitespace-unc' # manual rebase
  # 'wspace/keens-whitelie' # manual rebase
  # 'wspace/kevincruijssen-codegolf' # unfinished
  'wspace/kreutzer-spacedide'
  'wspace/lifthrasiir-esotope'
  'wspace/lifthrasiir-esotope-ws'
  'wspace/marktraceur-redlandside'
  'wspace/mash-whitespacesdk'
  'wspace/mkoelbl-perl'
  'wspace/mrbubble-markov'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.cs'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.fs'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.jl'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.js'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.php'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.py'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.r'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.rb'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.swift'
  'wspace/nutcrack-whiteplanes, wspace/nutcrack-whiteplanes.github.io'
  'wspace/omurakazuaki-rust'
  'wspace/pdewacht-tetris'
  # 'wspace/pik4ez-ascii' # manual rebase
  'wspace/progopedia'
  # 'wspace/programs' # unfinished
  'wspace/qeedquan-go'
  # 'wspace/remigascou-c' # repo offline
  'wspace/res0001-trans32'
  'wspace/shimo-yukicoder'
  'wspace/smithers888-bluespace' # commit has new timestamp
  'wspace/ssiegl-wsdebug'
  'wspace/stellwag-wspacegen'
  'wspace/stephenchappell-python'
  'wspace/stribb-debian/archive, wspace/stribb-debian'
  'wspace/wconrad-ruby'
  'wspace/wysang-java' # commit has new timestamp
  'wspace/ytaka23-whitespace'
)

errors=()
for entry in "${SCRIPTS[@]}"; do
  script="${entry%, *}"
  repo="${entry#*, }"
  echo "Testing $repo"
  if [[ ! -e target/$repo ]]; then
    scripts/"$script.sh"
  fi
  cd "target/$repo"
  git fetch -q origin
  git branch --set-upstream-to origin/main
  ahead="$(git rev-list '@{u}..@' --count)"
  if [[ $ahead -gt 0 ]]; then
    errors+=("Generated $repo is $ahead commits ahead of remote")
  fi
  cd - > /dev/null
  echo
done
if [[ ${#errors[@]} -gt 0 ]]; then
  echo >&2
  echo 'Errors:' >&2
  for error in "${errors[@]}"; do
    echo "- $error" >&2
  done
  exit 1
fi
