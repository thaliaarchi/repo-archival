#!/bin/bash -e

. base.sh

commit_bin() {
  local date="$1"
  local version="$2"
  local arch="$3"
  local author="${4:-"$arch Build Daemon"}"
  local email="$5"
  local url="$6"
  local msg="${msg:-"Binary-only non-maintainer upload for $arch; no source changes."}"

  ar -p "$(get_cached_path "$url")" data.tar.gz | gunzip | tar -x usr/bin/wspace
  mkdir -p bin
  mv usr/bin/wspace "bin/wspace_${version}_${arch}"
  rm -r usr

  git add bin
  GIT_AUTHOR_NAME="$author" GIT_AUTHOR_EMAIL="$email" GIT_AUTHOR_DATE="$date" \
  GIT_COMMITTER_NAME="$author" GIT_COMMITTER_EMAIL="$email" GIT_COMMITTER_DATE="$date" \
  git commit -q -m "$msg"
}

mkdir -p wspace
cd wspace
mkdir stribb-debian
cd stribb-debian
git init -q

# get_cached https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1.diff.gz
# get_cached https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1.dsc
# get_cached https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3.orig.tar.gz

# get_cached https://snapshot.debian.org/archive/debian/20050923T000000Z/pool/main/w/whitespace/whitespace_0.3-2.diff.gz
# get_cached https://snapshot.debian.org/archive/debian/20050923T000000Z/pool/main/w/whitespace/whitespace_0.3-2.dsc
# get_cached https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3.orig.tar.gz

diff "$(get_cached_path https://web.archive.org/web/20030423000129/http://compsoc.dur.ac.uk:80/whitespace/whitespace_0.2-1_i386.deb)" \
     "$(get_cached_path https://web.archive.org/web/20040325164055/http://mirror.ox.ac.uk:80/Mirrors/whitespace/whitespace_0.2-1_i386.deb)"

# The dates of Andrew's releases are from the times recorded in the changelog.
msg='Initial packaging.' \
commit_bin '2003-03-31 10:36:08 +0100' 0.1-1    i386          'Andrew Stribblehill'         'ads@debian.org'                        https://web.archive.org/web/20030803223310/http://www.dur.ac.uk:80/d.j.walrond/whitespace/whitespace_0.1-1_i386.deb

msg='New upstream release' \
commit_bin '2003-03-31 17:33:02 +0100' 0.2-1    i386          'Andrew Stribblehill'         'ads@debian.org'                        https://web.archive.org/web/20030423000129/http://compsoc.dur.ac.uk:80/whitespace/whitespace_0.2-1_i386.deb

# The changelog records 2004-04-30 00:17:41 +0100 as the time for this release,
# but whitespace-mode.el was modified at 2004-05-04 17:35:24 +0100, so I use the
# modified time of changelog.Debian.gz.
msg='New upstream release. Patch to fact.ws closes #246309.

Rebuild against ghc6 since it exists on multiple architectures. Closes
#246569.' \
commit_bin '2004-05-05 10:28:21 +0100' 0.3-1    i386          'Andrew Stribblehill'         'ads@debian.org'                        https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1_i386.deb

# I use the modified time of changelog.Debian.gz for automated releases, to
# match the pattern of the 0.3-2+b1 binaries. These author names and messages
# are inferred.
commit_bin '2004-05-06 10:52:03 UTC'   0.3-1    hppa          ''                            ''                                      https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1_hppa.deb
commit_bin '2004-05-06 11:26:28 UTC'   0.3-1    powerpc       ''                            ''                                      https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1_powerpc.deb
commit_bin '2004-05-06 21:30:14 UTC'   0.3-1    alpha         ''                            ''                                      https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1_alpha.deb
commit_bin '2004-05-08 07:08:26 UTC'   0.3-1    m68k          ''                            ''                                      https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1_m68k.deb
commit_bin '2004-05-10 06:51:09 UTC'   0.3-1    s390          ''                            ''                                      https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1_s390.deb
commit_bin '2004-05-19 14:45:34 UTC'   0.3-1    ia64          ''                            ''                                      https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1_ia64.deb
commit_bin '2004-06-07 14:24:05 UTC'   0.3-1    amd64         ''                            ''                                      https://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian-amd64/pool/main/w/whitespace/whitespace_0.3-1_amd64.deb
commit_bin '2004-06-21 16:42:51 UTC'   0.3-1    sparc         ''                            ''                                      https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1_sparc.deb
commit_bin '2004-08-16 18:53:18 UTC'   0.3-1    mips          ''                            ''                                      https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/whitespace/whitespace_0.3-1_mips.deb

msg='Rebuild again for the C++ ABI change (closes #329277).' \
commit_bin '2005-09-21 18:04:51 +0100' 0.3-2    i386          'Andrew Stribblehill'         'ads@debian.org'                        https://snapshot.debian.org/archive/debian/20050923T000000Z/pool/main/w/whitespace/whitespace_0.3-2_i386.deb

