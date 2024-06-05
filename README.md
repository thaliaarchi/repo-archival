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
- [wspace/meth0dz-c](https://github.com/wspace/meth0dz-c) - TODO automate
- [wspace/mrbubble-markov](https://github.com/wspace/mrbubble-markov) [[sh](scripts/wspace/mrbubble-markov.sh)]
- [wspace/mkoelbl-perl](https://github.com/wspace/mkoelbl-perl) [[sh](scripts/wspace/mkoelbl-perl.sh)]
- [wspace/peasley-cpp](https://github.com/wspace/peasley-cpp) - TODO automate
- [wspace/progopedia](https://github.com/wspace/progopedia) [[sh](scripts/wspace/progopedia.sh)] - TODO add all Whitespace pages
- wspace/rosettacode - TODO
- [wspace/smithers888-bluespace](https://github.com/wspace/smithers888-bluespace) [[sh](scripts/wspace/smithers888-bluespace.sh)]
- [wspace/stephenchappell-python](https://github.com/wspace/stephenchappell-python) [[sh](scripts/wspace/stephenchappell-python.sh)]
- [wspace/tetris](https://github.com/wspace/tetris) [[sh](scripts/wspace/pdewacht-tetris.sh)]
- [wspace/wconrad-ruby](https://github.com/wspace/wconrad-ruby) [[sh](scripts/wspace/wconrad-ruby.sh)]

## From archives

- decus-grep [[sh](scripts/regexp/decus-grep.sh)] - WIP
- [minecraft-papercraft-pig](https://github.com/thaliaarchi/minecraft-papercraft-pig) [[sh](scripts/minecraft/papercraft-pig.sh)]
- ms-dos [[sh](scripts/ms-dos.sh)] - WIP
- nand2tetris [[sh](scripts/nand2tetris.sh)] - WIP
- ncsa-httpd [[sh](scripts/ncsa-httpd.sh)]
- ncsa-mosaic [[sh](scripts/ncsa-mosaic.sh)]
- netscape-3.02 [[sh](scripts/netscape-3.02.sh)]
- snippets [[sh](scripts/snippets/archive.sh)] - [WIP](scripts/snippets/notes.md)
- software-foundations [[sh](scripts/software-foundations/get_versions.sh)] - WIP
- sortle [[sh](scripts/sortle.sh)]
- [wspace/burghard-wsa](https://github.com/wspace/burghard-wsa) [[sh](scripts/wspace/burghard.sh)]
- [wspace/burghard-wsintercpp](https://github.com/wspace/burghard-wsintercpp) [[sh](scripts/wspace/burghard.sh)]
- [wspace/burghard-wsinterws](https://github.com/wspace/burghard-wsinterws) [[sh](scripts/wspace/burghard.sh)]
- [wspace/nutcrack-whiteplanes](https://github.com/wspace/nutcrack-whiteplanes) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/phlip-pywhitespace](https://github.com/wspace/phlip-pywhitespace) - TODO automate
- [wspace/res0001-trans32](https://github.com/wspace/res0001-trans32) [[sh](scripts/wspace/res0001-trans32.sh)]
- [wspace/stellwag-wspacegen](https://github.com/wspace/stellwag-wspacegen) [[sh](scripts/wspace/stellwag-wspacegen.sh)]
- [wspace/stribb-debian](https://github.com/wspace/stribb-debian) [[sh](scripts/wspace/stribb-debian/archive.sh)]
- zeus [[sh](scripts/zeus.sh)] - WIP

## Extracted from git subtree

- regexp/plan9 [[sh](scripts/regexp/plan9.sh)]
- regexp/plan9port [[sh](scripts/regexp/plan9port.sh)]
- regexp/python [[sh](scripts/regexp/python-re.sh)]
- regexp/redis [[sh](scripts/regexp/redis.sh)]
- regexp/serenityos [[sh](scripts/regexp/serenityos.sh)]
- [wspace/0x0dea-lolcode](https://github.com/wspace/0x0dea-lolcode) [[sh](scripts/wspace/0x0dea-lolcode.sh)]
- [wspace/aniket965-hacktoberfest](https://github.com/wspace/aniket965-hacktoberfest) [[sh](scripts/wspace/aniket965-hacktoberfest.sh)]
- [wspace/emilbahnsen-assembler](https://github.com/wspace/emilbahnsen-assembler) [[sh](scripts/wspace/emilbahnsen-assembler.sh)]
- [wspace/hogelog-c](https://github.com/wspace/hogelog-c) [[sh](scripts/wspace/hogelog-c.sh)]
- [wspace/omurakazuaki-rust](https://github.com/wspace/omurakazuaki-rust) [[sh](scripts/wspace/omurakazuaki-rust.sh)]
- [wspace/qeedquan-go](https://github.com/wspace/qeedquan-go) [[sh](scripts/wspace/qeedquan-go/live.sh)]
- [wspace/shimo-yukicoder](https://github.com/wspace/shimo-yukicoder) [[sh](scripts/wspace/shimo-yukicoder.sh)]
- [wspace/wysang-java](https://github.com/wspace/wysang-java) [[sh](scripts/wspace/wysang-java.sh)]

## Cleaned git history

- [wspace/ssiegl-wsdebug](https://github.com/wspace/ssiegl-wsdebug) [[sh](scripts/wspace/ssiegl-wsdebug.sh)]

## Merged git histories

- [Andreal2000/WhitespaceEvaluator](https://github.com/Andreal2000/WhitespaceEvaluator) [[sh](scripts/wspace/andreal2000-scala.sh)]
- avmplus-pcre [[sh](scripts/regexp/avmplus-pcre.sh)]
- avmplus-pcre2 [[sh](scripts/regexp/avmplus-pcre2.sh)]
- [hostilefork/rebol-whitespacers](https://github.com/hostilefork/rebol-whitespacers) [[post](scripts/wspace/rebol-whitespacers/post.md)] - with manual rebasing
- inferno [[sh](scripts/inferno/archive.sh)]
- plan9port-graft [[sh](scripts/plan9port-graft.sh)] - manual
- [quine-relay-spoiler](https://github.com/thaliaarchi/quine-relay-spoiler) [[sh](scripts/quine-relay.sh)]
- [wspace/0qol-prime](https://github.com/wspace/0qol-prime) [[sh](scripts/wspace/0qol-prime.sh)] - with manual rewording
- [wspace/ilikepython256-whitespace-unc](https://github.com/wspace/ilikepython256-whitespace-unc) [[sh](scripts/wspace/ilikepython256-whitespace-unc.sh)] - with manual rebasing
- [wspace/keens-whitelie](https://github.com/wspace/keens-whitelie) [[sh](scripts/wspace/keens-whitelie.sh)] - with manual rebasing
- wspace/kspalaiologos-recreational [[dir](scripts/wspace/kspalaiologos-recreational/README.md)]
- [wspace/pik4ez-ascii](https://github.com/wspace/pik4ez-ascii) [[sh](scripts/wspace/pik4ez-ascii.sh)] - with manual squashing
- wspace/programs [[sh](scripts/wspace/programs.sh)] - TODO collect programs from originating projects
- [wspace/ytaka23-whitespace](https://github.com/wspace/ytaka23-whitespace) [[sh](scripts/wspace/ytaka23-whitespace.sh)]

## Restored from the Software Heritage archive

- [foones-cratylus](https://github.com/thaliaarchi/foones-cratylus) [[sh](scripts/foones/cratylus.sh)]
- [foones-eightfold](https://github.com/thaliaarchi/foones-eightfold) [[sh](scripts/foones/eightfold.sh)]
- minecraft/immibis-bearded-octo-nemesis [[sh](scripts/minecraft/immibis-bearded-octo-nemesis.sh)]
- [unity-termsofservice](https://github.com/thaliaarchi/unity-termsofservice) [[sh](scripts/unity-termsofservice.sh)]
- [wspace/lifthrasiir-esotope](https://github.com/wspace/lifthrasiir-esotope) [[sh](scripts/wspace/lifthrasiir-esotope.sh)]
- [wspace/lifthrasiir-esotope-ws](https://github.com/wspace/lifthrasiir-esotope-ws) [[sh](scripts/wspace/lifthrasiir-esotope-ws.sh)]
- [wspace/nutcrack-whiteplanes.cs](https://github.com/wspace/nutcrack-whiteplanes.cs) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/nutcrack-whiteplanes.fs](https://github.com/wspace/nutcrack-whiteplanes.fs) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/nutcrack-whiteplanes.jl](https://github.com/wspace/nutcrack-whiteplanes.jl) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/nutcrack-whiteplanes.js](https://github.com/wspace/nutcrack-whiteplanes.js) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/nutcrack-whiteplanes.php](https://github.com/wspace/nutcrack-whiteplanes.php) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/nutcrack-whiteplanes.py](https://github.com/wspace/nutcrack-whiteplanes.py) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/nutcrack-whiteplanes.r](https://github.com/wspace/nutcrack-whiteplanes.r) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/nutcrack-whiteplanes.rb](https://github.com/wspace/nutcrack-whiteplanes.rb) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/nutcrack-whiteplanes.swift](https://github.com/wspace/nutcrack-whiteplanes.swift) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- [wspace/nutcrack-whiteplanes.github.io](https://github.com/wspace/nutcrack-whiteplanes.github.io) [[sh](scripts/wspace/nutcrack-whiteplanes.sh)]
- wspace/qeedquan-go [[sh](scripts/wspace/qeedquan-go/swh.sh)] - WIP
- [wspace/remigascou-c](https://github.com/wspace/remigascou-c) [[sh](scripts/wspace/remigascou-c.sh)]

## Converted from Mercurial

- minecraft/cuchaz-mappings [[sh](scripts/minecraft/cuchaz-mappings.sh)]
- [regexp/re1](https://github.com/thaliaarchi/re1-archive) [[sh](scripts/regexp/re1.sh)]

## Converted from SVN

- [cybis/cybf](https://github.com/thaliaarchi/cybf-archive) [[sh](scripts/cybis/cybf.sh)]
- [wspace/bearice-grassmudhorse](https://github.com/wspace/bearice-grassmudhorse) [[sh](scripts/wspace/bearice-grassmudhorse.sh)] - TODO include wiki and forks
- [wspace/cybis-hapyli](https://github.com/wspace/cybis-hapyli) [[sh](scripts/cybis/hapyli.sh)]
- [wspace/kreutzer-spacedide](https://github.com/wspace/kreutzer-spacedide) [[sh](scripts/wspace/kreutzer-spacedide.sh)] - TODO include SourceForge README
- [wspace/marktraceur-redlandside](https://github.com/wspace/marktraceur-redlandside) [[sh](scripts/wspace/marktraceur-redlandside.sh)]
- [wspace/mash-whitespacesdk](https://github.com/wspace/mash-whitespacesdk) [[sh](scripts/wspace/mash-whitespacesdk.sh)]
- wspace/nicolasff-spacesharp - TODO convert SVN and join with git

## Converted from CVS

- phpicalendar [[sh](scripts/phpicalendar.sh)]
- slrn [[sh](scripts/jedsoft/slrn.sh)] - WIP
- sourcepuller [[sh](scripts/sourcepuller.sh)]
- trn [[sh](scripts/trn.sh)]
- wspace/buge-whitespaceide [[sh](scripts/wspace/buge-whitespaceide.sh)]
