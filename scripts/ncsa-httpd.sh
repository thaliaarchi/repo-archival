#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# NCSA HTTPd is the project that Apache HTTP Server forked from.

# Time map:
#   curl 'https://web.archive.org/web/timemap/?url=ftp.ncsa.uiuc.edu/Web/httpd&matchType=prefix&output=json&collapse=digest&limit=1000' |
#   jq -r '.[] | select(.[4] == "226") | "https://web.archive.org/web/\(.[1])/\(.[2])"'

# TODO
# - Parse FTP directory listings to automate traversal of tree (see any
#   directory in the time map).
# - Clean up CVS metadata.
# - Check the other seemingly-redundant files in the FTP tree.
# - Include docs from separate archives.

mkdir ncsa-httpd
cd ncsa-httpd
git init -q

commit_archive() {
  local message="$1"
  local strip="$2"
  local url="$3"
  if [[ $strip = strip ]]; then
    strip=--strip-components=1
  else
    strip=
  fi
  git rm -rq --ignore-unmatch '*'
  tar xf "$(get_cached_path "$url")" $strip
  git add -Af
  # The name of the team and its email evolve throughout the versions. I use the
  # most consistent attribution.
  GIT_AUTHOR_NAME='The NCSA HTTPd Development Team' GIT_AUTHOR_EMAIL='httpd@ncsa.uiuc.edu' \
  GIT_COMMITTER_NAME='The NCSA HTTPd Development Team' GIT_COMMITTER_EMAIL='httpd@ncsa.uiuc.edu' \
  TZ=UTC tcommit -q -m "$message

Source: $url"
}

commit_archive 'NCSA HTTPd beta 0.5'      nostrip https://web.archive.org/web/20160611172535/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd-0.5/httpd0.5-src.tar.Z
commit_archive 'NCSA HTTPd 1.1'           strip   https://web.archive.org/web/20160611172542/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.1-nopatch/httpd_source.tar.Z
# TODO: Remove *.old and *~ files
commit_archive 'NCSA HTTPd 1.1 (patched)' strip   https://web.archive.org/web/20160611172539/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.1/httpd_source.tar.Z
commit_archive 'NCSA HTTPd 1.2'           strip   https://web.archive.org/web/20160611172547/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.2/httpd_source.tar.Z
commit_archive 'NCSA HTTPd 1.3'           strip   https://web.archive.org/web/20160611172550/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.3/httpd_source.tar.Z
commit_archive 'NCSA HTTPd 1.3R'          strip   https://web.archive.org/web/20160611172552/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.3R/httpd_source.tar.Z
commit_archive 'NCSA HTTPd 1.3R+'         strip   https://web.archive.org/web/20160611172554/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.3R+/httpd_1.3R+_source.tar.Z
commit_archive 'NCSA HTTPd 1.4.2'         strip   https://web.archive.org/web/20160619204306/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/httpd_1.4.2/httpd_1.4.2_source.tar.Z
commit_archive 'NCSA HTTPd 1.5.1'         strip   https://web.archive.org/web/20160619204337/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/httpd_1.5.1/httpd_1.5.1-export_source.tar.Z
commit_archive 'NCSA HTTPd 1.5.2a'        strip   https://web.archive.org/web/20160619204223/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/current/httpd_1.5.2a-export_source.tar.Z
