#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

as_tepigmc() {
  GIT_AUTHOR_NAME='TepigMC' GIT_AUTHOR_EMAIL='andrew@robarchibald.com' GIT_AUTHOR_DATE="$1" \
  GIT_COMMITTER_NAME='TepigMC' GIT_COMMITTER_EMAIL='andrew@robarchibald.com' GIT_COMMITTER_DATE="$1" \
  "${@:2}"
}
as_ppa() {
  GIT_AUTHOR_NAME='PPA' GIT_AUTHOR_EMAIL='pixelpapercraft@gmail.com' GIT_AUTHOR_DATE="$1" \
  GIT_COMMITTER_NAME='PPA' GIT_COMMITTER_EMAIL='pixelpapercraft@gmail.com' GIT_COMMITTER_DATE="$1" \
  "${@:2}"
}

mkdir -p minecraft
cd minecraft
mkdir papercraft-pig
cd papercraft-pig
git init -q

# Sources:
# - https://web.archive.org/web/20150302194936/http://pixelpapercraft.com/print/minecraft-pig-advanced
# - https://web.archive.org/web/20150326203916/http://pixelpapercraft.com/app/generators/minecraft/pig-advanced.zip
# - https://web.archive.org/web/20170806190806/http://blog.pixelpapercraft.com/post/113047142588/advanced-pig-generator
# - https://www.pixelpapercraft.com/photo/54f2241d16bab6c70a000001/advanced-pig-generator-with-customizable-options
# - https://www.pixelpapercraft.com/print/minecraft-pig
# - Emails

# Changelog from pig-advanced.zip/pig-advanced/Script.txt:
#
# Created by TepigMC
#
# 06 Feb 2015 lostminer: Add user variables
# 13 Feb 2015 lostminer: Update to use new version of generator
# 25 Feb 2015 TepigMC: Modified images; Fix drawing errors
# 26 Feb 2015 TepigMC: Removed missing texture checks; Rename files
# 27 Feb 2015 TepigMC: Compacted backgrounds and folds into sprite files
# 28 Feb 2015 TepigMC: Compacted labels and titles into sprite files; Added "Advanced (Standard)" head
#                      Added "Show Helmet Overlay" option; Added texture options
# 09 Mar 2015 TepigMC: Fixed small bug with ultra mini pig

# Commit message bodies are excerpts from emails and headers are from the above
# changelog, when there is a corresponding entry. Any times with only minute
# precision are quoted in text in replies, and I assume they are in the timezone
# of the quoter (this may not be correct; see 2015-02-06).

as_tepigmc '2015-01-01 10:58 -0800' git commit -q --allow-empty -m 'Make papercraft generator for pigs

It has options to enable helmets, boots, and saddles that can be
attached to the pig or as seperate pieces. The head of the pig fits on
the pig like in minecraft. The nose is 3D and there is an option to make
it be flat instead.'

# This was two emails: the first describing it (2015-02-07 08:39, quoted in text
# locally), and the second with the forgotten attachment
# (2015-02-06 15:43:53 -0600). I don't know why the second would be earlier than
# the first. I use the second, because it more closely matches the date in the
# changelog.
# Quoted by TepigMC: 2015-02-06 13:39
# Quoted by PPA:     2015-02-07 08:39
cp -p "$TOPLEVEL/files/minecraft/papercraft-pig/Script.txt" .
git add Script.txt
as_ppa '2015-02-06 15:43:53 -0600' git commit -q -m 'Add user variables'
# > I've finally managed to get some time to work on the generator again and
# > have now added variables for you to use.
# >
# > For now I've added support for booleans, select lists and a range of integer
# > values. You can read about them on the Generator Builder page under "Getting
# > User Input":
# > https://web.archive.org/web/20150210000246/http://pixelpapercraft.com/generator-builder
# >
# > I've also added your generator to the site so we can test it out and review.
# > Once we feel it's ready then we can officially announce it.

