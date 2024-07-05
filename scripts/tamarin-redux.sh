#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

hg_repo="$TOPLEVEL/hg/hg.mozilla.org/tamarin-redux"
if [[ ! -e $hg_repo ]]; then
  hg clone https://hg.mozilla.org/tamarin-redux "$hg_repo"
fi

hg_to_git "$hg_repo" tamarin-redux
