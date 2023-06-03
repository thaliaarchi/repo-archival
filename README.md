# Repo Archival

This repository contains scripts used to archive specific software projects as
git repos. It reconstructs revision histories from webpages, prunes large repos,
merges repos, cleans revision histories, and migrates from other version control
systems.

Most of these scripts are to archive Whitespace projects for the
[Whitespace Corpus](https://github.com/wspace/corpus). It also notably
reconstructs a revision history for the [MT19937 Mersenne Twister](https://github.com/thaliaarchi/mt19937-archive)
PRNG from disparate, early files, and publishes the source for the [HaPyLi](https://github.com/wspace/cybis-hapyli)
and [CyBF](https://github.com/thaliaarchi/cybf-archive) compilers.

## Assembled from webpages

- [mt19937](https://github.com/thaliaarchi/mt19937-archive) [[sh](scripts/mt19937/archive.sh)]
- wspace/arnauld-javascript - TODO
- wspace/edwinb-wspace [[sh](scripts/wspace/edwinb-wspace/archive.sh)] - WIP
- wspace/kevincruijssen-codegolf [[sh](scripts/wspace/kevincruijssen-codegolf.sh)] - WIP
- wspace/lmitchell-elisp - TODO
- [wspace/mesquita-markov](https://github.com/wspace/mesquita-markov) [[sh](scripts/wspace/mesquita-markov.sh)]
- [wspace/meth0dz-c](https://github.com/wspace/meth0dz-c) - TODO automate
- [wspace/mkoelbl-perl](https://github.com/wspace/mkoelbl-perl) [[sh](scripts/wspace/mkoelbl-perl.sh)]
- [wspace/peasley-cpp](https://github.com/wspace/peasley-cpp) - TODO automate
- [wspace/progopedia](https://github.com/wspace/progopedia) [[sh](scripts/wspace/progopedia.sh)] - TODO add all Whitespace pages
- wspace/rosettacode - TODO
- [wspace/smithers-bluespace](https://github.com/wspace/smithers-bluespace) [[sh](scripts/wspace/smithers-bluespace.sh)]
- [wspace/stephenchappell-python](https://github.com/wspace/stephenchappell-python) [[sh](scripts/wspace/stephenchappell-python.sh)]
- [wspace/tetris](https://github.com/wspace/tetris) [[sh](scripts/wspace/pdewacht-tetris.sh)]
- wspace/tokigun-esotope-ws - TODO
- [wspace/wconrad-ruby](https://github.com/wspace/wconrad-ruby) [[sh](scripts/wspace/wconrad-ruby.sh)]

## From archives

- [wspace/burghard-wsa](https://github.com/wspace/burghard-wsa) [[sh](scripts/wspace/burghard.sh)]
- [wspace/burghard-wsintercpp](https://github.com/wspace/burghard-wsintercpp) [[sh](scripts/wspace/burghard.sh)]
- [wspace/burghard-wsinterws](https://github.com/wspace/burghard-wsinterws) [[sh](scripts/wspace/burghard.sh)]
- [wspace/nutcrack-whiteplanes](https://github.com/wspace/nutcrack-whiteplanes) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/phlip-pywhitespace](https://github.com/wspace/phlip-pywhitespace) - TODO automate
- [wspace/ssiegl-wsdebug](https://github.com/wspace/ssiegl-wsdebug) [[sh](scripts/wspace/ssiegl-wsdebug.sh)] - TODO [merge with GitHub repo](scripts/wspace/ssiegl-wsdebug_github.sh)
- [wspace/stellwag-wspacegen](https://github.com/wspace/stellwag-wspacegen) [[sh](scripts/wspace/stellwag-wspacegen.sh)]
- [wspace/stribb-debian](https://github.com/wspace/stribb-debian) [[sh](scripts/wspace/stribb-debian/archive.sh)]

## Extracted from git subtree

- [wspace/akers-lolcode](https://github.com/wspace/akers-lolcode) [[sh](scripts/wspace/akers-lolcode.sh)]
- [wspace/aniket-hacktoberfest](https://github.com/wspace/aniket-hacktoberfest) [[sh](scripts/wspace/aniket-hacktoberfest.sh)]
- [wspace/emilbahnsen-assembler](https://github.com/wspace/emilbahnsen-assembler) [[sh](scripts/wspace/emilbahnsen-assembler.sh)]
- [wspace/hogelog-c](https://github.com/wspace/hogelog-c) [[sh](scripts/wspace/hogelog-c.sh)]
- [wspace/omurakazuaki-rust](https://github.com/wspace/omurakazuaki-rust) [[sh](scripts/wspace/omurakazuaki-rust.sh)]
- [wspace/qeedquan-go](https://github.com/wspace/qeedquan-go) [[sh](scripts/wspace/qeedquan-go.sh)]
- [wspace/remigascou-c](https://github.com/wspace/remigascou-c) [[sh](scripts/wspace/remigascou-c.sh)] - source now offline
- [wspace/shimo-yukicoder](https://github.com/wspace/shimo-yukicoder) [[sh](scripts/wspace/shimo-yukicoder.sh)]
- [wspace/wysang-java](https://github.com/wspace/wysang-java) [[sh](scripts/wspace/wysang-java.sh)]

## Merged git histories

- [hostilefork/rebol-whitespacers](https://github.com/hostilefork/rebol-whitespacers) [[post](scripts/wspace/rebol-whitespacers/post.md)] - with manual rebasing
- [quine-relay-spoiler](https://github.com/thaliaarchi/quine-relay-spoiler) [[sh](scripts/quine-relay.sh)]
- [wspace/0qol-prime](https://github.com/wspace/0qol-prime) [[sh](scripts/wspace/0qol-prime.sh)] - with manual rewording
- [wspace/ilikepython256-whitespace-unc](https://github.com/wspace/ilikepython256-whitespace-unc) [[sh](scripts/wspace/ilikepython256-whitespace-unc.sh)] - with manual rebasing
- [wspace/keen-whitelie](https://github.com/wspace/keen-whitelie) [[sh](scripts/wspace/keen-whitelie.sh)] - with manual rebasing
- [wspace/pik4ez-ascii](https://github.com/wspace/pik4ez-ascii) [[sh](scripts/wspace/pik4ez-ascii.sh)] - with manual squashing
- wspace/programs [[sh](scripts/wspace/programs.sh)] - TODO collect programs from originating projects
- [wspace/ytaka-whitespace](https://github.com/wspace/ytaka-whitespace) [[sh](scripts/wspace/ytaka-whitespace.sh)]

## Converted from Mercurial

- [re1](https://github.com/thaliaarchi/re1-archive) [[sh](scripts/re1.sh)]

## Converted from SVN

- [cybf](https://github.com/thaliaarchi/cybf-archive) [[sh](scripts/cybis/cybf.sh)]
- [wspace/bearice-grassmudhorse](https://github.com/wspace/bearice-grassmudhorse) [[sh](scripts/wspace/bearice-grassmudhorse.sh)] - TODO include wiki and forks
- [wspace/cybis-hapyli](https://github.com/wspace/cybis-hapyli) [[sh](scripts/cybis/hapyli.sh)]
- wspace/kreutzer-spacedide [[sh](scripts/wspace/kreutzer-spacedide.sh)] - TODO
- [wspace/marktraceur-redlandside](https://github.com/wspace/marktraceur-redlandside) [[sh](scripts/wspace/marktraceur-redlandside.sh)]
- wspace/whitespacesdk - [TODO](https://code.google.com/archive/p/whitespacesdk/)

## Converted from CVS

- wspace/whitespaceide-java - TODO
