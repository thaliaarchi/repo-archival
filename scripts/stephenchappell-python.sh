#!/bin/bash -e

. base.sh

git init stephenchappell-python
cd stephenchappell-python

# Exact paths for all files, except for memory_manager.wsa, are written in
# comments. memory_manager.wsa is inferred from label names in the program.
copy_submodule activestate
git -C activestate filter-repo \
  --path LICENSE.md \
  --path recipes/Python/577108_Whitespace_Assembler \
  --path recipes/Python/577109_Whitespace_Helpers \
  --path recipes/Python/577110_Whitespace_Interpreter \
  --path recipes/Python/577112_Whitespace_Stack_Calculator \
  --path recipes/Python/577673_Whitespace_Memory_Manager \
  --path-rename recipes/Python/577108_Whitespace_Assembler/recipe-577108.py:Assembler.py \
  --path-rename recipes/Python/577109_Whitespace_Helpers/recipe-577109.py:Helpers.py \
  --path-rename recipes/Python/577110_Whitespace_Interpreter/recipe-577110.py:Interpreter.py \
  --path-rename recipes/Python/577112_Whitespace_Stack_Calculator/recipe-577112.py:Assembly/stack_calc.wsa \
  --path-rename recipes/Python/577673_Whitespace_Memory_Manager/recipe-577673.py:Assembly/memory_manager.wsa \
  --path-rename recipes/Python/:

# Metadata in file comments:
# Author: Stephen "Zero" Chappell <Noctis.Skytower@gmail.com>
# Assembler.py:   2010-03-14, revision 3
# Helpers.py:     2010-03-14, revision 1
# Interpreter.py: 2010-03-14, revision 4

# Recipe revisions:
#
# Recipe 577108: Whitespace Assembler
# - Published:  2010-03-14 15:35:04 https://code.activestate.com/recipes/577108-whitespace-assembler/
# - Revision 1: 2010-03-14 15:35:06 https://code.activestate.com/recipes/577108-whitespace-assembler/history/1/
# - Revision 2: 2010-05-24 12:01:13 https://code.activestate.com/recipes/577108-whitespace-assembler/history/2/
# - Revision 3: 2011-07-17 19:48:14 https://code.activestate.com/recipes/577108-whitespace-assembler/history/3/
#
# Recipe 577109: Whitespace Helpers
# - Published:  2010-03-14 15:36:02 https://code.activestate.com/recipes/577109-whitespace-helpers/
# - Revision 1: 2010-03-14 15:36:03 https://code.activestate.com/recipes/577109-whitespace-helpers/history/1/
#
# Recipe 577110: Whitespace Interpreter
# - Published:  2010-03-14 15:36:52 https://code.activestate.com/recipes/577110-whitespace-interpreter/
# - Revision 1: 2010-03-14 15:36:53 https://code.activestate.com/recipes/577110-whitespace-interpreter/history/1/
# - Revision 2: 2010-05-24 12:02:11 https://code.activestate.com/recipes/577110-whitespace-interpreter/history/2/
#
# Recipe 577112: Whitespace Stack Calculator
# - Published:  2010-03-14 18:03:23 https://code.activestate.com/recipes/577112-whitespace-stack-calculator/
# - Revision 1: 2010-03-14 18:03:24 https://code.activestate.com/recipes/577112-whitespace-stack-calculator/history/1/
#
# Recipe 577673: Whitespace Memory Manager
# - Published:  2011-04-21 12:16:12 https://code.activestate.com/recipes/577673-whitespace-memory-manager/
# - Revision 1: 2011-04-21 12:16:13 https://code.activestate.com/recipes/577673-whitespace-memory-manager/history/1/
# - Revision 2: 2011-04-21 12:34:56 https://code.activestate.com/recipes/577673-whitespace-memory-manager/history/2/
# - Revision 3: 2011-07-17 19:45:38 https://code.activestate.com/recipes/577673-whitespace-memory-manager/history/3/
#
# Revision dates are collected from multiple sources:
# - GitHub recipe README.md files have "Originally published" and "Last updated"
#   with second precision
# - Revision diffs have revision dates with second precision
# - The revision history list has revision dates with minute precision

# Title and description from Whitespace Language set
# https://code.activestate.com/recipes/sets/12/
echo '# Whitespace Language

These programs support the Whitespace Programming Language by way of implementing an assembler and interpreter in Python.' > README.md

