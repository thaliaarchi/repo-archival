#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

commit_as_tepigmc() {
  GIT_AUTHOR_NAME='TepigMC' GIT_AUTHOR_EMAIL='andrew@robarchibald.com' GIT_AUTHOR_DATE="$1" \
  GIT_COMMITTER_NAME='TepigMC' GIT_COMMITTER_EMAIL='andrew@robarchibald.com' GIT_COMMITTER_DATE="$1" \
  git commit -q --allow-empty -m "${@:2}"
}
commit_as_ppa() {
  GIT_AUTHOR_NAME='PPA' GIT_AUTHOR_EMAIL='pixelpapercraft@gmail.com' GIT_AUTHOR_DATE="$1" \
  GIT_COMMITTER_NAME='PPA' GIT_COMMITTER_EMAIL='pixelpapercraft@gmail.com' GIT_COMMITTER_DATE="$1" \
  git commit -q --allow-empty -m "${@:2}"
}

mkdir -p minecraft
cd minecraft
mkdir papercraft-pig papercraft-pig-emails pig-advanced
cd papercraft-pig-emails
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
# > Created by TepigMC
# >
# > 06 Feb 2015 lostminer: Add user variables
# > 13 Feb 2015 lostminer: Update to use new version of generator
# > 25 Feb 2015 TepigMC: Modified images; Fix drawing errors
# > 26 Feb 2015 TepigMC: Removed missing texture checks; Rename files
# > 27 Feb 2015 TepigMC: Compacted backgrounds and folds into sprite files
# > 28 Feb 2015 TepigMC: Compacted labels and titles into sprite files; Added "Advanced (Standard)" head
# >                      Added "Show Helmet Overlay" option; Added texture options
# > 09 Mar 2015 TepigMC: Fixed small bug with ultra mini pig
#
# Since the changelog is past tense, I replicate that in my synthesized commit
# messages.

# The emails that are counted as revisions are those that sent attachments (or,
# if the attachment was forgotten then quickly sent, the email before) or those
# that mention changes and were on days noted in the changelog, even if the .
# I have none of the code I (TepigMC) sent over email, because I no longer have
# my Sent mail folder from the time. The only code I have from email is one
# attachment from PPA, so all other emails are stub commits.

# Commit message bodies are excerpts from emails and headers are from the above
# changelog, when there is a corresponding entry. Any times with only minute
# precision are quoted in text in replies, and I assume they are in the timezone
# of the quoter (this may not be correct; see 2015-02-06).

# Email #1 from TepigMC on 2015-01-01 15:58 -0800
#
# > I have made a papercraft generator for pigs. It has options to enable
# > helmets, boots, and saddles that can be attached to the pig or as seperate
# > pieces. The head of the pig fits on the pig like in minecraft. The nose is
# > 3D and there is an option to make it be flat instead.
#
# This version of the code was not sent. I include the email as the commit body
# to provide some context for what features it had, since it had no changelog
# entry. The commit summary line is synthesized.
commit_as_tepigmc '2015-01-01 15:58 -0800' 'Papercraft generator for pigs

It has options to enable helmets, boots, and saddles that can be
attached to the pig or as seperate pieces. The head of the pig fits on
the pig like in minecraft. The nose is 3D and there is an option to
make it be flat instead.'

# Email #2 from PPA on 2015-01-04 19:13 +1100
#
# > Your generator work sounds great. Can you please email through the images
# > and script and we'll take a look.

# Email #3 from TepigMC on 2015-01-06 10:18 -0800
#
# > Here is the generator. I have attached it in a zip. When this is published,
# > please give credit. I have registered as TepigMC. If you need help
# > understanding anything or need me to change anything, let me know.
#
# This email was received at 2015-01-06 12:18 in Pixel Taj's local timezone,
# which is unknown, but it was sent from -0800. It is likely that my assumption
# of -0600 for Pixel Taj's local timezone is incorrect (see email_dates.txt for
# caveats), so the hour is probably wrong.
#
# It's possible I made changes to it between the announcement and first sending
# the code, and this is before the changelog was started, so I count this
# email as a revision. The commit message is synthesized.
commit_as_tepigmc '2015-01-06 10:18 -0800' 'Sent pig generator'

# Email #4 from Pixel Taj on 2015-01-07 05:37:40 +0000
#
# > Your generator looks great. It looks like you have some experience with
# > JavaScript, have you used it before?
# >
# > As you've seen, the generator builder doesn't currently support variable
# > options which you need for your Boolean values.
# >
# > I've spoken with PPA and he said that he will work on adding variables to
# > the generator for you. Hopefully, he can start on that work next week.
# >
# > We'll let you know when the update is ready.
#
# This time is correct, even though Pixel Taj's timezone is unknown. To limit
# assumptions, I just use UTC.

# Email #5 from TepigMC on 2015-01-06 21:50 -0800
#
# > That will be so awesome when there is support for variables. Thanks for
# > updating it so this will work. Is there currently a way in code to toggle
# > layer visibility kind of like the checkboxes for optional layers in the
# > builder? And yes I have used JavaScript before. I am fluent in JavaScript,
# > AngularJS, and jQuery.

