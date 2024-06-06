#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir antirez-visitors
cd antirez-visitors

# Found with https://github.com/search?q=vi_match_len&type=code

# http://web.archive.org/web/20221105021137/http://www.hping.org/visitors/

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
