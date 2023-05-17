# HaPyLi emails

## 2023-03-31 19:50:37

From: Thalia Archibald \<thalia@archibald.dev>  
To: Cybis FDP \<cybis-fdp@hotmail.com>  
Subject: HaPyLi and the Whitespace 20th anniversary  
Date: Fri, 31 Mar 2023 13:50:37 -0600

Hello Cybis,

The 20th anniversary of the Whitespace programming language is tomorrow and I'm writing a retrospective on it. Since your language HaPyLi is the largest language that compiles to Whitespace, I'd like to talk about it, but I can't find its compiler anywhere. When your hapyli.webs.com site was archived by the Internet Archive, the compiler source was not saved. Do you still have the files for it somewhere?

Additionally, your compiler for Brainfuck, which you also wrote a Sudoku solver with, seems interesting. Did you ever publish the source for that?

Thanks,  
Thalia Archibald

## 2023-05-15 02:13:22

From: Cybis FDP \<cybis-fdp@hotmail.com>  
To: Thalia Archibald \<thalia@archibald.dev>  
Subject: Re: HaPyLi and the Whitespace 20th anniversary  
Date: Mon, 15 May 2023 02:13:22 +0000

My goodness. My apologies for the late reply since I don't use this email very often anymore. I'm guessing it's too late for the 20th anniversary. In any case... I do still have the HaPyLi interpreter, as well as the brainfuck compiler to a language I've called "CyBF" (short for Cybis Brainfuck - I've never been good at naming things).

I indeed haven't posted my HaPyLi interpreter info anywhere else since the webs.com site shut down. I've been meaning to one day, but.. well... it's a lot of work to write a complete tutorial to a programming language and I've just never gotten around to doing so.

I've attached both to this email. I think HaPyLi comes with my preliminary tutorial notes.

CyBF, however, I never wrote a tutorial for so... I'm guessing it won't be too helpful to you, but it does include the original source code to the sudoku solver and a rudimentary "CyBF Standard Library" (which includes string operations, math operations, and a List data structure) so you can see what the language looks like. CyBF uses a rather unique type system that allows for C++ style references and generics, despite Brainfuck using only unaddressable tape memory. Functions are implemented more as macros - expanded in-line, so they cannot be recursive.

Again, my apologies for abandoning these projects. One day I'll create a Github profile with everything I've made over the years - probably sooner now than later, given the interest. Thank you for your interest in them!

-Kevin

[HaPyLi.zip](checkouts/HaPyLi.zip)  
[CyBF.zip](checkouts/CyBF.zip)

## 2023-05-16 05:34:10

From: Thalia Archibald \<thalia@archibald.dev>  
To: Cybis FDP \<cybis-fdp@hotmail.com>  
Subject: Re: HaPyLi and the Whitespace 20th anniversary  
Date: Mon, 15 May 2023 21:34:10 -0600

Kevin,

Wow! I never expected to ever hear back from you. Thank you so much for the source code! This’ll be fun to play with.

I’m already thinking of porting HaPyLi to Rust and integrating it with some other Whitespace tools I’ve written. CyBF uses some interesting techniques I hadn’t considered.

To make sure it’s properly archived and accessible, I’ve converted the SVN client checkouts you sent to git repos, reconstructing as much of the history as I could, at https://github.com/wspace/cybis-hapyli and https://github.com/thaliaarchi/cybf-archive. I also resurrected and updated the HaPyLi site at https://wspace.github.io/cybis-hapyli/.

Do you by chance still have the SVN server repos? The checkouts only have the latest revision (which is already fantastic), but it would be great to have the full history. They would have been at C:\svn\{hapyli,CyBF}, according to the metadata I see.

Thanks!  
Thalia

## 2023-05-16 12:40:48

From: Cybis FDP \<cybis-fdp@hotmail.com>  
To: Thalia Archibald \<thalia@archibald.dev>  
Subject: Re: HaPyLi and the Whitespace 20th anniversary  
Date: Tue, 16 May 2023 12:40:48 +0000

I indeed do still have the svn server repos. Here you are. I've been using Tortoise SVN for years for personal projects and still do. I know it's a bit outdated by today's standard, but it still serves me well.

Thank you for all your work regarding bringing HaPyLi back to life. The github page is awesome!

If you don't mind my asking... where did you get my email address or full name from? Not that I mind and I'm thrilled you were able to reach out. It's just I don't recall attaching that information to either the esolang.org page, nor the webs site, nor the dailywtf forum. I can't imagine where else it would be.

CyBF actually compiles to an intermediate language, which I dubbed BFIL (Brainfuck Intermediate Language). It's that which ultimately gets compiled to brainfuck. I know it's a weird langauge without a tutorial, so let me know if you ever have any questions about it.

Thank you again!

-Kevin

[Hapyli.zip](repos/Hapyli.zip)  
[CyBF.zip](repos/CyBF.zip)

## 2023-05-17 20:44:05 -0600

From: Thalia Archibald \<thalia@archibald.dev>  
To: Cybis FDP \<cybis-fdp@hotmail.com>  
Subject: Re: HaPyLi and the Whitespace 20th anniversary  
Date: Wed, 17 May 2023 14:44:05 -0600

Kevin

Thanks for the repos! I’ve now rebased the two GitHub repos onto those histories. I think the git conversions have come together quite nicely, and I’ve updated HaPyLi to work with Python 3 and included other community .hpl programs.

It took a lot of sleuthing: I first heard about HaPyLi either from your page on the Esolang wiki\[0], which links to hapyli.webs.com\[1] but doesn’t mention sudoku, or from sudoku.ws in Hostile Fork’s Whitespace Collection\[2], which links to The Daily WTF\[3] but doesn’t mention HaPyLi by name. Desperate to find the HaPyLi compiler, I searched around for “hapyli” and “cybis”, but the only trace indexed by search engines was a Stack Overflow question by you\[4]. Later while reviewing the Whitespace mailing list for something else, I found your posts releasing sudoku.ws\[5] and hapyli.webs.com\[6], which show your email address. I then emailed you without success in 2020 and 2021, then was lucky this time around. I also tried emailing Marinus, who wrote the 99 bottles program\[7] and a Brainfuck interpreter\[8] in HaPyLi and may be the only other person who’s written code in HaPyLi. Yours was certainly the most difficult to track down of the 345 Whitespace projects I’ve documented in the Whitespace Corpus\[9].

I didn’t know your first or last name until you emailed with the HaPyLi code. The usage text printed in main.py has your full name and commits are signed as Kevin1 in HaPyLi and Kevin in CyBF. Anywhere online I’ve seen, you’re Cybis or Cybis FDP and, in the case of The Daily WTF, Huf Lungdung. I’ve now replaced where I had written your name in the repos and tutorial with Cybis and in the commits with Kevin \<cybis-fdp@hotmail.com>. Is that how you’d rather be referred to?

It’s fun to read through the revision history and I figure you’d enjoy what I found. It looks like HaPyLi was the first project you used Tortoise SVN with (“[r26] I love Tortoise SVN. This is so much easier to work with than VSS. It just behaves.”). And you’ve long wanted to make sudoku in Brainfuck. When posting sudoku.ws in 2009\[6], you wrote “Maybe one of these days I'll try writing a sudoku solver in Brainfuck ;)”, which was fulfilled in 2017 with CyBF (“[r76] ^_^ I did it! I finally have a Sudoku solver in Brainfuck! Umm... it's a 3.75 MB program though. LOL.”). That reminds me of some of my long-time compiler ideas for Whitespace, that are running on 5 years now and I’ll hopefully finish eventually. I’ve done a fair amount of work with Brainfuck too, but Whitespace was and still is my first love in esolangs and has pushed me into a career in programming language theory.

Thanks!  
Thalia

\[0]: https://esolangs.org/wiki/HaPyLi  
\[1]: https://web.archive.org/web/20120905174811/http://hapyli.webs.com/  
\[2]: https://github.com/hostilefork/whitespacers/blob/master/examples/sudoku.ws  
\[3]: https://what.thedailywtf.com/topic/5980/stupid-coding-tricks-sudoku-solver-in-whitespace  
\[4]: https://stackoverflow.com/questions/607830/use-of-haskell-state-monad-a-code-smell  
\[5]: https://web.archive.org/web/20131109103417/http://compsoc.dur.ac.uk:80/archives/whitespace/2009-November/000072.html  
\[6]: https://web.archive.org/web/20130926170259/http://compsoc.dur.ac.uk:80/archives/whitespace/2010-May/000075.html  
\[7]: https://www.99-bottles-of-beer.net/language-hapyli-2556.html  
\[8]: https://esolangs.org/wiki/User:Marinus/Brainfuck_interpreters#HaPyLi  
\[9]: https://github.com/wspace/corpus
