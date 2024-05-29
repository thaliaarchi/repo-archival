#!/bin/bash -e

. base.sh

STRIBB='Andrew Stribblehill <ads@debian.org>'
THALIA='Thalia Archibald <thalia@archibald.dev>'

commit_bin() {
  local ident="$1"
  local version="$2"
  local arch="$3"
  local url="$4"
  local msg="${msg:-"Binary-only non-maintainer upload for $arch; no source changes."}"
  local dir="whitespace_${version}/${arch}"

  ar -p "$(get_cached_path "$url")" control.tar.gz data.tar.gz | gunzip |
    gtar -ix ./control \
             ./usr/bin/wspace \
             ./usr/share/doc/whitespace/changelog.Debian.gz \
             ./usr/share/doc/whitespace/copyright \
             ./usr/share/man/man1/wspace.1.gz
  gunzip usr/share/doc/whitespace/changelog.Debian.gz usr/share/man/man1/wspace.1.gz
  mkdir -p "$dir" debian
  mv control usr/bin/wspace "$dir"
  mv usr/share/doc/whitespace/changelog.Debian debian/changelog
  mv usr/share/doc/whitespace/copyright usr/share/man/man1/wspace.1 debian/
  rm -r usr

  git add "$dir" debian/changelog
  commit "$ident" "$msg"
}

add_file() {
  local file="$2"
  local url="$3"
  mkdir -p "$(dirname "$file")"
  get_cached "$url" "$file"
  git add -f "$file"
}

apply_diff() {
  local url="$1"
  rm -rf debian
  mkdir debian
  gunzip -c "$(get_cached_path "$1")" | patch -s -d debian
  chmod +x debian/rules
  git add -f debian
}

merge_changelogs() {
  cd debian
  diff changelog.bak changelog > changelog.diff || :
  git checkout HEAD~ -- changelog
  patch -s changelog changelog.diff
  rm changelog.diff
  git add -f changelog
  GIT_COMMITTER_NAME="$(git show -s --format=%an)" \
  GIT_COMMITTER_EMAIL="$(git show -s --format=%ae)" \
  GIT_COMMITTER_DATE="$(git show -s --format=%ad)" \
  git commit -q --amend --no-edit
  cd ..
}

mkdir -p wspace
cd wspace
mkdir stribb-debian
cd stribb-debian
git init -q

add_file   '2003-03-31 13:35:20 +0100' COPYING                     https://web.archive.org/web/20030818001123/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/COPYING

add_file   '2003-03-31 15:04:14 +0100' debian/changelog            https://web.archive.org/web/20030827083557/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/changelog
add_file   '2003-03-31 15:04:14 +0100' debian/compat               https://web.archive.org/web/20030629104608/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/compat
add_file   '2003-03-31 15:04:14 +0100' debian/control              https://web.archive.org/web/20030629104803/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/control
add_file   '2003-03-31 15:04:14 +0100' debian/copyright            https://web.archive.org/web/20030629105053/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/copyright
add_file   '2003-03-31 15:20:33 +0100' debian/files                https://web.archive.org/web/20030827091055/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/files
add_file   '2003-03-31 15:04:14 +0100' debian/rules                https://web.archive.org/web/20030629110105/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/rules
add_file   '2003-03-31 15:04:14 +0100' debian/whitespace.examples  https://web.archive.org/web/20030629110008/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.examples
add_file   '2003-03-31 15:04:14 +0100' debian/whitespace.install   https://web.archive.org/web/20030629110020/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.install
add_file   '2003-03-31 15:04:14 +0100' debian/whitespace.manpages  https://web.archive.org/web/20030629110513/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.manpages
add_file   '2003-03-31 15:20:33 +0100' debian/whitespace.substvars https://web.archive.org/web/20030629110823/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/whitespace.substvars
add_file   '2003-03-31 15:04:14 +0100' debian/wspace.1             https://web.archive.org/web/20030629111334/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace-0.1/debian/wspace.1
# add_file '2003-03-31 15:19    +0100' debian/whitespace.docs      not archived
echo 'docs/*' > debian/whitespace.docs
git add debian/whitespace.docs

