#!/bin/sh

git init

# Last modified: 2007-02-25 00:14:15 +0000 GMT
# Contents:
# input.mkv   2007-02-24 21:56:34 +0000 UTC (or local?)
# markov.ws   2007-02-24 21:56:00 +0000 UTC (or local?)
# markov.wsa  2007-02-24 21:58:06 +0000 UTC (or local?)
# https://web.archive.org/web/20141011193203/http://compsoc.dur.ac.uk/archives/whitespace/attachments/20070224/2792d9db/markov.zip
wget 'https://web.archive.org/web/20141011193203id_/http://compsoc.dur.ac.uk/archives/whitespace/attachments/20070224/2792d9db/markov.zip'
unzip markov.zip

git add markov.ws markov.wsa input.mkv
GIT_AUTHOR_DATE='2007-02-24 21:58:06 +0000' GIT_COMMITTER_DATE='2007-02-24 21:58:06 +0000' \
GIT_AUTHOR_NAME='Leonardo Mesquita' GIT_COMMITTER_NAME='Leonardo Mesquita' \
GIT_AUTHOR_EMAIL='mrbolha@gmail.com' GIT_COMMITTER_EMAIL='mrbolha@gmail.com' \
git commit -m 'Create Markov Algorithm simulator

https://web.archive.org/web/20141011193203/http://compsoc.dur.ac.uk/archives/whitespace/attachments/20070224/2792d9db/markov.zip'

# Posted: 2007-02-25 00:14:11 +0000 GMT
# Sent: 2007-02-24, local time
# https://web.archive.org/web/20070830102217/http://compsoc.dur.ac.uk/archives/whitespace/2007-February/000054.html

# Posted: 2007-02-25 00:17:05 +0000 GMT
# https://web.archive.org/web/20070831081100/http://compsoc.dur.ac.uk/archives/whitespace/2007-February/000055.html
cat <<EOF > README
Hello!

I have developed a Markov Algorithm simulator in Whitespace.
Since Markov Algorithms are Turing-complete, I belive this proves that
Whitespace is also Turing-complete :-)
I'm sending an attached zip file containing:
   * The commented source code in "Whitespace assembly"
   * The WS that was generated from this assebly
   * An input file that contains a Markov Algorithm set of rules to test
if a string containing only "a" and "b" is a palindrome.

Cheers,
Leonardo Mesquita
EOF

git add README
GIT_AUTHOR_DATE='2007-02-25 00:14:11 +0000' GIT_COMMITTER_DATE='2007-02-25 00:14:11 +0000' \
GIT_AUTHOR_NAME='Leonardo Mesquita' GIT_COMMITTER_NAME='Leonardo Mesquita' \
GIT_AUTHOR_EMAIL='mrbolha@gmail.com' GIT_COMMITTER_EMAIL='mrbolha@gmail.com' \
git commit -m 'Send to Whitespace mailing list

https://web.archive.org/web/20070830102217/http://compsoc.dur.ac.uk/archives/whitespace/2007-February/000054.html
https://web.archive.org/web/20070831081100/http://compsoc.dur.ac.uk/archives/whitespace/2007-February/000055.html'
