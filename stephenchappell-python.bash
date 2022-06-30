#!/bin/bash -e

# Metadata from files:
# Author: Stephen "Zero" Chappell <Noctis.Skytower@gmail.com>
# Assembler.py:   2010-03-14, revision 3
# Helpers.py:     2010-03-14, revision 1
# Interpreter.py: 2010-03-14, revision 4

# Exact paths for all files, except for memory_manager.wsa, are written in
# comments. memory_manager.wsa is inferred from label names in the program.
git clone https://github.com/ActiveState/code activestate
cd activestate
git filter-repo \
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

# Revision dates are collected from multiple sources:
# - GitHub recipe README.md files have "Originally published" and "Last updated"
#   with second precision
# - Revision diffs have revision dates with second precision
# - The revision history list has revision dates with minute precision

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

get_revisions() {
  local url="$1"
  local filename="$2"
  local revision
  mkdir -p "$(dirname "$filename")"
  for revision in "${@:3}"; do
    echo "Downloading $filename revision $revision"
    # Extract code block from page
    curl --no-progress-meter "${url}history/$revision/" |
      htmlq --text '#content pre.prettyprint:first-child' > "$filename.r$revision"
    # Remove superfluous LF at the end of the file from htmlq serialization
    truncate -s-1 "$filename.r$revision"
  done
  echo "Downloading $filename latest"
  curl --no-progress-meter -o "$filename.latest" "${url}download/1/"
  # Verify that htmlq serialization is consistent with raw-downloaded version
  cmp "$filename.r$revision" "$filename.latest"
  rm "$filename.latest"
}

cd ..
mkdir stephenchappell-python
cd stephenchappell-python
get_revisions https://code.activestate.com/recipes/577108-whitespace-assembler/        Assembler.py                1 2 3
get_revisions https://code.activestate.com/recipes/577109-whitespace-helpers/          Helpers.py                  1
get_revisions https://code.activestate.com/recipes/577110-whitespace-interpreter/      Interpreter.py              1 2
get_revisions https://code.activestate.com/recipes/577112-whitespace-stack-calculator/ Assembly/stack_calc.wsa     1
get_revisions https://code.activestate.com/recipes/577673-whitespace-memory-manager/   Assembly/memory_manager.wsa 1 2 3