commit_bin '2005-09-22 09:10:56 UTC'   0.3-2    powerpc       ''                            ''                                      https://snapshot.debian.org/archive/debian/20050923T000000Z/pool/main/w/whitespace/whitespace_0.3-2_powerpc.deb
commit_bin '2005-09-22 09:13:34 UTC'   0.3-2    alpha         ''                            ''                                      https://snapshot.debian.org/archive/debian/20050923T000000Z/pool/main/w/whitespace/whitespace_0.3-2_alpha.deb
commit_bin '2005-09-22 10:44:47 UTC'   0.3-2    s390          ''                            ''                                      https://snapshot.debian.org/archive/debian/20050924T000000Z/pool/main/w/whitespace/whitespace_0.3-2_s390.deb
commit_bin '2005-09-22 12:44:40 UTC'   0.3-2    m68k          ''                            ''                                      https://snapshot.debian.org/archive/debian/20050923T000000Z/pool/main/w/whitespace/whitespace_0.3-2_m68k.deb
commit_bin '2005-09-24 02:09:04 UTC'   0.3-2    sparc         ''                            ''                                      https://snapshot.debian.org/archive/debian/20050930T000000Z/pool/main/w/whitespace/whitespace_0.3-2_sparc.deb
commit_bin '2005-09-25 12:29:29 UTC'   0.3-2    ia64          ''                            ''                                      https://snapshot.debian.org/archive/debian/20050928T000000Z/pool/main/w/whitespace/whitespace_0.3-2_ia64.deb
commit_bin '2005-09-28 07:56:26 UTC'   0.3-2    hppa          ''                            ''                                      https://snapshot.debian.org/archive/debian/20051001T000000Z/pool/main/w/whitespace/whitespace_0.3-2_hppa.deb
commit_bin '2005-10-02 05:59:30 UTC'   0.3-2    kfreebsd-i386 ''                            ''                                      https://snapshot.debian.org/archive/debian-ports/20081002T000000Z/pool-kfreebsd-i386/main/w/whitespace/whitespace_0.3-2_kfreebsd-i386.deb
commit_bin '2006-03-22 16:36:08 UTC'   0.3-2    amd64         ''                            ''                                      https://snapshot.debian.org/archive/debian/20060323T000000Z/pool/main/w/whitespace/whitespace_0.3-2_amd64.deb
commit_bin '2006-10-17 15:14:43 UTC'   0.3-2    mips          ''                            ''                                      https://snapshot.debian.org/archive/debian/20061021T000000Z/pool/main/w/whitespace/whitespace_0.3-2_mips.deb
commit_bin '2006-10-23 23:08:42 UTC'   0.3-2    mipsel        ''                            ''                                      https://snapshot.debian.org/archive/debian/20061025T000000Z/pool/main/w/whitespace/whitespace_0.3-2_mipsel.deb
commit_bin '2006-11-04 21:33:16 UTC'   0.3-2    arm           ''                            ''                                      https://snapshot.debian.org/archive/debian/20061106T000000Z/pool/main/w/whitespace/whitespace_0.3-2_arm.deb
commit_bin '2007-01-19 14:51:39 UTC'   0.3-2    hurd-i386     ''                            ''                                      https://snapshot.debian.org/archive/debian/20070120T000000Z/pool/main/w/whitespace/whitespace_0.3-2_hurd-i386.deb
commit_bin '2008-01-06 06:40:11 UTC'   0.3-2    armel         ''                            ''                                      https://snapshot.debian.org/archive/debian/20080209T000000Z/pool/main/w/whitespace/whitespace_0.3-2_armel.deb

# These dates and authors are as recorded in the changelog.
msg='Binary-only non-maintainer upload for amd64; no source changes.

Build against new version of ghc6 6.8.2dfsg1-1.1.' \
commit_bin '2009-12-31 17:55:20 UTC'   0.3-2+b1 amd64         'amd64 Build Daemon (brahms)' 'buildd_amd64-brahms@buildd.debian.org' https://snapshot.debian.org/archive/debian/20100103T050638Z/pool/main/w/whitespace/whitespace_0.3-2%2Bb1_amd64.deb

msg='Binary-only non-maintainer upload for ia64; no source changes.

Build against new version of ghc6 6.8.2dfsg1-1.1.' \
commit_bin '2009-12-31 20:16:55 UTC'   0.3-2+b1 ia64          'Debian/IA64 Build Daemon'    'buildd@mundy.debian.org'               https://snapshot.debian.org/archive/debian/20100103T050638Z/pool/main/w/whitespace/whitespace_0.3-2%2Bb1_ia64.deb

msg='Binary-only non-maintainer upload for alpha; no source changes.

Build against new version of ghc6 6.8.2dfsg1-1.1.' \
commit_bin '2009-12-31 22:22:51 UTC'   0.3-2+b1 alpha         'alpha Build Daemon (goetz)'  'buildd_alpha-goetz@buildd.debian.org'  https://snapshot.debian.org/archive/debian/20100103T050638Z/pool/main/w/whitespace/whitespace_0.3-2%2Bb1_alpha.deb
