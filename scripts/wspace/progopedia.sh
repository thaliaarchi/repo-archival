#!/bin/bash -e

. base.sh

# Revisions cannot be viewed on Progopedia, so only selected revisions
# are available through the Internet Archive.

commit_nickolas() {
  GIT_AUTHOR_NAME='Mariia Mykhailova' GIT_AUTHOR_EMAIL='michaylova@gmail.com' GIT_AUTHOR_DATE="$1" \
  GIT_COMMITTER_NAME='Mariia Mykhailova' GIT_COMMITTER_EMAIL='michaylova@gmail.com' GIT_COMMITTER_DATE="$2" \
  git commit -q -m "$3"
}

get_article() {
  local url="$1" filename="$2"
  curl --no-progress-meter "$url" |
    htmlq '#content > *' \
      -r '#editmenu, #comments, meta, br[style="clear: both;"]' \
      -o "$filename"
}

get_revisions() {
  local url="$1history/"
  curl --no-progress-meter "$url" | htmlq '#maintext > table' | html2md
}

mkdir -p wspace
cd wspace

mkdir progopedia
cd progopedia
git init -q

# 2010-09-14 18:31 Nickolas "New article."
# 2010-09-14 08:41 Nickolas "Changed text."
# 2010-09-14 18:47 Nickolas "Changed text."
get_article https://web.archive.org/web/20100918234350/http://progopedia.com:80/language/whitespace/ whitespace.html
git add whitespace.html
commit_nickolas '2010-09-14 18:31:00 +0000' '2010-09-14 18:47:00 +0000' \
'Whitespace: New article.

Whitespace: Changed text.

Whitespace: Changed text.

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
get_article https://web.archive.org/web/20101225071422/http://progopedia.com:80/language/whitespace/ whitespace.html
git add whitespace.html
commit_nickolas '2010-11-30 20:36:00 +0000' '2010-12-03 20:08:00 +0000' \
'Whitespace: Changed text.

Whitespace: Changed text.

Whitespace: Changed text.

Whitespace: Changed text.

Whitespace: Changed text.

Whitespace: Changed text.

Whitespace: Changed text.

Whitespace: Changed paradigms.

Whitespace: Changed text.

https://web.archive.org/web/20101225071422/http://progopedia.com:80/language/whitespace/'

# 2011-07-27 15:33 Nickolas "Changed text."
get_article https://web.archive.org/web/20110827074120/http://progopedia.com:80/language/whitespace/ whitespace.html
git add whitespace.html
commit_nickolas '2011-07-27 15:33:00 +0000' '2011-07-27 15:33:00 +0000' \
'Whitespace: Changed text.

https://web.archive.org/web/20110827074120/http://progopedia.com:80/language/whitespace/'

git remote add origin https://github.com/wspace/progopedia

# http://progopedia.com/implementation/whitespacers/
# 2010-09-14 18:53 Nickolas "New article."

# http://progopedia.com/version/whitespacers-ruby/
# 2010-09-14 18:56 Nickolas "New article."

# http://progopedia.com/example/hello-world/208/
# 2010-09-14 22:06 Nickolas "Changed text."
# 2010-09-14 11:45 Nickolas "New article."

# http://progopedia.com/example/factorial/222/
# http://progopedia.com/example/fibonacci/223/
# http://progopedia.com/example/factorial/222/
# http://progopedia.com/example/camelcase/352/

# http://progopedia.ru/language/whitespace/
# 2010-12-03 20:14 Nickolas "Новая статья."
# 2011-06-06 19:37 Nickolas "Изменен paradigms."
# 2011-10-03 23:59 kit      "Изменен text."

# http://progopedia.ru/implementation/esco-whitespace/
# http://progopedia.ru/implementation/whitespacers/
# http://progopedia.ru/version/whitespacers-ruby/
# http://progopedia.ru/example/hello-world/163/
# http://progopedia.ru/example/factorial/164/
# http://progopedia.ru/example/fibonacci/165/
# http://progopedia.ru/example/camelcase/390/
