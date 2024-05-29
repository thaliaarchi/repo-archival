#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

mkdir mkoelbl-perl
cd mkoelbl-perl
git init -q

get_cached https://web.archive.org/web/20030423000132/http://compsoc.dur.ac.uk:80/whitespace/whitespace.pl
git add whitespace.pl

commit 'Michael Kölbl <mrk21@infradead.org> 2003-04-01 19:34:12 +0000' 'Contribute Whitespace interpreter in Perl

https://web.archive.org/web/20030423000132/http://compsoc.dur.ac.uk:80/whitespace/whitespace.pl'

rm whitespace.pl
get_cached https://raw.githubusercontent.com/hostilefork/whitespacers/1ae82eb716c65346a71aebf9f92d96872463f220/perl/whitespace.pl
git add whitespace.pl

commit 'Tommie Levy <thomas.a.levy@gmail.com> 2016-05-03 15:50:55 -0400' 'Update perl to whitespace 0.3

https://github.com/hostilefork/whitespacers/pull/3/commits/1ae82eb716c65346a71aebf9f92d96872463f220'

git remote add origin https://github.com/wspace/mkoelbl-perl