# Unknown time
as_ppa '2015-02-13 00:00:00 -0600' git commit -q --allow-empty -m 'Update to use new version of generator'

# Unknown time
as_tepigmc '2015-02-25 00:00:00 -0800' git commit -q --allow-empty -m 'Modified images; Fix drawing errors'

as_tepigmc '2015-02-26 17:19 -0800' git commit -q --allow-empty -m 'Removed missing texture checks; Rename files'
# > I have done some testing. I was using `Generator.drawTexture` instead of
# > `Generator.drawImage`, so I fixed that. I also removed the checks for
# > non-existent textures because that broke it as well. I also changed some
# > things with the images, drawing, user inputs and probably other stuff too.

as_tepigmc '2015-02-27 10:20 -0800' git commit -q --allow-empty -m 'Compacted backgrounds and folds into sprite files'

as_ppa '2015-02-27 01:42:06 -0600' git commit -q --allow-empty -m 'Release generator to the site

https://web.archive.org/web/20150302194936/http://pixelpapercraft.com/print/minecraft-pig-advanced'

as_tepigmc '2015-02-28 12:21 -0800' git commit -q --allow-empty -m 'Compacted labels and titles into sprite files; Added "Advanced (Standard)" head
Added "Show Helmet Overlay" option; Added texture options'
# > I have finished the changes. All the images are compacted into sprite files
# > (similar to CSS sprites) and the script draws them from there. I added the
# > standard version for Advanced Head and also an option to enable helmet
# > overlays (some textures like Sphax have multiple layers). I thoroughly
# > tested it and it is ready to post.

as_tepigmc '2015-03-01 09:59 -0800' git commit -q --allow-empty -m 'Finish generator'
# > The generator is officially (I think) complete. You can post it to the site
# > and the news now. I also took another picture for the generator and changed
# > the readme. The site doesn’t need the folder `image\seperated` and
# > `image\Readme.md`. Those files are just to help other people change the
# > images.

as_ppa '2015-03-01 00:04:09 -0600' git commit -q --allow-empty -m 'Release the new version to the site

I'"'"'ve made some small formatting changes to the script.

I'"'"'ll officially announce your generator on the blog within the next day or two.'

# Zip does not store timezone, so it extracts in the local timezone.
# The latest contained file, pig-advanced/Script.txt, was modified
# 2015-03-09 19:38:30 locally and the HTTP Last-Modified header is
# 2015-03-09 08:45:11 +0000, which make no sense together. The effective
# timezone would have shifted every time it was zipped in another timezone.
# As far as I can tell, though, zips were only made on my end (-0800). Since I
# have no idea what timezone the server is in, I use the internal modification
# time.
cd ..
TZ=US/Pacific unzip -q "$(get_cached_path https://web.archive.org/web/20150326203916/http://pixelpapercraft.com/app/generators/minecraft/pig-advanced.zip)"
mv papercraft-pig/.git pig-advanced
rm -r papercraft-pig
mv pig-advanced papercraft-pig
cd papercraft-pig
git add -A
as_tepigmc '2015-03-09 19:38:30 -0800' git commit -q -m 'Release the generator' \
  --trailer=Source:https://web.archive.org/web/20150326203916/http://pixelpapercraft.com/app/generators/minecraft/pig-advanced.zip

cd ..
clone_submodule https://github.com/pixelpapercraft/pixel-papercraft-generator-builder
cd pixel-papercraft-generator-builder
git filter-repo \
  --quiet \
  --subdirectory-filter src/generators/minecraft-pig/ \
  --commit-callback '
    commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: https://github.com/pixelpapercraft/pixel-papercraft-generator-builder/commit/" + commit.original_id + b"\n"
  '

git remote add base ../papercraft-pig
git fetch -q base
git replace --graft "$(git rev-list --max-parents=0 HEAD)" base/main
git filter-repo -f --quiet
git remote remove base
cd ..
rm -rf papercraft-pig
mv pixel-papercraft-generator-builder papercraft-pig
