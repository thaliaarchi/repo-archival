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
mkdir papercraft-pig pig-advanced

# This release of the code is from 2015-03-09 (see that commit below for details
# on its metadata). Its files are modified closely in line with the emails, so I
# commit the files in chunks according to when they were modified in the zip.
# This helps to supplement the few known revisions with extant code.
#
# Note, that zips use local times, but do not store the timezone, so it extracts
# in your local timezone when you extract it. That means that if a zip is
# extracted by someone else, modified, then re-zipped, then any unchanged files
# will have the same time in the zip as before (i.e., local to the original zip
# creator's timezone) and any modified files will be local to the other person's
# timezone. Timezones get messy when zips are passed around, but at least the
# times always remain the same. Thus, when assigning timezones to files in a
# zip, it varies by file according to the authorship of the file.
TZ=US/Pacific unzip -q "$(get_cached_path https://web.archive.org/web/20150326203916/http://pixelpapercraft.com/app/generators/minecraft/pig-advanced.zip)"
cd pig-advanced
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
#
# Files from pig-advanced.zip attributed to this revision:
# 2014-11-24 15:08:14 (local)  pig-advanced/texture/vanilla/chainmail-armor.png
# 2014-11-24 15:08:14 (local)  pig-advanced/texture/vanilla/diamond-armor.png
# 2014-11-24 15:08:14 (local)  pig-advanced/texture/vanilla/gold-armor.png
# 2014-11-24 15:08:14 (local)  pig-advanced/texture/vanilla/iron-armor.png
# 2014-12-30 09:23:22 (local)  pig-advanced/texture/vanilla/pig.png
# 2014-12-30 09:23:46 (local)  pig-advanced/texture/vanilla/saddle.png
git add texture/vanilla/{chainmail-armor.png,diamond-armor.png,gold-armor.png,iron-armor.png,pig.png,saddle.png}
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

# No email or changelog entry
#
# These textures were most likely downloaded just for the pig generator, since I
# don't remember ever playing Minecraft with these texture packs. Rather than
# attribute them to a later commit by me, I make this revision, because it shows
# I was working on it this day. The message is synthetic.
#
# Files from pig-advanced.zip attributed to this revision:
# 2015-01-11 15:30:02 (local)  pig-advanced/texture/space-pig/pig.png
# 2015-01-14 16:13:06 (local)  pig-advanced/texture/faithful/pig.png
# 2015-01-14 16:13:06 (local)  pig-advanced/texture/faithful/saddle.png
# 2015-01-14 16:13:40 (local)  pig-advanced/texture/faithful/diamond-armor.png
git add texture/{faithful/{diamond-armor.png,pig.png,saddle.png},space-pig/pig.png}
commit_as_tepigmc '2015-01-14 16:13:40 -0800' 'Added Faithful and Space Pig textures'

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
mv Script.txt{,.bak}
cp -p "$TOPLEVEL/files/minecraft/papercraft-pig/Script.txt" .
git add Script.txt
mv Script.txt{.bak,}
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
commit_as_ppa '2015-02-27 18:42:06 +1100' 'Release generator to the site'

