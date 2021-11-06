#!/bin/sh -e

# Revisions cannot be viewed on Progopedia, so only selected revisions
# are available through the Internet Archive.

git init progopedia
cd progopedia

# 2010-09-14 18:31 Nickolas "New article."
# 2010-09-14 08:41 Nickolas "Changed text."
# 2010-09-14 18:47 Nickolas "Changed text."
wget https://web.archive.org/web/20100918234350id_/http://progopedia.com:80/language/whitespace/ -O whitespace.html
git add whitespace.html
GIT_AUTHOR_NAME='Mariia Mykhailova' GIT_AUTHOR_EMAIL='michaylova@gmail.com' GIT_AUTHOR_DATE='2010-09-14 18:31:00 +0000' \
GIT_COMMITTER_NAME='Mariia Mykhailova' GIT_COMMITTER_EMAIL='michaylova@gmail.com' GIT_COMMITTER_DATE='2010-09-14 18:47:00 +0000' \
git commit -m 'New article.

Changed text.

Changed text.

https://web.archive.org/web/20100918234350/http://progopedia.com:80/language/whitespace/'

# 2010-11-30 20:36 Nickolas "Changed text."
# 2010-12-02 17:40 Nickolas "Changed text."
# 2010-12-02 17:40 Nickolas "Changed text."
# 2010-12-02 17:45 Nickolas "Changed text."
# 2010-12-02 17:54 Nickolas "Changed text."
# 2010-12-02 17:59 Nickolas "Changed text."
# 2010-12-02 18:54 Nickolas "Changed text."
# 2010-12-03 19:39 Nickolas "Changed paradigms."
# 2010-12-03 20:08 Nickolas "Changed text."
wget https://web.archive.org/web/20101225071422id_/http://progopedia.com:80/language/whitespace/ -O whitespace.html
git add whitespace.html
GIT_AUTHOR_NAME='Mariia Mykhailova' GIT_AUTHOR_EMAIL='michaylova@gmail.com' GIT_AUTHOR_DATE='2010-11-30 20:36:00 +0000' \
GIT_COMMITTER_NAME='Mariia Mykhailova' GIT_COMMITTER_EMAIL='michaylova@gmail.com' GIT_COMMITTER_DATE='2010-12-03 20:08:00 +0000' \
git commit -m 'Changed text.

Changed text.

Changed text.

Changed text.

Changed text.

Changed text.

Changed text.

Changed paradigms.

Changed text.

https://web.archive.org/web/20101225071422/http://progopedia.com:80/language/whitespace/'

# 2011-07-27 15:33 Nickolas "Changed text."
wget https://web.archive.org/web/20110827074120id_/http://progopedia.com:80/language/whitespace/ -O whitespace.html
git add whitespace.html
GIT_AUTHOR_NAME='Mariia Mykhailova' GIT_AUTHOR_EMAIL='michaylova@gmail.com' GIT_AUTHOR_DATE='2011-07-27 15:33:00 +0000' \
GIT_COMMITTER_NAME='Mariia Mykhailova' GIT_COMMITTER_EMAIL='michaylova@gmail.com' GIT_COMMITTER_DATE='2011-07-27 15:33:00 +0000' \
git commit -m 'Changed text.

https://web.archive.org/web/20110827074120/http://progopedia.com:80/language/whitespace/'

git remote add origin https://github.com/wspace/progopedia
