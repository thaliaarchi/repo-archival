#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

mkdir -p regexp
cd regexp

clone_submodule https://github.com/SerenityOS/serenity serenityos
cd serenityos
git filter-repo --quiet \
  --path Userland/Libraries/LibRegex --path Libraries/LibRegex \
  --path-glob 'Userland/Libraries/LibJS/Runtime/RegExp*.cpp' --path-glob 'Libraries/LibJS/Runtime/RegExp*.cpp' \
  --path Userland/Libraries/LibC/regex.h --path Libraries/LibC/regex.h \
  --path Tests/LibRegex \
  --path LICENSE \
  --path SECURITY.md