# Email #11 from TepigMC on 2015-02-27 20:21 -0800
#
# > Thanks for posting it and doing the font size fix!
# >
# > Right now I am compacting the images into sprite files in a similar way to
# > CSS sprites. That way there won’t be 20 or so sprites used. I have made lots
# > of changes, so don’t post it in the news yet.
#
# I don't think this day's code was ever sent, although it has an entry in the
# changelog, so the email doesn't necessarily correspond to when this revision
# was made. There are more files revised on this day (see the next commit), but
# they are named in the next revision, so I move them to then; there's 1.5 hours
# between too.
#
# Files from pig-advanced.zip attributed to this revision:
# 2015-02-27 16:15:02 (local)  pig-advanced/image/seperated/backgrounds/nose3D.png
# 2015-02-27 16:15:28 (local)  pig-advanced/image/seperated/backgrounds/leg.png
# 2015-02-27 16:17:12 (local)  pig-advanced/image/seperated/backgrounds/headAdvanced.png
# 2015-02-27 16:17:38 (local)  pig-advanced/image/seperated/backgrounds/helmet.png
# 2015-02-27 16:18:00 (local)  pig-advanced/image/seperated/backgrounds/body.png
# 2015-02-27 16:18:16 (local)  pig-advanced/image/seperated/backgrounds/ultraMini.png
# 2015-02-27 16:18:32 (local)  pig-advanced/image/seperated/titles/pixelPapercraft.png
# 2015-02-27 16:18:38 (local)  pig-advanced/image/seperated/titles/tepigmc.png
# 2015-02-27 16:27:00 (local)  pig-advanced/image/seperated/backgrounds/headSimple.png
# 2015-02-27 16:58:16 (local)  pig-advanced/image/seperated/backgrounds/boot.png
# 2015-02-27 17:19:36 (local)  pig-advanced/image/seperated/backgrounds/opaque.png
# 2015-02-27 20:39:54 (local)  pig-advanced/image/seperated/titles/ultraMini.png
# 2015-02-27 20:40:24 (local)  pig-advanced/image/seperated/titles/leg.png
# 2015-02-27 20:48:14 (local)  pig-advanced/image/seperated/folds/body.png
# 2015-02-27 20:52:26 (local)  pig-advanced/image/seperated/folds/nose3D.png
# 2015-02-27 20:53:10 (local)  pig-advanced/image/seperated/folds/leg.png
# 2015-02-27 20:54:00 (local)  pig-advanced/image/seperated/folds/boot.png
# 2015-02-27 20:56:22 (local)  pig-advanced/image/seperated/folds/saddle.png
# 2015-02-27 20:57:58 (local)  pig-advanced/image/seperated/folds/headAdvanced.png
# 2015-02-27 20:59:08 (local)  pig-advanced/image/seperated/folds/headSimple.png
# 2015-02-27 21:01:14 (local)  pig-advanced/image/seperated/folds/headAdvancedCuts.png
git add image/seperated/backgrounds/{body.png,boot.png,headAdvanced.png,headSimple.png,helmet.png,leg.png,nose3D.png,opaque.png,ultraMini.png} \
        image/seperated/folds/{body.png,boot.png,headAdvanced.png,headAdvancedCuts.png,headSimple.png,leg.png,nose3D.png,saddle.png} \
        image/seperated/titles/{leg.png,pixelPapercraft.png,tepigmc.png,ultraMini.png}
commit_as_tepigmc '2015-02-27 21:01:14 -0800' 'Compacted backgrounds and folds into sprite files'

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
# Although a revision was sent, it was retracted. However, there is an hour
# break between the files for this revision and the next, so I include it. The
# message from the changelog seems to split neatly between the files changed in
# this and the next revision.
#
# Files from pig-advanced.zip attributed to this revision:
# 2015-02-27 22:25:56 (local)  pig-advanced/image/seperated/labels/headNose3D.png
# 2015-02-27 22:28:18 (local)  pig-advanced/image/seperated/labels/leg1.png
# 2015-02-27 22:28:22 (local)  pig-advanced/image/seperated/labels/leg2.png
# 2015-02-27 22:28:30 (local)  pig-advanced/image/seperated/labels/leg3.png
# 2015-02-27 22:28:44 (local)  pig-advanced/image/seperated/labels/leg4.png
# 2015-02-28 08:43:30 (local)  pig-advanced/image/seperated/titles/head.png
# 2015-02-28 08:44:14 (local)  pig-advanced/image/seperated/labels/head.png
# 2015-02-28 08:44:42 (local)  pig-advanced/image/seperated/labels/nose3D.png
# 2015-02-28 08:45:10 (local)  pig-advanced/image/seperated/titles/nose3D.png
# 2015-02-28 08:45:40 (local)  pig-advanced/image/seperated/titles/body.png
# 2015-02-28 08:46:12 (local)  pig-advanced/image/seperated/labels/bodyHead.png
# 2015-02-28 08:48:08 (local)  pig-advanced/image/seperated/labels/bodyLeg1.png
# 2015-02-28 08:48:14 (local)  pig-advanced/image/seperated/labels/bodyLeg2.png
# 2015-02-28 08:48:28 (local)  pig-advanced/image/seperated/labels/bodyLeg3.png
# 2015-02-28 08:48:34 (local)  pig-advanced/image/seperated/labels/bodyLeg4.png
# 2015-02-28 08:49:22 (local)  pig-advanced/image/seperated/titles/boot.png
# 2015-02-28 08:49:34 (local)  pig-advanced/image/seperated/titles/saddle.png
# 2015-02-28 08:49:42 (local)  pig-advanced/image/seperated/titles/helmet.png
# 2015-02-28 10:10:38 (local)  pig-advanced/image/seperated/folds/headStandardAdvanced.png
# 2015-02-28 10:11:10 (local)  pig-advanced/image/seperated/backgrounds/headStandardAdvanced.png
# 2015-02-28 10:20:30 (local)  pig-advanced/image/seperated/labels/headStandardAdvanced.png
# 2015-02-28 10:27:48 (local)  pig-advanced/image/label-sprites.png
# 2015-02-28 10:40:52 (local)  pig-advanced/image/title-sprites.png
# 2015-02-28 10:43:06 (local)  pig-advanced/image/background-sprites.png
# 2015-02-28 12:05:26 (local)  pig-advanced/image/Readme.md
git add image/{background-sprites.png,label-sprites.png,Readme.md,title-sprites.png} \
        image/seperated/backgrounds/headStandardAdvanced.png \
        image/seperated/folds/headStandardAdvanced.png \
        image/seperated/labels/{bodyHead.png,bodyLeg1.png,bodyLeg2.png,bodyLeg3.png,bodyLeg4.png,head.png,headNose3D.png,headStandardAdvanced.png,leg1.png,leg2.png,leg3.png,leg4.png,nose3D.png} \
        image/seperated/titles/{body.png,boot.png,head.png,helmet.png,nose3D.png,saddle.png}
