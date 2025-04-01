# Inferno

Vita Nuova distributes Inferno. This page links to four snapshots on Bitbucket
and two archives with Mercurial history and untracked binaries. The quotes below
come from this page.

https://www.vitanuova.com/inferno/downloads.html

## Inferno First Edition

### Inferno 1.0 Build 1

https://github.com/inferno-os/inferno-1e0 (identical mirror)
https://bitbucket.org/inferno-os/inferno-1e0/

> a beta 1997 release of Inferno 1.0 Build 1 from Lucent's Inferno Business Unit
> - no non-Limbo source (they didn't include it)
> - no Plan 9 support
> - `Distributed Sports Program' demo (with source and images)

### BETA.2 Build 16

https://github.com/inferno-os/inferno-1e1 (identical mirror)
https://bitbucket.org/inferno-os/inferno-1e1/

> Vita Nuova's modified copy of `BETA.2 Build 16' from Lucent's Inferno Business
> Unit
> - includes source
> - the tree was received in 1996 but this snapshot includes changes made by VN
>   and others into 1997

## Inferno Second Edition

https://github.com/inferno-os/inferno-2e (identical mirror)
https://bitbucket.org/inferno-os/inferno-2e/

> Inferno Second Edition: last distribution (Release 2.3, ca. July 1999) from
> Lucent's Inferno Business Unit, including source
> - no manual pages?? exactly.
> - the documents are not included; they were in Framemaker format on Nt or
>   Solaris

## Inferno Third Edition

https://github.com/inferno-os/inferno-3e (identical mirror)
https://bitbucket.org/inferno-os/inferno-3e/

> source-only distribution of the last Inferno Third Edition (20030603)

## Inferno Fourth Edition

### 2015-03-28 Mercurial clone (Unix)

> Unix-like systems
> (FreeBSD, Linux, MacOS X, Plan 9)
>
> A snapshot of the complete source tree, including executables such as mk for
> its reconstruction and the full set of fonts, is available as a gzip'd tar
> file inferno-20150328.tgz. Download and unpack the archive; note that the
> contents of the archive is rooted at inferno. There are installation
> instructions in the file INSTALL. It tells how to change mkconfig and set your
> path or PATH to the right bin directory before you can remake the tree using
> mk.

https://www.vitanuova.com/dist/4e/inferno-20150328.tgz

### Mercurial clone (Windows)

> Windows 2000, XP, and 7
>
> A snapshot of the complete source tree, including executables such as mk for
> its reconstruction, the full set of fonts, and pre-compiled Windows
> executables and libraries is available from this Vita Nuova site as a ZIP
> archive inferno.zip. The archive contains a single folder inferno which
> contains the Inferno distribution (and executables etc.) including the
> Mercurial repository.

https://www.vitanuova.com/dist/4e/inferno.zip

### Mercurial repository

https://bitbucket-archive.softwareheritage.org/projects/in/inferno-os/inferno-os-hg.html
https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/inferno-os/inferno-os-hg

Git [inferno-os](https://github.com/inferno-os/inferno-os) continues from
Mercurial [inferno-os-hg](https://bitbucket.org/inferno-os/inferno-os-hg) on
[2019-09-19](https://github.com/inferno-os/inferno-os/commit/3f3faa9d79b4d286ade6deb914a16ca715361a05),
and contains all of its history. The tags were not pushed, but they are just
redundant dates. It was converted using [hg-fast-export](https://github.com/frej/fast-export),
or a tool that produces equivalent output.

### Current repository

https://github.com/inferno-os/inferno-os (current)
https://bitbucket.org/inferno-os/inferno-os/ (old)

The Bitbucket repo used to be the main source, but development seems to now have
switched to GitHub. The last common commit was on 2021-10-11 and any commits
after that on Bitbucket are cherry-picked from GitHub.

## Miscellaneous

Miscellaneous repos, that are not on both forges:

- https://bitbucket.org/inferno-os/java2dis/: Java class file execution in
  Inferno's Dis VM
- https://bitbucket.org/inferno-os/browser-plugin/: Inferno as an old IE
  browser plugin
- https://bitbucket.org/inferno-os/owen/: Computational grid
- https://github.com/inferno-os/ventivac: Venti components for Inferno (GSoC)
- https://bitbucket.org/inferno-os/inferno64-os/: History is fully included in
  inferno-os/inferno-os, so it seems to serve no purpose

## Inferno port to Raspberry Pi

- Bitbucket:
  - https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/infpi/inferno-rpi
  - https://bitbucket-archive.softwareheritage.org/projects/in/infpi/inferno-rpi.html
- Google Code:
  - https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://inferno-rpi.googlecode.com/hg/
- beta1:
  - https://web.archive.org/web/20231001113905/http://lynxline.com/inferno-raspberry-pi-image-beta1/
  - https://web.archive.org/web/20140514235709/http://tor.lynxline.com/inferno-raspberry-pi-beta1.img.zip
