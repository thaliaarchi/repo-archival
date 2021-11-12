#!/bin/sh -e

git clone https://github.com/wysang/Whitespace-Compiler wysang-java
cd wysang-java

# Remove commit that adds 8.6MiB "Pragmatic.The Definitive ANTLR 4 Reference.2013.pdf"
git reset --hard HEAD~

git rm '*.class' WSLexer.java WSLexer.tokens
git commit -m 'Remove .class files and old generated lexer'

git branch -m master main
git remote set-url origin https://github.com/wspace/wysang