add_file   '2003-03-31 15:20:40 +0100' whitespace_0.1-1/whitespace_0.1-1.dsc https://web.archive.org/web/20030621215923/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1.dsc

# The dates of Andrew's releases are from the times recorded in the changelog.
msg='Initial packaging.' \
commit_bin "$STRIBB 2003-03-31 10:36:08 +0100" 0.1-1 i386 https://web.archive.org/web/20030803223310/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1_i386.deb

# Hypothesized
echo 'whitespace_0.2-1_i386.deb interpreters optional' > debian/files
git add debian/files

add_file   '2003-03-31 17:36:05 +0100' whitespace_0.2-1/whitespace_0.2-1.dsc https://web.archive.org/web/20040120123855/http://compsoc.dur.ac.uk:80/whitespace/whitespace_0.2-1.dsc

msg='New upstream release' \
commit_bin "$STRIBB 2003-03-31 17:33:02 +0100" 0.2-1 i386 https://web.archive.org/web/20030423000129/http://compsoc.dur.ac.uk:80/whitespace/whitespace_0.2-1_i386.deb

add_file   '2005-09-22 10:02:30 +0100' whitespace_0.3-1/whitespace_0.3-1.dsc http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1.dsc
apply_diff http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1.diff.gz

# The changelog records 2004-04-30 00:17:41 +0100 as the time for this release,
# but whitespace-mode.el was modified at 2004-05-04 17:35:24 +0100, so I use the
# modified time of changelog.Debian.gz.
msg='New upstream release. Patch to fact.ws closes #246309.

Rebuild against ghc6 since it exists on multiple architectures. Closes
#246569.' \
commit_bin "$STRIBB 2004-05-05 10:28:21 +0100" 0.3-1 i386 http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1_i386.deb

# I use the modified time of changelog.Debian.gz for automated releases, to
# match the pattern of the 0.3-2+b1 binaries. These author names and messages
# are inferred.
commit_bin 'hppa Build Daemon <>          2004-05-06 10:52:03 +0000' 0.3-1 hppa          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1_hppa.deb
commit_bin 'powerpc Build Daemon <>       2004-05-06 11:26:28 +0000' 0.3-1 powerpc       http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1_powerpc.deb
commit_bin 'alpha Build Daemon <>         2004-05-06 21:30:14 +0000' 0.3-1 alpha         http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1_alpha.deb
commit_bin 'm68k Build Daemon <>          2004-05-08 07:08:26 +0000' 0.3-1 m68k          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1_m68k.deb
commit_bin 's390 Build Daemon <>          2004-05-10 06:51:09 +0000' 0.3-1 s390          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1_s390.deb
commit_bin 'ia64 Build Daemon <>          2004-05-19 14:45:34 +0000' 0.3-1 ia64          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1_ia64.deb
commit_bin 'amd64 Build Daemon <>         2004-06-07 14:24:05 +0000' 0.3-1 amd64         http://archive.debian.org/debian-amd64/pool/main/w/whitespace/whitespace_0.3-1_amd64.deb
commit_bin 'sparc Build Daemon <>         2004-06-21 16:42:51 +0000' 0.3-1 sparc         http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1_sparc.deb
commit_bin 'mips Build Daemon <>          2004-08-16 18:53:18 +0000' 0.3-1 mips          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-1_mips.deb

add_file   '2005-09-22 10:02:30 +0100' whitespace_0.3-2/whitespace_0.3-2.dsc http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2.dsc
apply_diff http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2.diff.gz

msg='Rebuild again for the C++ ABI change (closes #329277).' \
commit_bin "$STRIBB 2005-09-21 18:04:51 +0100" 0.3-2 i386 http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_i386.deb

