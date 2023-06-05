#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

mkdir mkoelbl-perl
cd mkoelbl-perl
git init -q

get_cached https://web.archive.org/web/20030423000132/http://compsoc.dur.ac.uk:80/whitespace/whitespace.pl
git add whitespace.pl

GIT_AUTHOR_DATE='2003-04-01 19:34:12 +0000' GIT_COMMITTER_DATE='2003-04-01 19:34:12 +0000' \
git -c user.name='Michael Kölbl' -c user.email='mrk21@infradead.org' commit -q -m 'Contribute Whitespace interpreter in Perl

https://web.archive.org/web/20030423000132/http://compsoc.dur.ac.uk:80/whitespace/whitespace.pl'

get_cached https://raw.githubusercontent.com/hostilefork/whitespacers/1ae82eb716c65346a71aebf9f92d96872463f220/perl/whitespace.pl
git add whitespace.pl

GIT_AUTHOR_DATE='2016-05-03 15:50:55 -0400' GIT_COMMITTER_DATE='2016-05-03 15:50:55 -0400' \
git -c user.name='Tommie Levy' -c user.email='thomas.a.levy@gmail.com' commit -q -m 'Update perl to whitespace 0.3

https://github.com/hostilefork/whitespacers/pull/3/commits/1ae82eb716c65346a71aebf9f92d96872463f220'

git remote add origin https://github.com/wspace/mkoelbl-perl