# Email #6 from PPA on 2015-02-07 08:39 +1100
#
# > You've done an amazing job with your Pig Generator and the ultra mini pig is
# > a very nice touch :)
# >
# > I've finally managed to get some time to work on the generator again and have
# > now added variables for you to use.
# >
# > For now I've added support for booleans, select lists and a range of integer
# > values. You can read about them on the Generator Builder page under "Getting
# > User Input":
# >
# > http://pixelpapercraft.com/generator-builder
# >
# > I've also added your generator to the site so we can test it out and review.
# > Once we feel it's ready then we can officially announce it. Take a look and
# > let me know what you think. I'll also do a more thorough review and get back
# > to you.
# >
# > http://pixelpapercraft.com/print/minecraft-pig-advanced
# >
# > Always great to see people working with JavaScript. Pixel Papercraft is
# > actually written almost entirely in JS with Node.js on the server and
# > Backbone.JS on the front end.
cp -p "$TOPLEVEL/files/minecraft/papercraft-pig/Script.txt" .
git add Script.txt
commit_as_ppa '2015-02-07 08:39 +1100' 'Add user variables'

# Email #7 from PPA on 2015-02-07 08:43:53 +1100
#
# > I forgot to attached the updated version of the script for you.

# No surviving email
# Unknown time
commit_as_ppa '2015-02-13 00:00:00 +1100' 'Update to use new version of generator'

# Email #8 from TepigMC on 2015-02-26 17:19 -0800
#
# > I have done some testing. I was using `Generator.drawTexture` instead of
# > `Generator.drawImage`, so I fixed that. I also removed the checks for
# > non-existent textures because that broke it as well. I also changed some
# > things with the images, drawing, user inputs and probably other stuff too.
# > When you upload it, can you update the description to match the readme.md
# > (it uses markdown)?
# >
# > I also really like the new way for generator image imports. I suggest a
# > smaller font size because some image names are pretty long.
# >
# > Thanks for all the awesome improvements!
#
# I assume this email accidentally sent the previous day's revision, which was
# noted in the changelog. I use a synthetic time.
commit_as_tepigmc '2015-02-25 00:00:00 -0800' 'Modified images; Fix drawing errors'

# Email #9 from TepigMC on 2015-02-26 17:20 -0800
#
# > Sorry, last email was sent with an outdated attachment. Here is the real
# > one.
#
# I assume this email sent the 2015-02-26 revision noted in the changelog, so I
# use the previous email's time.
commit_as_tepigmc '2015-02-26 17:19 -0800' 'Removed missing texture checks; Rename files'

# Email #10 from PPA on 2015-02-27 18:42:06 +1100
#
# > Your generator looks great.
# >
# > Unfortunately I did break a few things in the generator update, but
# > hopefully the changes are for the better, and I'm happy you were able to
# > figure out the problems. Also, thanks for the feedback - I've reduced the
# > font size on the image names as well.
# >
# > I've released your generator to the site. I tested it with some HD textures
# > and it worked very well, but can you please do a final check.
# >
# > If you think it's OK then I'll officially announce it on the blog.
# >
# > http://pixelpapercraft.com/print/minecraft-pig-advanced
#
# Synthesized commit message
commit_as_ppa '2015-02-27 18:42:06 +1100' 'Release generator to the site'

# Email #11 from TepigMC on 2015-02-27 20:21 -0800
#
# > Thanks for posting it and doing the font size fix!
# >
# > Right now I am compacting the images into sprite files in a similar way to
# > CSS sprites. That way there won’t be 20 or so sprites used. I have made lots
# > of changes, so don’t post it in the news yet.
#
# I don't think this day's revision from the changelog was ever sent, so the
# email doesn't necessarily correspond to when this revision was made.
commit_as_tepigmc '2015-02-27 20:21 -0800' 'Compacted backgrounds and folds into sprite files'

# Email #12 from TepigMC on 2015-02-28 12:21 -0800
#
# > I have finished the changes. All the images are compacted into sprite files
# > (similar to CSS sprites) and the script draws them from there. I added the
# > standard version for Advanced Head and also an option to enable helmet
# > overlays (some textures like Sphax have multiple layers). I thoroughly
# > tested it and it is ready to post.
# >
# > When you post it to the site, all you need is the stuff in the for-site
# > folder, but for the download link at the bottom of the generator, put the
# > whole zip there.
# >
# > I noticed that the link in the generator builder section is to the wrong
# > generator. Make sure it goes to “minecraft-pig-advanced”. Also please
# > update the description to match the readme. I also posted another image that
# > I would like linked to the generator.
#
# Although a revision was sent, it was retracted. Rather than synthesizing a
# commit message, I just omit this one and use the day's changelog entry for the
# finished revision.

# Email #13 from TepigMC on 2015-02-28 13:08 -0800
#
# > Please don’t post the version I sent. I am making some changes. I will send
# > them soon

# Email #14 from PPA on 2015-03-01 10:30:27 +1100
#
# > Your changes look great.
# >
# > No worries, will wait for your update.