commit_as_tepigmc '2015-02-28 12:21 -0800' 'Compacted labels and titles into sprite files; Added "Advanced (Standard)" head'

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
#
# Files from pig-advanced.zip attributed to this revision:
# 2015-02-28 13:01:12 (local)  pig-advanced/texture/space-pig/saddle.png
# 2015-02-28 13:01:44 (local)  pig-advanced/texture/space-pig/armor.png
# 2015-02-28 13:13:12 (local)  pig-advanced/image/seperated/folds/helmet.png
# 2015-02-28 13:42:36 (local)  pig-advanced/texture/tepig/elpis.png
# 2015-02-28 15:16:10 (local)  pig-advanced/image/fold-sprites.png
# 2015-02-28 15:56:36 (local)  pig-advanced/texture/tepig/audra.png
# 2015-02-28 16:31:44 (local)  pig-advanced/texture/faithful/chainmail-armor.png
# 2015-02-28 16:31:44 (local)  pig-advanced/texture/faithful/gold-armor.png
# 2015-02-28 16:31:44 (local)  pig-advanced/texture/faithful/iron-armor.png
# 2015-02-28 16:44:32 (local)  pig-advanced/Readme.md
git add Readme.md image/fold-sprites.png image/seperated/folds/helmet.png \
        texture/faithful/{chainmail-armor.png,gold-armor.png,iron-armor.png} \
        texture/space-pig/{armor.png,saddle.png} \
        texture/tepig/{audra.png,elpis.png}
commit_as_tepigmc '2015-02-28 16:59 -0800' 'Added "Show Helmet Overlay" option; Added texture options'

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
# revision, I link to the generator page in this commit, not in the earlier
# commit. The commit message is synthesized.
#
# Resources.js was modified here, just as the email says. Note that I use +1100,
# because this version was authored by PPA. The times are preserved between
# extractions; only the timezones are reset.
#
# Files from pig-advanced.zip attributed to this revision:
# 2015-03-01 13:58:38 (local)  pig-advanced/image/
# 2015-03-01 13:58:38 (local)  pig-advanced/image/seperated/
# 2015-03-01 13:58:38 (local)  pig-advanced/image/seperated/backgrounds/
# 2015-03-01 13:58:38 (local)  pig-advanced/image/seperated/folds/
# 2015-03-01 13:58:38 (local)  pig-advanced/image/seperated/labels/
# 2015-03-01 13:58:38 (local)  pig-advanced/image/seperated/titles/
# 2015-03-01 13:58:38 (local)  pig-advanced/texture/
# 2015-03-01 13:58:38 (local)  pig-advanced/texture/faithful/
# 2015-03-01 13:58:38 (local)  pig-advanced/texture/space-pig/
# 2015-03-01 13:58:38 (local)  pig-advanced/texture/tepig/
# 2015-03-01 13:58:38 (local)  pig-advanced/texture/vanilla/
# 2015-03-01 15:20:06 (local)  pig-advanced/Resources.js
git add Resources.js
commit_as_ppa '2015-03-01 17:04:09 +1100' 'Release the new version to the site

