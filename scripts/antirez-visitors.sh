#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

commit_file() {
  local message="$1" url="$2"
  local filename="${url##*/}"
  git rm -q --ignore-unmatch "$filename"
  get_cached "$url"
  git add "$filename"
  commit latest "$message" --trailer=Source:"$url"
}

expect_file() {
  local url="$1" path
  path="$(get_cached_path "$url")"
  diff "$path" "${url##*/}"
}

mkdir antirez-visitors
cd antirez-visitors

git init -q

# Project site:
# http://web.archive.org/web/20221105021137/http://www.hping.org/visitors/

export AUTHOR='Salvatore Sanfilippo <antirez@invece.org>'

# Not all releases were archived. Fill in some gaps with changelogs.
commit_archive 'Visitors 0.2'            https://web.archive.org/web/20070318223258/http://www.hping.org:80/visitors/visitors-0.2.tar.gz
commit_file    'Visitors 0.2a changelog' https://web.archive.org/web/20040529013204/http://www.hping.org:80/visitors/visitors_0.2a/Changelog
commit_file    'Visitors 0.3a changelog' https://web.archive.org/web/20040605145301/http://www.hping.org:80/visitors/visitors_0.3a/Changelog
commit_file    'Visitors 0.4 changelog'  https://web.archive.org/web/20041019060040/http://www.hping.org:80/visitors/visitors_0.4/Changelog
commit_file    'Visitors 0.4a changelog' https://web.archive.org/web/20040925090153/http://www.hping.org:80/visitors/visitors_0.4a/Changelog
commit_archive 'Visitors 0.5'            https://web.archive.org/web/20051210050149/http://www.hping.org:80/visitors/visitors-0.5.tar.gz
commit_file    'Visitors 0.5 changelog'  https://web.archive.org/web/20050507141459/http://www.hping.org:80/visitors/visitors_0.5/Changelog
commit_archive 'Visitors 0.6'            https://web.archive.org/web/20051221054302/http://www.hping.org:80/visitors/visitors-0.6.tar.gz
expect_file                              https://web.archive.org/web/20051221060335/http://www.hping.org:80/visitors/visitors_0.6/Changelog
commit_archive 'Visitors 0.61'           https://web.archive.org/web/20060207122132/http://www.hping.org:80/visitors/visitors-0.61.tar.gz
expect_file                              https://web.archive.org/web/20060101234727/http://www.hping.org:80/visitors/visitors_0.61/Changelog
commit_archive 'Visitors 0.7'            https://web.archive.org/web/20060614200041/http://www.hping.org:80/visitors/visitors-0.7.tar.gz
expect_file                              https://web.archive.org/web/20060423131644/http://www.hping.org:80/visitors/visitors_0.7/Changelog

# Found with https://github.com/search?q=vi_match_len&type=code

# First commit: 2009-12-01, probably 0.7
# Seems to be slightly ahead the version 0.7 in moritz and xupefei
git clone https://github.com/antirez/visitors antirez-visitors
# Continues Git history
git clone https://github.com/xlab/visitors xlab-visitors
# Identical history
git clone https://github.com/schollz/visitors schollz-visitors
# Identical history
git clone https://github.com/Cloudxtreme/visitors cloudxtreme-visitors

# Identical first commit contents
# First commit: 2010-05-13, version 0.7 (with two junk files)
git clone https://github.com/moritz/visitors moritz-visitors
# First commit: 2014-07-07, version 0.7
git clone https://github.com/xupefei/visitors xupefei-visitors

# A fork of visitors by Camilo E. Hidalgo Estevez
git clone https://github.com/camilohe/visited camilohe-visited
