#!/bin/sh

wget https://web.archive.org/web/20030423000132/http://compsoc.dur.ac.uk/whitespace/whitespace.pl
git add whitespace.pl

GIT_AUTHOR_NAME='Michael Kölbl' \
GIT_COMMITTER_NAME='Michael Kölbl' \
GIT_AUTHOR_EMAIL='mrk21@infradead.org' \
GIT_COMMITTER_EMAIL='mrk21@infradead.org' \
GIT_AUTHOR_DATE='Tue, 01 Apr 2003 19:34:12 GMT' \
GIT_COMMITTER_DATE='Tue, 01 Apr 2003 19:34:12 GMT' \
git commit -m 'Contribute Whitespace interpreter in Perl

https://web.archive.org/web/20030423000132/http://compsoc.dur.ac.uk/whitespace/whitespace.pl'

wget https://raw.githubusercontent.com/hostilefork/whitespacers/1ae82eb716c65346a71aebf9f92d96872463f220/perl/whitespace.pl -O whitespace.pl
git add whitespace.pl

GIT_AUTHOR_NAME='Tommie Levy' \
GIT_COMMITTER_NAME='Tommie Levy' \
GIT_AUTHOR_EMAIL='thomas.a.levy@gmail.com' \
GIT_COMMITTER_EMAIL='thomas.a.levy@gmail.com' \
GIT_AUTHOR_DATE='Tue May 3 15:50:55 2016 -0400' \
GIT_COMMITTER_DATE='Tue May 3 15:50:55 2016 -0400' \
git commit -m 'Update perl to whitespace 0.3

https://github.com/hostilefork/whitespacers/pull/3/commits/1ae82eb716c65346a71aebf9f92d96872463f220'
