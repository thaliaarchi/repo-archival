#!/bin/bash -e

. base.sh

commit_wconrad() {
  GIT_AUTHOR_NAME='Wayne Conrad' GIT_AUTHOR_EMAIL='wconrad@yagni.com' GIT_AUTHOR_DATE="$1" \
  GIT_COMMITTER_NAME='Wayne Conrad' GIT_COMMITTER_EMAIL='wconrad@yagni.com' GIT_COMMITTER_DATE="$1" \
  git commit -q -m "$2"
}

mkdir -p wspace
cd wspace

mkdir wconrad-ruby
cd wconrad-ruby
git init -q

get_cached https://web.archive.org/web/20030723091413/http://www.yagni.com:80/whitespace/whitespace
chmod +x whitespace
git add whitespace
commit_wconrad '2003-04-02 05:28:47 +0000' 'Create Whitespace interpreter, written in Ruby

https://web.archive.org/web/20030723091413/http://www.yagni.com:80/whitespace/whitespace'

get_cached https://web.archive.org/web/20030723090505/http://www.yagni.com:80/whitespace/alphabet.wsa # 2003-04-02 05:39:27 +0000
get_cached https://web.archive.org/web/20030723085651/http://www.yagni.com:80/whitespace/alphabet.ws  # 2003-04-02 05:39:45 +0000
git add alphabet.wsa alphabet.ws
commit_wconrad '2003-04-02 05:39:45 +0000' 'Add test program that prints the alphabet

https://web.archive.org/web/20030723090505/http://www.yagni.com:80/whitespace/alphabet.wsa
https://web.archive.org/web/20030723085651/http://www.yagni.com:80/whitespace/alphabet.ws'

get_cached https://web.archive.org/web/20030723092231/http://www.yagni.com:80/whitespace/whitespace-asm
chmod +x whitespace-asm
git add whitespace-asm
commit_wconrad '2003-04-02 06:03:46 +0000' 'Create Whitespace assembler

https://web.archive.org/web/20030723092231/http://www.yagni.com:80/whitespace/whitespace-asm'

get_cached https://web.archive.org/web/20030828223646/http://yagni.com:80/whitespace/whitespace-disassem
chmod +x whitespace-disassem
git add whitespace-disassem
commit_wconrad '2003-04-04 06:32:01 +0000' 'Create Whitespace disassembler based on the interpreter

https://web.archive.org/web/20030828223646/http://yagni.com:80/whitespace/whitespace-disassem'

get_cached https://web.archive.org/web/20030801142603/http://yagni.com:80/whitespace/index.html
git add index.html
commit_wconrad '2003-04-04 07:19:23 +0000' 'Write index.html for site

https://web.archive.org/web/20030801142603/http://yagni.com:80/whitespace/index.html'

get_cached https://web.archive.org/web/20040704154750/http://yagni.com:80/whitespace/whitespace
chmod +x whitespace
git add whitespace
commit_wconrad '2004-05-01 16:16:24 +0000' 'Update to Ruby 1.8

https://web.archive.org/web/20040704154750/http://yagni.com:80/whitespace/whitespace'

get_cached https://web.archive.org/web/20110916112141/http://yagni.com:80/whitespace/whitespace-disassem
chmod +x whitespace-disassem
git add whitespace-disassem
commit_wconrad '2010-09-02 13:49:10 +0000' 'Parse numbers with to_i(2) instead of eval

https://web.archive.org/web/20110916112141/http://yagni.com:80/whitespace/whitespace-disassem'

get_cached https://raw.githubusercontent.com/hostilefork/whitespacers/c1895bcd955fc05413ddbfc0bad482f69e50a287/ruby/whitespace.rb
diff --ignore-space-change whitespace whitespace.rb # ignore added newline at end of file
rm whitespace.rb

get_cached https://raw.githubusercontent.com/hostilefork/whitespacers/4d8017cda77a4817f2a465acf2e23bee9ca4bcd6/ruby/whitespace.rb whitespace
chmod +x whitespace
git add whitespace
GIT_AUTHOR_NAME='Tommie Levy' GIT_AUTHOR_EMAIL='thomas.a.levy@gmail.com' GIT_AUTHOR_DATE='2016-05-03 15:50:41 -0400' \
GIT_COMMITTER_NAME='Tommie Levy' GIT_COMMITTER_EMAIL='thomas.a.levy@gmail.com' GIT_COMMITTER_DATE='2016-05-03 15:50:41 -0400' \
git commit -q -m 'Update ruby to whitespace 0.3 and newer ruby

Also add UTF-8 support

https://github.com/hostilefork/whitespacers/pull/3/commits/4d8017cda77a4817f2a465acf2e23bee9ca4bcd6'

git remote add origin https://github.com/wspace/wconrad-ruby