# Email #15 from TepigMC on 2015-02-28 16:59 -0800
#
# > The generator is officially (I think) complete. You can post it to the site
# > and the news now. I also took another [picture](http://pixelpapercraft.com/photo/54f2241d16bab6c70a000001/advanced-pig-generator-with-customizable-options)
# > for the generator and changed the readme. The site doesn’t need the folder
# > `image\seperated` and `image\Readme.md`. Those files are just to help other
# > people change the images.
# >
# > I noticed that the `<select>` for `Generator.defineInput()` choices has an
# > empty `<option>` at the beginning no matter what. Is that intentional or an
# > error? Isn’t it supposed to show the option that is selected? Also, if you
# > are willing, it would be nice to add support for `<optgroup>` in the select.
commit_as_tepigmc '2015-02-28 16:59 -0800' 'Compacted labels and titles into sprite files; Added "Advanced (Standard)" head
Added "Show Helmet Overlay" option; Added texture options'

# Email #16 from PPA on 2015-03-01 17:04:09 +1100
#
# > That is an **incredible** effort on the generator. Your new version is now
# > live.
# >
# > I've made some small formatting changes to the script so if you can please
# > get the latest copy from the site.
# >
# > Thanks for the note about the incorrect link on the generator builder page,
# > that should be correct now.
# >
# > Yes, the Generator.defineInput() intentionally has an empty option at the
# > moment. The idea is that each input definition provides
# > 1) a list of textures, and
# > 2) a texture select prompt.
# >
# > The user might select a texture from the list, or choose their own texture
# > file.
# >
# > The selected texture appears as a read-only label above the texture list.
# >
# > It was a slightly awkward input design but was easiest to implement this way
# > for now.
# >
# > And thanks for the suggestion about using optgroup, that may be a nice
# > feature to add in the future.
# >
# > I'll officially announce your generator on the blog within the next day or
# > two.
#
# Since this page does not have Last-Modified and IA does not have and earlier
# revision, I only link to the generator in this commit, not the earlier
# release. Synthesized commit message.
commit_as_ppa '2015-03-01 17:04:09 +1100' 'Release the new version to the site

https://web.archive.org/web/20150302194936/http://pixelpapercraft.com/print/minecraft-pig-advanced'

# The latest contained file, pig-advanced/Script.txt, was modified
# 2015-03-09 19:38:30 in the local timezone of the creator of the zip. Zips use
# local times, but do not store the timezone, so it extracts in your local
# timezone when you extract it. This is incorrect, but what we have.
#
# The HTTP Last-Modified header is 2015-03-09 08:45:11 +0000. Notice that this
# is 11 hours before Script.txt. This indicates that PPA's copy of the zip had a
# modification time of 2015-03-09 19:45:11 +1100, which was preserved when they
# uploaded it to the server.
#
# If I made this zip, and the changelog suggests that I did, then the files
# would be -0800 and I would have emailed it to PPA shortly thereafter (which I
# no longer have a record of). Many email clients will set the modification time
# of downloaded attachments to the date the email was sent. Unlike zips, emails
# have the timezone, so it would have to set it to my time, but skewed to PPA's
# timezone. Assuming all that, we can say the zip was created at
# 2015-03-09 19:45:11 -0800.
#
# Alternatively, considering the case that PPA made the zip, then the local
# times in the zip would be +1100, which matches neatly with HTTP Last-Modified
# time. The problem is that the changelog records a revision by me on this date
# and it's highly coincidental otherwise that PPA would have done a release. If
# the Last-Modified time is not skewed, then this would place my revision before
# 2015-03-09 00:38:30 -0800. I highly doubt I would have made a commit that late
# back then, and even if I did, I most likely would have noted it in the
# changelog as the day before.
#
# Thus, I use the time of the HTTP Last-Modified header, skewed forward to match
# the inner modification times, and in -0800.
TZ=US/Pacific unzip -d .. -q "$(get_cached_path https://web.archive.org/web/20150326203916/http://pixelpapercraft.com/app/generators/minecraft/pig-advanced.zip)"
git --work-tree=../pig-advanced add -A
commit_as_tepigmc '2015-03-09 19:45:11 -0800' 'Fixed small bug with ultra mini pig' \
  --trailer=Source:https://web.archive.org/web/20150326203916/http://pixelpapercraft.com/app/generators/minecraft/pig-advanced.zip

# Extract just the pig generator from the later git history, which started in
# 2021.
cd ..
clone_submodule https://github.com/pixelpapercraft/pixel-papercraft-generator-builder papercraft-pig
cd papercraft-pig
git filter-repo \
  --quiet \
  --subdirectory-filter src/generators/minecraft-pig/ \
  --commit-callback '
    commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: https://github.com/pixelpapercraft/pixel-papercraft-generator-builder/commit/" + commit.original_id + b"\n"
  '
# Graft it onto the synthetic email commits.
git remote add emails ../papercraft-pig-emails
git fetch -q emails
git replace --graft "$(git rev-list --max-parents=0 HEAD)" emails/main
git filter-repo -f --quiet
git remote remove emails

cd ..
rm -rf papercraft-pig-emails pig-advanced
