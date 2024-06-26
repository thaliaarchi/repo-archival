#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

mkdir mrbubble-markov
cd mrbubble-markov
git init -q

# Last modified: 2007-02-25 00:14:15 +0000 GMT
# Contents:
# input.mkv   2007-02-24 21:56:34 +0000 UTC (or local?)
# markov.ws   2007-02-24 21:56:00 +0000 UTC (or local?)
# markov.wsa  2007-02-24 21:58:06 +0000 UTC (or local?)
# https://web.archive.org/web/20141011193203/http://compsoc.dur.ac.uk/archives/whitespace/attachments/20070224/2792d9db/markov.zip
unzip -q "$(get_cached_path 'https://web.archive.org/web/20141011193203/http://compsoc.dur.ac.uk/archives/whitespace/attachments/20070224/2792d9db/markov.zip')"

git add markov.ws markov.wsa input.mkv
commit 'Leonardo Mesquita <mrbolha@gmail.com> 2007-02-24 21:58:06 +0000' 'Create Markov Algorithm simulator

https://web.archive.org/web/20141011193203/http://compsoc.dur.ac.uk/archives/whitespace/attachments/20070224/2792d9db/markov.zip'

# Posted: 2007-02-25 00:14:11 +0000 GMT
# Sent: 2007-02-24, local time
# https://web.archive.org/web/20070830102217/http://compsoc.dur.ac.uk:80/archives/whitespace/2007-February/000054.html

# Posted: 2007-02-25 00:17:05 +0000 GMT
# https://web.archive.org/web/20070831081100/http://compsoc.dur.ac.uk:80/archives/whitespace/2007-February/000055.html
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
commit 'Leonardo Mesquita <mrbolha@gmail.com> 2007-02-25 00:14:11 +0000' 'Send to Whitespace mailing list

https://web.archive.org/web/20070830102217/http://compsoc.dur.ac.uk:80/archives/whitespace/2007-February/000054.html
https://web.archive.org/web/20070831081100/http://compsoc.dur.ac.uk:80/archives/whitespace/2007-February/000055.html'

git remote add origin https://github.com/wspace/mrbubble-markov