https://web.archive.org/web/20150302194936/http://pixelpapercraft.com/print/minecraft-pig-advanced'

# The latest contained file, pig-advanced/Script.txt, was modified
# 2015-03-09 19:38:30 in a local timezone. The changelog suggests this was my
# change, so its timezone is most likely -0800.
#
# The HTTP Last-Modified header is 2015-03-09 08:45:11 +0000. Notice that this
# is 11 hours before Script.txt, with an extra 7 minutes.
#
# Supposed I modified Script.txt at 2015-03-09 19:38:30 -0800, zipped it up,
# then emailed it to PPA at 2015-03-09 19:45:11 -0800. Then, when PPA downloaded
# the attachment, their email client would use the email date as the
# modification time (at least mine does this). If the client interpreted the
# email date as local when setting the modification time, then things line up.
# Problem is, emails have the timezone, so this logic in the email client would
# have to not be timezone-aware. Assuming that, then PPA's copy of
# pig-advanced.zip would have a modification time of 2015-03-09 19:45:11 +1100,
# which would be preserved when uploading it to the server.
#
# Alternatively, if the HTTP Last-Modified is not skewed, then my revision would
# be before 2015-03-09 00:45:11 -0800. A commit that late would have been rare
# back then. A small fix like this doesn't seem like the thing I'd stay up to
# do on its own, and even if I did, I most likely would have noted it in the
# changelog as the day before.
#
# Thus, I use the time of the HTTP Last-Modified header, skewed forward to match
# the inner modification times, and in -0800.
#
# Files from pig-advanced.zip attributed to this revision:
# 2015-03-09 19:38:02 (local)  pig-advanced/
# 2015-03-09 19:38:26 (local)  pig-advanced/Script.js
# 2015-03-09 19:38:30 (local)  pig-advanced/Script.txt
git add Script.js Script.txt
commit_as_tepigmc '2015-03-09 19:45:11 -0800' 'Fixed small bug with ultra mini pig' \
  --trailer=Source:https://web.archive.org/web/20150326203916/http://pixelpapercraft.com/app/generators/minecraft/pig-advanced.zip

# The live version as of 2020-03-24 00:54:05 +0000 is identical to
# pig-advanced.zip, except Resources.js and Script.js are minified. Do not
# commit it.
#
# HTTP Last-Modified         URL
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/image/background-sprites.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005405/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/image/fold-sprites.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/image/label-sprites.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/image/title-sprites.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005403/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/Resources.js
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005403/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/Script.js
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/faithful/chainmail-armor.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/faithful/diamond-armor.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/faithful/gold-armor.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/faithful/iron-armor.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/faithful/pig.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/faithful/saddle.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/space-pig/armor.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005405/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/space-pig/pig.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005405/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/space-pig/saddle.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/tepig/audra.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/tepig/elpis.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/vanilla/chainmail-armor.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005401/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/vanilla/diamond-armor.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/vanilla/gold-armor.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005404/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/vanilla/iron-armor.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005402/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/vanilla/pig.png
# 2016-08-15 08:52:24 +0000  https://web.archive.org/web/20200324005402/http://www.pixelpapercraft.com/app/generators/minecraft/pig-advanced/texture/vanilla/saddle.png

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
git remote add base ../pig-advanced
git fetch -q base
git replace --graft "$(git rev-list --max-parents=0 HEAD)" base/main
git filter-repo -f --quiet
git remote remove base

cd ..
rm -rf pig-advanced