# Add license from GitHub repo
cp ../activestate/577109_Whitespace_Helpers/LICENSE.md LICENSE.md
echo >> LICENSE.md
git add LICENSE.md

get_revisions() {
  local id="$1" title="$2" filename="$3" revision_dates=("${@:4}")

  local slug recipe_dir
  slug="$(tr '[:upper:]' '[:lower:]' <<< "$title" | tr ' ' -)"
  recipe_dir="${id}_$(tr ' ' _ <<< "$title")"
  local url="https://code.activestate.com/recipes/$id-$slug/"

  # Add section to README.md, using description from GitHub repo
  { echo -ne "\n## $title\n\n"
    tail -n+6 "../activestate/$recipe_dir/README.md" | tr -d '\r'
    echo
  } >> README.md
  git add README.md

  mkdir -p "$(dirname "$filename")"
  local date
  local revision=1
  for date in "${revision_dates[@]}"; do
    local revision_url="${url}history/$revision/"
    echo "Downloading $filename revision $revision ($date)"
    # Extract code block from page
    curl --no-progress-meter "$revision_url" |
      htmlq --text '#content pre.prettyprint:first-child' > "$filename"
    # Remove superfluous LF at the end of the file from htmlq serialization
    truncate -s-1 "$filename"
    if [[ $filename = *.py ]]; then
      chmod +x "$filename"
    fi
    git add "$filename"

    # Update license year range
    local year="${date:0:4}"
    if [[ $year = 2010 ]]; then
      # Since the commits are not-yet ordered, it may collapse the range
      sed -E -i.bak 's/^Copyright 2010(-20..)? /Copyright 2010 /' LICENSE.md
    else
      sed -E -i.bak "s/^Copyright 2010(-20..)? /Copyright 2010-$year /" LICENSE.md
    fi
    rm LICENSE.md.bak # For compatibility between GNU and BSD sed
    git add LICENSE.md

    GIT_AUTHOR_NAME='Stephen "Zero" Chappell' GIT_AUTHOR_EMAIL='Noctis.Skytower@gmail.com' GIT_AUTHOR_DATE="$date +0000" \
    GIT_COMMITTER_NAME='Stephen "Zero" Chappell' GIT_COMMITTER_EMAIL='Noctis.Skytower@gmail.com' GIT_COMMITTER_DATE="$date +0000" \
    git commit -q -m "Recipe $id: $title, revision $revision

${revision_url}"

    ((revision++))
  done

  echo "Downloading $filename latest"
  curl --no-progress-meter -o "$filename.raw" "${url}download/1/"
  if ! cmp "$filename" "$filename.raw"; then
    echo "$filename: Extracted HTML code block does not match raw file" >&2
    exit 1
  fi
  rm "$filename.raw"
}

get_revisions 577108 'Whitespace Assembler'        Assembler.py                '2010-03-14 15:35:04' '2010-05-24 12:01:13' '2011-07-17 19:48:14'
get_revisions 577109 'Whitespace Helpers'          Helpers.py                  '2010-03-14 15:36:02'
get_revisions 577110 'Whitespace Interpreter'      Interpreter.py              '2010-03-14 15:36:52' '2010-05-24 12:02:11'
get_revisions 577112 'Whitespace Stack Calculator' Assembly/stack_calc.wsa     '2010-03-14 18:03:23'
get_revisions 577673 'Whitespace Memory Manager'   Assembly/memory_manager.wsa '2011-04-21 12:16:12' '2011-04-21 12:34:56' '2011-07-17 19:45:38'

# Sort commits by author date
git config user.name 'Stephen "Zero" Chappell'
git config user.email 'Noctis.Skytower@gmail.com'
GIT_SEQUENCE_EDITOR="git log --format='%ai,pick %h %s' | sort | cut -d, -f2- > " \
git rebase -i --committer-date-is-author-date --root
git config --unset user.name
git config --unset user.email

# Check that the constructed files match the expected latest revisions:
cmp Assembler.py ../activestate/Assembler.py
cmp Helpers.py ../activestate/Helpers.py
cmp Interpreter.py ../activestate/Interpreter.py
cmp Assembly/stack_calc.wsa ../activestate/Assembly/stack_calc.wsa
cmp Assembly/memory_manager.wsa ../activestate/Assembly/memory_manager.wsa
rm -rf ../activestate

git remote add origin https://github.com/wspace/stephenchappell-python
