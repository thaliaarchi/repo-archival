#!/bin/bash -e

. base.sh

git init pdewacht-tetris
cd pdewacht-tetris

# Last modified: 2008-01-02 23:14:30 +0000 GMT
# Contents:
# tetris.ws  2008-01-02 22:59:54 +0000 UTC (or local?)
wget https://web.archive.org/web/20150817151110id_/http://compsoc.dur.ac.uk/archives/whitespace/attachments/20080103/20651c47/attachment.zip
unzip attachment.zip

# Posted: 2008-01-02 23:14:16 +0000 GMT
# https://web.archive.org/web/20141011193149/http://compsoc.dur.ac.uk/archives/whitespace/2008-January/000067.html
cat <<EOF > README
Tetris (because every language needs one)

Just a tetris game. There's no timer, so blocks don't drop
automatically. (So it's a pretty easy game.) Best results if you
prepare your terminal with "stty raw -echo".

Keys:
 j - move left
 k - drop
 l - move right
 i - rotate
 esc - quit
EOF

git add tetris.ws README
GIT_AUTHOR_NAME='Peter De Wachter' GIT_AUTHOR_EMAIL='pdewacht@gmail.com' GIT_AUTHOR_DATE='2008-01-02 22:59:54 +0000' \
GIT_COMMITTER_NAME='Peter De Wachter' GIT_COMMITTER_EMAIL='pdewacht@gmail.com' GIT_COMMITTER_DATE='2008-01-02 22:59:54 +0000' \
git commit -m 'Implement Tetris in Whitespace

https://web.archive.org/web/20141011193149/http://compsoc.dur.ac.uk/archives/whitespace/2008-January/000067.html
https://web.archive.org/web/20150817151110/http://compsoc.dur.ac.uk/archives/whitespace/attachments/20080103/20651c47/attachment.zip'

# Posted: 2009-09-25 16:00:11 +0000
# Edited: 2009-09-25 17:00:11 +0000
# https://www.reddit.com/r/programming/comments/9nw1e/most_unreadable_programming_language_ever/c0dkzzw/

git remote add origin https://github.com/wspace/tetris
