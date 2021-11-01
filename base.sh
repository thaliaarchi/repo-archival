#!/bin/sh

merge_repo() {
  git remote add "$1" ../"$1"
  git fetch "$1"
  git merge --allow-unrelated-histories --no-edit "$1"/main
  git remote remove "$1"
  rm -rf ../"$1"
}
