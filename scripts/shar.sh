#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO: Construct a repo from sharutils FTP archive releases at https://www.gnu.org/software/sharutils/.

if [[ ! -d lwall/rn ]]; then
  echo 'scripts/lwall/rn.sh must be run first' >&2
  exit 1
fi

mkdir shar
cd shar

git clone -q --no-local ../lwall/rn
git -C rn filter-repo --quiet \
  --path makedist --path manifake --path kitlists.c \
  --path makekit --path kitleader --path kittrailer

usenet_post_contents net.sources bGwxLjEyNg | tail -n+10 > another_shell_archiver.txt
usenet_post_contents net.sources PDE2MTlAcHVyLWVlLlVVQ1A%2B 2 | tail -n+5 | head -n9 > shell_archiver_wanted.txt

# There is no copy of this post on the Usenet Archive, so the following is
# copied from the Google Groups HTML. Hopefully the spaces were preserved.
# https://groups.google.com/g/net.sources/c/-zzuImxOlec
cat > tony_hansen.txt <<'!Funky!Stuff!'
: Create a shell that can be run to extract a bunch of files.
echo ": This is a shar archieve.  Extract with sh, not csh."
echo ": The rest of this file will extract:"
echo ":" "$*"
for file
do
    echo "echo extracting - $file"
    echo "sed 's/^X//' > $file << '~FUNKY STUFF~'"
    /bin/cat $file | sed 's/^/X/'
    echo "~FUNKY STUFF~"
done
!Funky!Stuff!
