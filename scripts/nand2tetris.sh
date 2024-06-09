#!/bin/bash -e

. base.sh

commit_archive() {
  local date="$1" message="$2" url="$3"
  cd ..
  rm -rf nand2tetris
  unzip -q "$(get_cached_path "$url")"
  rm -rf __MACOSX # For https://web.archive.org/web/20160204005352/http://www.nand2tetris.org/software/nand2tetris.zip
  cd suite
  git --work-tree ../nand2tetris add -Af
  GIT_AUTHOR_DATE="$date" GIT_COMMITTER_DATE="$date" \
  git commit -q -m "$message"
}

mkdir -p nand2tetris
cd nand2tetris
mkdir suite
cd suite
git init -q

#              HTTP Last-Modified
commit_archive '2013-08-17 20:48:50 +0000' 'Revision 2013-08-17' https://web.archive.org/web/20130903145719/http://www.nand2tetris.org/software/nand2tetris.zip
commit_archive '2015-02-07 17:27:06 +0000' 'Revision 2015-02-07' https://web.archive.org/web/20150318063755/http://nand2tetris.org/software/nand2tetris.zip
commit_archive '2015-03-28 04:45:17 +0000' 'Revision 2015-03-28' https://web.archive.org/web/20150806164243/http://www.nand2tetris.org/software/nand2tetris.zip
commit_archive '2016-01-25 18:52:48 +0000' 'Revision 2016-01-25' https://web.archive.org/web/20160204005352/http://www.nand2tetris.org/software/nand2tetris.zip
commit_archive '2016-03-15 06:43:05 +0000' 'Revision 2016-03-15' https://web.archive.org/web/20160402071408/http://nand2tetris.org/software/nand2tetris.zip
commit_archive '2016-09-05 18:00:34 +0000' 'Revision 2016-09-05' https://web.archive.org/web/20161231004537/http://www.nand2tetris.org/software/nand2tetris.zip
commit_archive '2017-01-28 17:08:23 +0000' 'Revision 2017-01-28' https://web.archive.org/web/20170328172443/http://nand2tetris.org/software/nand2tetris.zip

# TODO
# https://web.archive.org/web/20050204151352/http://www.cs.huji.ac.il/~noam/
# https://web.archive.org/web/20020206213850/http://www.faculty.idc.ac.il/schocken/
# https://web.archive.org/web/20020522211702/http://www.idc.ac.il/digitalcore
# https://web.archive.org/web/20030416100155/http://www1.idc.ac.il/csd/
# https://web.archive.org/web/20031225042504/http://www1.idc.ac.il/tecs/
# https://web.archive.org/web/20021022015905/http://www.cs.huji.ac.il/~nand2tet/
# https://web.archive.org/web/20110416092647/http://moodle.cs.huji.ac.il/cs10/course/view.php?id=67925
# https://www.cs.huji.ac.il/~noam/
# https://www.shimonschocken.com/

mv .git ../nand2tetris
cd ..
rmdir suite
