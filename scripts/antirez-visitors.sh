#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

commit_file() {
  local ident="$1" message="$2" url="$3"
  local filename="${url##*/}"
  git rm -q --ignore-unmatch "$filename"
  get_cached "$url"
  git add "$filename"
  commit "$ident" "$message" --trailer=Source:"$url"
}

expect_file() {
  local url="$1" path
  path="$(get_cached_path "$url")"
  diff "$path" "${url##*/}"
}

mkdir antirez-visitors
cd antirez-visitors

git init -q

# Project site: http://web.archive.org/web/20221105021137/http://www.hping.org/visitors/
# Current repo: https://github.com/antirez/visitors
#
# There are numerous forks of antirez/visitors on GitHub. In addition,
# https://github.com/moritz/visitors and https://github.com/xupefei/visitors
# start from Visitors 0.7, but do not share Git history.
# https://github.com/camilohe/visited is a project that uses Visitors as a base.
# No forks that I have checked have changed vi_match_len.

export AUTHOR='Salvatore Sanfilippo <antirez@invece.org>'

# Not all releases were archived. Fill in some gaps with changelogs.
commit_archive latest 'Visitors 0.2'            https://web.archive.org/web/20070318223258/http://www.hping.org:80/visitors/visitors-0.2.tar.gz
commit_file    latest 'Visitors 0.2a changelog' https://web.archive.org/web/20040529013204/http://www.hping.org:80/visitors/visitors_0.2a/Changelog
commit_file    latest 'Visitors 0.3a changelog' https://web.archive.org/web/20040605145301/http://www.hping.org:80/visitors/visitors_0.3a/Changelog
commit_file    latest 'Visitors 0.4 changelog'  https://web.archive.org/web/20041019060040/http://www.hping.org:80/visitors/visitors_0.4/Changelog
commit_file    latest 'Visitors 0.4a changelog' https://web.archive.org/web/20040925090153/http://www.hping.org:80/visitors/visitors_0.4a/Changelog
commit_archive latest 'Visitors 0.5'            https://web.archive.org/web/20051210050149/http://www.hping.org:80/visitors/visitors-0.5.tar.gz
commit_file    latest 'Visitors 0.5 changelog'  https://web.archive.org/web/20050507141459/http://www.hping.org:80/visitors/visitors_0.5/Changelog
commit_archive latest 'Visitors 0.6'            https://web.archive.org/web/20051221054302/http://www.hping.org:80/visitors/visitors-0.6.tar.gz
expect_file                                     https://web.archive.org/web/20051221060335/http://www.hping.org:80/visitors/visitors_0.6/Changelog
commit_archive latest 'Visitors 0.61'           https://web.archive.org/web/20060207122132/http://www.hping.org:80/visitors/visitors-0.61.tar.gz
expect_file                                     https://web.archive.org/web/20060101234727/http://www.hping.org:80/visitors/visitors_0.61/Changelog
commit_archive latest 'Visitors 0.7'            https://web.archive.org/web/20060614200041/http://www.hping.org:80/visitors/visitors-0.7.tar.gz
expect_file                                     https://web.archive.org/web/20060423131644/http://www.hping.org:80/visitors/visitors_0.7/Changelog

# Graft the newer changes from GitHub.
clone_submodule https://github.com/antirez/visitors github
cd github
git filter-repo --quiet \
  --commit-callback '
    commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: https://github.com/antirez/visitors/commit/" + commit.original_id + b"\n"
  '
git remote add visitors ..
git fetch -q visitors
# The initial commit is slightly modified from version 0.7, so graft instead of
# replace.
git replace --graft "$(git rev-list --max-parents=0 HEAD)" visitors/main
git filter-repo --quiet --force
cd ..

git remote add github ./github
git fetch -q github
git reset -q --hard github/master
git remote remove github
rm -rf github
