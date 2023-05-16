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
