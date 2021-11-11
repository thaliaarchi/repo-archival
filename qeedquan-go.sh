#!/bin/sh -e

git clone https://github.com/qeedquan/misc_utilities qeedquan-go
cd qeedquan-go
git filter-repo --subdirectory-filter esolang/whitespace --path AUTHORS --path LICENSE
git branch -m master main
git remote add origin https://github.com/wspace/qeedquan-go