commit_bin 'powerpc Build Daemon <>       2005-09-22 09:10:56 +0000' 0.3-2 powerpc       http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_powerpc.deb
commit_bin 'alpha Build Daemon <>         2005-09-22 09:13:34 +0000' 0.3-2 alpha         http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_alpha.deb
commit_bin 's390 Build Daemon <>          2005-09-22 10:44:47 +0000' 0.3-2 s390          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_s390.deb
commit_bin 'm68k Build Daemon <>          2005-09-22 12:44:40 +0000' 0.3-2 m68k          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_m68k.deb
commit_bin 'sparc Build Daemon <>         2005-09-24 02:09:04 +0000' 0.3-2 sparc         http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_sparc.deb
commit_bin 'ia64 Build Daemon <>          2005-09-25 12:29:29 +0000' 0.3-2 ia64          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_ia64.deb
commit_bin 'hppa Build Daemon <>          2005-09-28 07:56:26 +0000' 0.3-2 hppa          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_hppa.deb
commit_bin 'kfreebsd-i386 Build Daemon <> 2005-10-02 05:59:30 +0000' 0.3-2 kfreebsd-i386 https://snapshot.debian.org/archive/debian-ports/20081002T000000Z/pool-kfreebsd-i386/main/w/whitespace/whitespace_0.3-2_kfreebsd-i386.deb
commit_bin 'amd64 Build Daemon <>         2006-03-22 16:36:08 +0000' 0.3-2 amd64         http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_amd64.deb
commit_bin 'mips Build Daemon <>          2006-10-17 15:14:43 +0000' 0.3-2 mips          http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_mips.deb
commit_bin 'mipsel Build Daemon <>        2006-10-23 23:08:42 +0000' 0.3-2 mipsel        http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_mipsel.deb
commit_bin 'arm Build Daemon <>           2006-11-04 21:33:16 +0000' 0.3-2 arm           http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_arm.deb
commit_bin 'hurd-i386 Build Daemon <>     2007-01-19 14:51:39 +0000' 0.3-2 hurd-i386     https://snapshot.debian.org/archive/debian/20070120T000000Z/pool/main/w/whitespace/whitespace_0.3-2_hurd-i386.deb
commit_bin 'armel Build Daemon <>         2008-01-06 06:40:11 +0000' 0.3-2 armel         http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2_armel.deb

cp debian/changelog{,.bak}

# These dates and authors are as recorded in the changelog.
msg='Binary-only non-maintainer upload for amd64; no source changes.

Build against new version of ghc6 6.8.2dfsg1-1.1.' \
commit_bin 'amd64 Build Daemon (brahms) <buildd_amd64-brahms@buildd.debian.org> 2009-12-31 17:55:20 +0000' 0.3-2+b1 amd64 http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2+b1_amd64.deb

msg='Binary-only non-maintainer upload for ia64; no source changes.

Build against new version of ghc6 6.8.2dfsg1-1.1.' \
commit_bin 'Debian/IA64 Build Daemon <buildd@mundy.debian.org> 2009-12-31 20:16:55 +0000' 0.3-2+b1 ia64 http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2+b1_ia64.deb
merge_changelogs

msg='Binary-only non-maintainer upload for alpha; no source changes.

Build against new version of ghc6 6.8.2dfsg1-1.1.' \
commit_bin 'alpha Build Daemon (goetz) <buildd_alpha-goetz@buildd.debian.org> 2009-12-31 22:22:51 +0000' 0.3-2+b1 alpha http://archive.debian.org/debian/pool/main/w/whitespace/whitespace_0.3-2+b1_alpha.deb
merge_changelogs

rm debian/changelog.bak

cp ../../../files/wspace/stribb-debian/README.md .
git add README.md
commit "$THALIA 2023-03-29 20:31:15 -0600" 'Add README.md with archive information'

cp -R ../../../files/wspace/stribb-debian/ .
git add -Af
commit "$THALIA 2023-03-29 22:18:44 -0600" 'Update to modern Debian and Haskell'

git remote add origin https://github.com/wspace/stribb-debian
