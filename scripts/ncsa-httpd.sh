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
# - Parse CVS metadata.
# - Check the other seemingly-redundant files in the FTP tree.
# - Include docs from separate archives.

# The name of the team and its email evolve throughout the versions. I use the
# most consistent attribution.
export AUTHOR='The NCSA HTTPd Development Team <httpd@ncsa.uiuc.edu>'

mkdir ncsa-httpd
cd ncsa-httpd
git init -q

# Remove backup versions of files that are identical to the previous revision.
delete_backup() {
  local filename="$1" backup_suffix="$2"
  diff <(git show HEAD~:"$filename") "$filename$backup_suffix"
  git rm -q "$filename$backup_suffix"
}

commit_archive latest 'NCSA HTTPd beta 0.5' --nostrip https://web.archive.org/web/20160611172535/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd-0.5/httpd0.5-src.tar.Z
# httpd_1.1-nopatch/src/Makefile~ is not in the previous version, so cannot be
# deleted, unless the history is made more granular.
commit_archive latest 'NCSA HTTPd 1.1'           https://web.archive.org/web/20160611172542/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.1-nopatch/httpd_source.tar.Z
commit_archive latest 'NCSA HTTPd 1.1 (patched)' https://web.archive.org/web/20160611172539/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.1/httpd_source.tar.Z
delete_backup src/http_alias.c .old
delete_backup src/httpd.h .old
delete_backup src/util.c .old
amend_no_edit
commit_archive latest 'NCSA HTTPd 1.2'           https://web.archive.org/web/20160611172547/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.2/httpd_source.tar.Z
commit_archive latest 'NCSA HTTPd 1.3'           https://web.archive.org/web/20160611172550/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.3/httpd_source.tar.Z
commit_archive latest 'NCSA HTTPd 1.3R'          https://web.archive.org/web/20160611172552/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.3R/httpd_source.tar.Z
find . -name CVS -exec git rm -rq {} +
amend_no_edit
commit_archive latest 'NCSA HTTPd 1.3R+'         https://web.archive.org/web/20160611172554/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/old/httpd_1.3R+/httpd_1.3R+_source.tar.Z
delete_backup cgi-src/imagemap.c '~'
amend_no_edit
commit_archive latest 'NCSA HTTPd 1.4.2'         https://web.archive.org/web/20160619204306/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/httpd_1.4.2/httpd_1.4.2_source.tar.Z
commit_archive latest 'NCSA HTTPd 1.5.1'         https://web.archive.org/web/20160619204337/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/httpd_1.5.1/httpd_1.5.1-export_source.tar.Z
commit_archive latest 'NCSA HTTPd 1.5.2a'        https://web.archive.org/web/20160619204223/ftp://ftp.ncsa.uiuc.edu/Web/httpd/Unix/ncsa_httpd/current/httpd_1.5.2a-export_source.tar.Z
