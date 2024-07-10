# Usenet posts

- Exhaustively searched:
  - [net.sources](https://usenetarchives.com/threads.php?id=net.sources)
  - [mod.sources](https://usenetarchives.com/threads.php?id=mod.sources)
- TODO:
  - net.sources.bugs: rn patches were submitted here (according to rn README)
  - [comp.sources.unix](https://usenetarchives.com/threads.php?id=comp.sources.unix)
    - [GNU AWK](https://usenetarchives.com/threads.php?id=comp.sources.unix&y=0&r=0&p=72)
  - [news.software.readers](https://usenetarchives.com/threads.php?id=news.software.readers)

usenetarchives.com has some issues:
- The list on threads.php has the dates as one day in the future and capitalizes
  the first letter of the subjects.
- Some messages are encoded incorrectly. For example ["Rn 4.3 patches 1-10"](https://usenetarchives.com/view.php?id=net.sources&mid=PDExNzhAcHVjYy1qPg)
  seems to have been interpreted as Shift JIS, as `\` from the original file has
  been encoded as UTF-8 `¥`.
- Dates incorrectly report a timezone offset of -0400/-0500 instead of UTC (see
  `base.sh:get_usenet_post_date`).

## Meta

- 1985-07-22 mod.sources: "mod.sources archive index" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDk1MUBnZW5yYWQuVVVDUD4)]
  - 1985-07-22 mod.sources: "mod.sources archive access" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDk1MkBnZW5yYWQuVVVDUD4)]
  - 1985-10-16 mod.sources: "mod.sources Archive access and Index" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDEwMDlAcGFuZGEuVVVDUD4)]
  - 1985-11-11 mod.sources: "mod.sources Archive access and Index" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDEwODlAcGFuZGEuVVVDUD4)]
  - 1985-11-14 mod.sources: "mod.sources Archive access and Index" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE4MUBidHkuVVVDUD4)]
  - 1985-12-15 mod.sources: "mod.sources Archive access and Index" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDExOThAcGFuZGEuVVVDUD4)]
  - 1986-01-13 mod.sources: "mod.sources Archive access and Index" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDEyOTdAcGFuZGEuVVVDUD4)]
  - 1986-02-15 net.sources: "mod.sources Index and archive access" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE0MTNAcGFuZGEuVVVDUD4)]
  - 1986-03-16 net.sources: "mod.sources Index and archive access" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE1MzFAcGFuZGEuVVVDUD4)]
  - 1986-05-15 mod.sources: "mod.sources Index and archive access" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE4NzVAcGFuZGEuVVVDUD4)]
  - 1986-07-02 mod.sources: "INFO01: Mod.sources index and archives" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDEyMEBtaXJyb3IuVVVDUD4)]
  - 1986-08-25 mod.sources: "v07INF1: Mod.Sources Index and Archives" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDIwMkBtaXJyb3IuVVVDUD4)]
  - 1987-01-26 mod.sources: "v08INF1: Mod.Sources Index and Archives" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE0MDdAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-01-26 mod.sources: "v08INF2: Archive access and listing" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE0MDhAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-03-18 mod.sources: "v09INF3: Change in archive sites, recent errors" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDIzODZAbWlycm9yLlRNQy5DT00%2B)]
- 1984-10-22 mod.sources: "Policy Statement" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDQxNkBnZW5yYWQuVVVDUD4)]
- 1984-11-08 net.sources: "Announcing net.wanted.sources!" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQxNzBAZGVjd3JsLlVVQ1A%2B)]
- 1985-01-09 net.sources: "archive of net.sources" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI3MUBoYXJ2YXJkLkFSUEE%2B)]
- 1986-06-06 mod.sources: "v06i001: Introduction to mod.sources (intro)" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDYxQG1pcnJvci5taXJyb3IuVVVDUD4)]
- 1999-01-31 comp.sources.unix: "v13INF1: Introduction to comp.sources.unix" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM0N0BmaWcuYmJuLmNvbT4)]
  - 1999-01-31 comp.sources.unix: "v13INF2: List of sources in the archives" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM0OEBmaWcuYmJuLmNvbT4)]
  - 1988-01-31 comp.sources.unix: "v13INF3: Listing of upcoming sources" [[gg](https://groups.google.com/g/comp.sources.unix/c/hBSmGn-1GcY)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM0OUBmaWcuYmJuLmNvbT4)]

## Regular expressions

- 1984-08-08 net.sources: "fgrep.c - new version" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI5NkBlbGVjdmF4Lk9aPg)]
- 1985-09-09 net.sources: "Yet another grep-like utility" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDExNDhAd3Vjcy5VVUNQPg)]
- 1985-12-01 mod.sources: "DECUS grep.c" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDExNDhAcGFuZGEuVVVDUD4)]
- 1986-01-19 mod.sources: "regexp(3)" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDEzMTZAcGFuZGEuVVVDUD4)]
  - 1986-02-06 mod.sources: "bug in regexp(3), and fix" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDEzNzlAcGFuZGEuVVVDUD4)]
- 1986-02-25 net.sources: "reverse grep (now sysV compatible!)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE0NThAd3Vjcy5VVUNQPg)]
- 1986-07-05 net.sources: "revgrep patch for V7 and 16-bitters" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDMyMUBtYXluYXJkLlVVQ1A%2B)]
- 1987-06-16 comp.sources.unix: "v09i061: Fastest grep around, Part01/02" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM2NUB1dW5ldC5VVS5ORVQ%2B)]
  - 1987-06-16 comp.sources.unix: "v09i062: Fastest grep around, Part02/02" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM2NkB1dW5ldC5VVS5ORVQ%2B)]

### GNU egrep

- 1989-02-09 comp.sources.unix: "v17i098: Gnu E?GREP (it's fast), Part01/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/4oVbWhUxaRg)]
  - 1989-02-09 comp.sources.unix: "v17i099: Gnu E?GREP (it's fast), Part02/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/dpRWSn5H46A)]
  - 1989-02-09 comp.sources.unix: "v17i100: Gnu E?GREP (it's fast), Part03/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/fJt0KphXDOs)]
  - 1989-02-09 comp.sources.unix: "v17i101: Gnu E?GREP (it's fast), Part04/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/I7OXvdZotuw)]
  - 1989-02-09 comp.sources.unix: "v17i102: Gnu E?GREP (it's fast), Part05/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/C6WB6daTI0g)]

## Version control

- 1983-06-08 net.sources: "diff to ed script" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDM0NUBhbGJlcnRhLlVVQ1A%2B)]
- 1983-08-26 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIzQGNmaWIuVVVDUD4)]
  - 1983-08-26 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1QGNmaWIuVVVDUD4)]
  - 1983-08-26 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI3QGNmaWIuVVVDUD4)]
  - 1983-08-27 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI5QGNmaWIuVVVDUD4)]
  - 1983-08-27 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDMxQGNmaWIuVVVDUD4)]
  - 1983-08-27 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDMzQGNmaWIuVVVDUD4)]
  - 1983-08-27 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDM1QGNmaWIuVVVDUD4)]
  - 1983-08-27 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDM3QGNmaWIuVVVDUD4)]
  - 1983-08-28 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDM5QGNmaWIuVVVDUD4)]
  - 1983-08-28 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQxQGNmaWIuVVVDUD4)]
  - 1983-08-28 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQzQGNmaWIuVVVDUD4)]
  - 1983-08-28 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ5QGNmaWIuVVVDUD4)]
  - 1983-08-28 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDU1QGNmaWIuVVVDUD4)]
  - 1983-08-29 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDYxQGNmaWIuVVVDUD4)]
  - 1983-08-29 net.sources: "SCCS to RCS convertor - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDc3QGNmaWIuVVVDUD4)]
- 1984-03-04 net.sources: "RCS source code wanted" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDU5NUBweXV4cXEuVVVDUD4)]
- 1984-12-27 net.sources: "Preprocessor to simplify usage of sccs files." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE0OUBteWFiLlVVQ1A%2B)]
- 1985-05-13 mod.sources: "checkin: editor interface for RCS logs" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgzM0BnZW5yYWQuVVVDUD4)]
  - 1985-05-14 mod.sources: "Bug in the "checkin" script" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgzNUBnZW5yYWQuVVVDUD4)]
- 1986-01-27 net.sources: "interface scripts for sccs(1)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDM1NEBnZW93aGl6LlVVQ1A%2B)]
- 1986-02-12 net.sources: "SCCS" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDg1NUBicmwtc21va2UuQVJQQT4)]
- 1986-07-03 mod.sources: "v06i040: CVS, an RCS front-end (cvs), Part1/2" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDEyMkBtaXJyb3IuVVVDUD4)]
  - 1986-07-03 mod.sources: "v06i041: CVS, an RCS fonrt-end (cvs), Part2/2" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDEyM0BtaXJyb3IuVVVDUD4)]

## Shell archive (shar)

TODO: Search "shell archiver".

Some are by James Gosling. ["Wanted: A copy of"](https://groups.google.com/g/net.sources/c/-zzuImxOlec)
discusses some of the history of shar.

- `makedist` in rn
- 1982-10-19 net.sources: "Shell archiver" [[gg](https://groups.google.com/g/net.sources/c/fdv-S8YSCTU)]
- 1982-10-24 net.sources: "Another Shell Archiver" [[gg](https://groups.google.com/g/net.sources/c/Tsk_5K33qwM]) [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=bGwxLjEyNg)]
- 1982-10-25 net.sources: "Another Shell Archiver" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PGJuZXdzLmxsMS4xMjY%2B)]
- 1984-02-29 net.sources: "shell archiver wanted - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE2MTlAcHVyLWVlLlVVQ1A%2B)]
- 1984-06-15 net.sources: "Wanted: A copy of" [[gg](https://groups.google.com/g/net.sources/c/-zzuImxOlec)]
- 1984-07-03 net.sources: "Slight revision to the shar routine" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI4MzhAZWNzdmF4LlVVQ1A%2B)]
- 1984-10-28 net.sources: "Program to un-shar netmaps without using a shell.." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ3M0B1bm12YXguVVVDUD4)]
- 1984-11-04 net.sources: "makeshar - shell archive shell script" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDExM0BjaXJjYWRpYS5VVUNQPg)]
- 1984-12-05 net.sources: "shell archiver written in C" [[gg](https://groups.google.com/g/net.sources/c/HElc1h9J9jc)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIwMzE1QHdpdmF4LlVVQ1A%2B)]
- 1984-12-08 net.sources: "shell script to generate shar files" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIwNTAwMDA0QGhwY25vZS5VVUNQPg)]
- 1984-12-11 net.sources: "yasa.c (Yet Another Shell Archiver)" [[gg](https://groups.google.com/g/net.sources/c/806UyKYWnRg)]
- 1984-12-19 net.sources: "shar--yet another shell archiver" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQwMkB0amFsay5VVUNQPg)]
- 1984-12-20 mod.sources: "The Connoisseur's Shar, version 2" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDU0MUBnZW5yYWQuVVVDUD4)]
- 1984-12-27 net.sources: "Improved Connoisseur's Shar" [[gg](https://groups.google.com/g/net.sources/c/MwCoy_jQbas)]
- 1985-01-18 net.sources: "new C version of shar" [[gg](https://groups.google.com/g/net.sources/c/7ngIFztxXhU)]
- 1985-01-18 net.sources: "new C version of shar" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEyMEB3YW5naW5zdC5VVUNQPg)]
- 1985-01-29 net.sources: "packmail and unshar: make and extract shar files" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1OUBjbXUtY3MtY2FkLkFSUEE%2B)]
  - 1985-01-30 net.sources: "fix to unshar: "quit" function" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2MEBjbXUtY3MtY2FkLkFSUEE%2B)]
- 1985-02-09 net.sources: "unshar" [[gg](https://groups.google.com/g/net.sources/c/VB7jQT1HdOQ)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1NEB0dXJpbmcuVVVDUD4)]
- 1985-06-04 mod.sources: "improved version of shar (shell archiver)" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDg3NUBnZW5yYWQuVVVDUD4)]
- 1985-07-15 mod.sources: "Update to C shar (shell archiver)" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDk0NEBnZW5yYWQuVVVDUD4)]
- 1985-07-22 mod.sources: "software "kit" generation script" [[gg](https://groups.google.com/g/mod.sources/c/ZdB1hyf3zyg)]
- 1986-03-06 net.sources: "shar request" [[gg](https://groups.google.com/g/net.sources/c/mGa0-EfAjKA)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE2MDBAYnJsLXNtb2tlLkFSUEE%2B)]
- 1986-03-11 net.sources: "New Version of Shar (shell archiver)" [[gg](https://groups.google.com/g/net.sources/c/2eA2leWlEug)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE3MjlAd2FuZ2luc3QuVVVDUD4)]
- 1986-03-13 net.sources: "shell archiver written in c" [[gg](https://groups.google.com/g/net.sources/c/WuGV3pXr5ts)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDgwMkBkaWNvbWUuVVVDUD4)]
- 1986-06-30 net.sources: "Shar for iRMX86 systems" [[gg](https://groups.google.com/g/net.sources/c/hh4vHdCCZA8)]
- 1987-02-24 net.sources: "One more SHAR program ..." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE4OEBvYml3YW4ubWlwcy5VVUNQPg)]
- 1987-03-06 net.sources: "One more SHAR, one more time ..." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE5MUBvYml3YW4ubWlwcy5VVUNQPg)]
- 1987-03-07 net.sources: "Improved shar.c for VAX/VMS to create archive files." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ4MDJAYnJsLWFkbS5BUlBBPg)]
- 1987-03-24 net.sources: ""Everyone's" shell (un)archiving tools, Part1/2" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1MjhAbWlycm9yLlRNQy5DT00%2B)]

Commentary:
- 1984-06-27 net.sources: "Put it ALL in shar format, Please! - (nf)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE1NTBAaW5tZXQuVVVDUD4)]
- 1984-07-03 net.sources: "Wanted: "shar" archiver" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI4MzNAZWNzdmF4LlVVQ1A%2B)]

## less

- 1985-06-01 net.sources: "less, a paginator" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE5OEBuc2MtcGRjLlVVQ1A%2B)]
  - 1985-06-05 net.sources: "bug in "less"" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIwM0Buc2MtcGRjLlVVQ1A%2B)]
- 1985-09-07 net.sources: "less, part 1 of 2" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ3OEBuc2MtcGRjLlVVQ1A%2B)]
  - 1985-09-07 net.sources: "less, part 2 of 2" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ3OUBuc2MtcGRjLlVVQ1A%2B)]
- 1985-11-18 net.sources: "less, part 1 of 2" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDUxNUBuc2MtcGRjLlVVQ1A%2B)]
  - 1985-11-18 net.sources: "less, part 2 of 2" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDUxNkBuc2MtcGRjLlVVQ1A%2B)]
- 1986-02-11 mod.sources: "less part 1 of 2" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE0MDBAcGFuZGEuVVVDUD4)]
  - 1986-02-11 mod.sources: "less part 2 of 2" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE0MDFAcGFuZGEuVVVDUD4)]
- 1986-08-11 mod.sources: "v06i102: New version of less (less2), Part01/02" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE5MUBtaXJyb3IuVVVDUD4)]
  - 1986-08-11 mod.sources: "v06i103: New version of less (less2), Part02/02" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE5MkBtaXJyb3IuVVVDUD4)]
- 1986-12-05 mod.sources: "v07i082: New release of LESS, Part01/03" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDcxNkBtaXJyb3IuVE1DLkNPTT4)]
  - 1986-12-05 mod.sources: "v07i083: New release of LESS, Part02/03" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDcxN0BtaXJyb3IuVE1DLkNPTT4)]
  - 1986-12-05 mod.sources: "v07i084: New release of LESS, Part03/03" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDcxOEBtaXJyb3IuVE1DLkNPTT4)]
- 1987-01-09 net.sources: "Less.arc - Full implementation of less for MS DOS" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDY1OEBrb2Rhay5VVUNQPg)]
- 1987-01-14 net.sources: "MSDOS LESS - repost with fixes to reponses to first posting" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDY2NkBrb2Rhay5VVUNQPg)]
  - 1987-01-14 net.sources: "MSDOS less source 1 of 3" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDY2N0Brb2Rhay5VVUNQPg)]
  - 1987-01-14 net.sources: "MSDOS less source 2 of 3" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDY2OEBrb2Rhay5VVUNQPg)]
  - 1987-01-14 net.sources: "MSDOS less source 3 of 3" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDY2OUBrb2Rhay5VVUNQPg)]
- 1988-09-16 comp.sources.unix: "v16i030: Less, a pager that's more than more, Part01/04" [[gg](https://groups.google.com/g/comp.sources.unix/c/hlaDjr_-Yd4)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDEwODdAZmlnLmJibi5jb20%2B)]
  - 1988-09-16 comp.sources.unix: "v16i031: Less, a pager that's more than more, Part02/04" [[gg](https://groups.google.com/g/comp.sources.unix/c/ZoYoBcLzFOU)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDEwODhAZmlnLmJibi5jb20%2B)]
  - 1988-09-16 comp.sources.unix: "v16i032: Less, a pager that's more than more, Part03/04" [[gg](https://groups.google.com/g/comp.sources.unix/c/RXkrIroGnjA)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDEwODlAZmlnLmJibi5jb20%2B)]
  - 1988-09-16 comp.sources.unix: "v16i033: Less, a pager that's more than more, Part04/04" [[gg](https://groups.google.com/g/comp.sources.unix/c/BjrKAVIHPBk)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDEwOTBAZmlnLmJibi5jb20%2B)]

## Larry Wall

Searched "Larry Wall" in net.sources and mod.sources. Many posts use patch and
several use Configure or makekit.

TODO: Search "lwall".

### Perl

TODO: Search comp.sources.unix.

- 1988-01-31 comp.sources.unix: "v13INF3: Listing of upcoming sources" [[gg](https://groups.google.com/g/comp.sources.unix/c/hBSmGn-1GcY)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM0OUBmaWcuYmJuLmNvbT4)]
- 1988-02-01 comp.sources.unix: "v13i001: Perl, a "replacement" for awk and sed, Part01/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/Njx6b6TiZos)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM1MEBmaWcuYmJuLmNvbT4)]
  - 1988-02-01 comp.sources.unix: "v13i002: Perl, a "replacement" for awk and sed, Part02/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/tcg-t9-DE9U)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM1MUBmaWcuYmJuLmNvbT4)]
  - 1988-02-01 comp.sources.unix: "v13i003: Perl, a "replacement" for awk and sed, Part03/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/iol2j_zxstk)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM1MkBmaWcuYmJuLmNvbT4)]
  - 1988-02-01 comp.sources.unix: "v13i004: Perl, a "replacement" for awk and sed, Part04/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/ZLrkdzCXxbU)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM1M0BmaWcuYmJuLmNvbT4)]
  - 1988-02-01 comp.sources.unix: "v13i005: Perl, a "replacement" for awk and sed, Part05/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/pEymR1BK5W4)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM1NEBmaWcuYmJuLmNvbT4)]
  - 1988-02-02 comp.sources.unix: "REPOST v13i006: Perl, a "replacement" for awk and sed, Part06/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/nXiU2B36bT0)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM2MUBmaWcuYmJuLmNvbT4)]
  - 1988-02-02 comp.sources.unix: "v13i006: Perl, a "replacement" for awk and sed, Part06/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/RrOSDV8xPVI)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM1NkBmaWcuYmJuLmNvbT4)]
  - 1988-02-02 comp.sources.unix: "v13i007: Perl, a "replacement" for awk and sed, Part07/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/JnBT64wRuds)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM1N0BmaWcuYmJuLmNvbT4)]
  - 1988-02-02 comp.sources.unix: "v13i008: Perl, a "replacement" for awk and sed, Part08/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/8J4W62lJf0I)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM1OEBmaWcuYmJuLmNvbT4)]
  - 1988-02-02 comp.sources.unix: "v13i009: Perl, a "replacement" for awk and sed, Part09/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/SPOfUSr-tlg)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM1OUBmaWcuYmJuLmNvbT4)]
  - 1988-02-02 comp.sources.unix: "v13i010: Perl, a "replacement" for awk and sed, Part10/10" [[gg](https://groups.google.com/g/comp.sources.unix/c/-_8EvvTePWg)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM2MEBmaWcuYmJuLmNvbT4)]
  - 1988-02-03 comp.sources.unix: "v13i011: Perl patches 1 to 5, Patch1-Patch5" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM2NEBmaWcuYmJuLmNvbT4)]
  - 1988-02-03 comp.sources.unix: "v13i012: Perl patches 6 to 10, Patch6-Patch10" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM2NUBmaWcuYmJuLmNvbT4)]
  - 1988-02-03 comp.sources.unix: "v13i013: Forwarded posting of perl code" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM2NkBmaWcuYmJuLmNvbT4)]

### rn

- 1984-09-24 net.sources: "rn version 4.1 distribution kit (part 1 of 8)" [[gg](https://groups.google.com/g/net.sources/c/xUGB_4Meno8)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzJAc2RjcmRjZi5VVUNQPg)]
  - 1984-09-24 net.sources: "rn version 4.1 distribution kit (part 2 of 8)" [[gg](https://groups.google.com/g/net.sources/c/XUBHx73xK7s)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzNAc2RjcmRjZi5VVUNQPg)]
  - 1984-09-24 net.sources: "rn version 4.1 distribution kit (part 3 of 8)" [[gg](https://groups.google.com/g/net.sources/c/X78CZnttHqg)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzRAc2RjcmRjZi5VVUNQPg)]
  - 1984-09-24 net.sources: "rn version 4.1 distribution kit (part 4 of 8)" [[gg](https://groups.google.com/g/net.sources/c/U8wjLYgZ9XQ)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzVAc2RjcmRjZi5VVUNQPg)]
  - 1984-09-24 net.sources: "rn version 4.1 distribution kit (part 5 of 8)" [[gg](https://groups.google.com/g/net.sources/c/9MA0hI3j4iI)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzZAc2RjcmRjZi5VVUNQPg)]
  - 1984-09-24 net.sources: "rn version 4.1 distribution kit (part 6 of 8)" [[gg](https://groups.google.com/g/net.sources/c/FFbGY5bbixE)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzdAc2RjcmRjZi5VVUNQPg)]
  - 1984-09-24 net.sources: "rn version 4.1 distribution kit (part 7 of 8)" [[gg](https://groups.google.com/g/net.sources/c/iLF8GYR36k8)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzhAc2RjcmRjZi5VVUNQPg)]
  - 1984-09-24 net.sources: "rn version 4.1 distribution kit (part 8 of 8)" [[gg](https://groups.google.com/g/net.sources/c/g8oUj9EgApA)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzMzlAc2RjcmRjZi5VVUNQPg)]
  - 1984-10-02 net.sources: "Rn version 4.1, part 1 of 8 (reposting 1,2,3 & 7)" [[gg](https://groups.google.com/g/net.sources/c/p2xTPnQh6sQ)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzNThAc2RjcmRjZi5VVUNQPg)]
    - 1984-10-02 net.sources: "Rn version 4.1, part 2 of 8 (reposting 1,2,3 & 7)" [[gg](https://groups.google.com/g/net.sources/c/3w8gZYKS02M)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzNTlAc2RjcmRjZi5VVUNQPg)]
    - 1984-10-02 net.sources: "Rn version 4.1, part 3 of 8 (reposting 1,2,3 & 7)" [[gg](https://groups.google.com/g/net.sources/c/dCjBcwDPyb8)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzNjBAc2RjcmRjZi5VVUNQPg)]
    - 1984-10-02 net.sources: "Rn version 4.1, part 7 of 8 (reposting 1,2,3 & 7)" [[gg](https://groups.google.com/g/net.sources/c/hHYCzXxBOgM)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzNjFAc2RjcmRjZi5VVUNQPg)]
    - 1984-10-12 net.sources: "Rn version 4.1, part 4 of 8 (reposting 4,5,6 & 8)" [[gg](https://groups.google.com/g/net.sources/c/Tkqkku7ZBEk)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzODBAc2RjcmRjZi5VVUNQPg)]
      - 1984-10-12 net.sources: "Rn version 4.1, part 5 of 8 (reposting 4,5,6 & 8)" [[gg](https://groups.google.com/g/net.sources/c/62ZXjeZm0f8)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzODFAc2RjcmRjZi5VVUNQPg)]
      - 1984-10-12 net.sources: "Rn version 4.1, part 8 of 8 (reposting 4,5,6 & 8)" [[gg](https://groups.google.com/g/net.sources/c/KeJfnIciMiM)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzODJAc2RjcmRjZi5VVUNQPg)]
      - 1984-10-12 net.sources: "Rn version 4.1, part 6 of 8 (reposting 4,5,6 & 8)" [[gg](https://groups.google.com/g/net.sources/c/rJ0gSE1Gh1o)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzODNAc2RjcmRjZi5VVUNQPg)]
  - 1984-10-27 net.sources: "rn - part 1 of 8 (reposting)" [[gg](https://groups.google.com/g/net.sources/c/DqlXZWh1TUw)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDc4NUBydS1jczQ0LlVVQ1A%2B)]
- 1985-05-09 mod.sources: "The REAL rn (rn 4.3 - part 0 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/ZGohbRfEi2w)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgxOUBnZW5yYWQuVVVDUD4)]
  - 1985-05-09 mod.sources: "rn version 4.3 (kit 1 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/hJok66uiWTU)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyMUBnZW5yYWQuVVVDUD4)]
  - 1985-05-10 mod.sources: "rn version 4.3 (kit 2 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/H7mx3N-0jk4)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyMkBnZW5yYWQuVVVDUD4)]
  - 1985-05-10 mod.sources: "rn version 4.3 (kit 3 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/27eQUTed3J0)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyM0BnZW5yYWQuVVVDUD4)]
  - 1985-05-10 mod.sources: "rn version 4.3 (kit 4 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/QzOejfSBrdQ)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyNUBnZW5yYWQuVVVDUD4)]
  - 1985-05-11 mod.sources: "rn version 4.3 (kit 5 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/hvSc-jCBMmY)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyNkBnZW5yYWQuVVVDUD4)]
  - 1985-05-11 mod.sources: "rn version 4.3 (kit 6 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/RM9voSBl-98)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyN0BnZW5yYWQuVVVDUD4)]
  - 1985-05-12 mod.sources: "rn version 4.3 (kit 7 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/WAihOBJZf7A)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyOEBnZW5yYWQuVVVDUD4)]
  - 1985-05-12 mod.sources: "rn version 4.3 (kit 8 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/jLfBDURu-_8)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgyOUBnZW5yYWQuVVVDUD4)]
  - 1985-05-12 mod.sources: "rn version 4.3 (kit 9 of 9)" [[gg](https://groups.google.com/g/mod.sources/c/0xMLaQS6V5s)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgzMEBnZW5yYWQuVVVDUD4)]
- 1986-05-09 net.sources: "Rn 4.3 patches 1-10" [[gg](https://groups.google.com/g/net.sources/c/ELYIv7jkrZs)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDExNzhAcHVjYy1qPg)]
- 1986-05-21 net.sources: "news 2.10.3, rn 4.3 available via ftp" [[gg](https://groups.google.com/g/net.sources/c/wde6DwHjCdQ)] [not in ua]

Unrelated:
- 1985-05-03 net.sources: "rn - A new and improved newsreader with an old name." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI5OUB1Y3NiY3NsLlVVQ1A%2B)]

### patch

- 1984-11-09 net.sources: "A patch applier--YOU WANT THIS!!!" [[gg](https://groups.google.com/g/net.sources/c/XjZSNCpCuDU)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE0NTdAc2RjcmRjZi5VVUNQPg)]
- 1984-11-29 net.sources: "patch version 1.2--YOU WANT THIS" [[gg](https://groups.google.com/g/net.sources/c/uWFr9NOp_fw)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE1MDhAc2RjcmRjZi5VVUNQPg)]
- 1985-05-08 mod.sources: "patch version 1.3" [[gg](https://groups.google.com/g/mod.sources/c/xSQM63e39YY)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDgxM0BnZW5yYWQuVVVDUD4)]
- 1985-05-20 net.sources: "Request for patch -- used by L. Wall to patch rn" [[gg](https://groups.google.com/g/net.sources/c/ABnfTszF-zQ)]
- 1985-05-24 net.sources: "I'm PATCH 1.3, save me, save me!" [[gg](https://groups.google.com/g/net.sources/c/qtfVio1sSHs)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIwMjFAc2RjcmRjZi5VVUNQPg)]
- 1986-08-02 net.sources: "patch version 1.5, kit 1 of 2" [[gg](https://groups.google.com/g/net.sources/c/9nIzZAUp-J4)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI5MjJAc2RjcmRjZi5VVUNQPg)]
  - 1986-08-02 net.sources: "patch version 1.5, part 2 of 2" [[gg](https://groups.google.com/g/net.sources/c/dxBWkSO1OgQ)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI5MjNAc2RjcmRjZi5VVUNQPg)]
  - 1986-08-05 net.sources: "tail of patch 1.5, kit 1 of 2" [[gg](https://groups.google.com/g/net.sources/c/m-VhmtV6AWQ)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI5MzBAc2RjcmRjZi5VVUNQPg)]
- 1986-10-27 mod.sources: "v07i038: Release 2.0 of patch, Part01/03" [[gg](https://groups.google.com/g/mod.sources/c/ylwY2Ly5chY)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDUxM0BtaXJyb3IuVVVDUD4)]
  - 1986-10-27 mod.sources: "v07i039: Release 2.0 of patch, Part02/03" [[gg](https://groups.google.com/g/mod.sources/c/byPb-78moQM)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDUxNEBtaXJyb3IuVVVDUD4)]
  - 1986-10-27 mod.sources: "v07i040: Release 2.0 of patch, Part03/03" [[gg](https://groups.google.com/g/mod.sources/c/xfI2kfZXNN8)] [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDUxNUBtaXJyb3IuVVVDUD4)]
  - 1987-01-18 net.sources: "Patch patch #5" [[gg](https://groups.google.com/g/net.sources/c/wEMtxZUaFhc)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDExOUBlbXMuVVVDUD4)]

Projects using patch:
- 1985-09-07 net.sources: "Mods to 4.2 ps to show open files" [[gg](https://groups.google.com/g/net.sources/c/ZpdYsQOQ9fM)]
- 1986-03-11 net.sources: "RFS: release #2, shar 1 of 7 (kernel-resident distributed file system)" [[gg](https://groups.google.com/g/net.sources/c/6ZD3uu8KBTI)]
- 1986-09-14 net.sources: "Graphics for C-Prolog on the SUN" [[gg](https://groups.google.com/g/net.sources/c/VHtlR6_k7LM)]
- 1987-01-30 net.sources: "sp - soundex-based spelling aid" [[gg](https://groups.google.com/g/net.sources/c/zJ5LFpkIsJI)]

### configure

Searched "Larry Wall's Configure generator" in comp.sources.unix.

- 1988-10-14 comp.sources.unix: "v16i034: Larry Wall's Configure generator, etc., Part01/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/Fl0Edw3aIH4)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDExMThAZmlnLmJibi5jb20%2B)]
  - 1988-10-14 comp.sources.unix: "v16i035: Larry Wall's Configure generator, etc., Part02/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/kviF9IZIvco)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDExMTlAZmlnLmJibi5jb20%2B)]
  - 1988-10-14 comp.sources.unix: "v16i036: Larry Wall's Configure generator, etc., Part03/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/AEsyBKPrmlg)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDExMjBAZmlnLmJibi5jb20%2B)]
  - 1988-10-14 comp.sources.unix: "v16i037: Larry Wall's Configure generator, etc., Part04/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/bBmMW0xqNvg)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDExMjFAZmlnLmJibi5jb20%2B)]
  - 1988-10-14 comp.sources.unix: "v16i038: Larry Wall's Configure generator, etc., Part05/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/rvG1B_zQRmE)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDExMjJAZmlnLmJibi5jb20%2B)]
  - 1988-10-17 comp.sources.unix: "v16i039: Larry Wall's Configure generator, etc., Part06/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/SkYK-egUrU8)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDExMjRAZmlnLmJibi5jb20%2B)]
  - 1988-10-17 comp.sources.unix: "v16i040: Larry Wall's Configure generator, etc., Part07/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/FaphovE-t58)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDExMjVAZmlnLmJibi5jb20%2B)]
  - 1988-10-17 comp.sources.unix: "v16i041: Larry Wall's Configure generator, etc., Patch1" [[gg](https://groups.google.com/g/comp.sources.unix/c/JAfesm35zfg)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDExMjZAZmlnLmJibi5jb20%2B)]
  - 1988-10-17 comp.sources.unix: "v16i042: Larry Wall's Configure generator, etc., Patch2" [[gg](https://groups.google.com/g/comp.sources.unix/c/iXHOJhQuMD8)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDExMjdAZmlnLmJibi5jb20%2B)]

### warp

Searched "warp" in net.sources, mod.sources, and comp.sources.unix.

- 1983-05-06 net.sources: "warp distribution kit" [[gg](https://groups.google.com/g/net.sources/c/nZISHbQYQdE)]
- 1984-05-13 net.sources: "\*\*\* NEW GAME \*\*\* - (nf)" [[gg](https://groups.google.com/g/net.sources/c/MzprpxZMQ6k)]
- 1983-08-12 net.sources: "warp 6.0 distribution kit, finally" [[gg](https://groups.google.com/g/net.sources/c/Nyiyut1io5o)]
- 1983-08-16 net.sources: "warp 6.0" [[gg](https://groups.google.com/g/net.sources/c/mbniIH0u1eo)]
- 1983-08-17 net.sources: "Help on WARP make" [[gg](https://groups.google.com/g/net.sources/c/yfr2SidZcNM)]
- 1983-08-23 net.sources: "Warp for folks w/o FIONREAD" [[gg](https://groups.google.com/g/net.sources/c/qJnktqO64Mc)]
- 1983-08-23 net.sources: "Warp 6.0" [[gg](https://groups.google.com/g/net.sources/c/RrxeH5cDmvc)]
- 1983-08-25 net.sources: "problems with new warp 6.0" [[gg](https://groups.google.com/g/net.sources/c/dpGwsRrGF5I)]
- 1983-08-26 net.sources: "New warp fix" [[gg](https://groups.google.com/g/net.sources/c/k0P5iJ8Dtrk)]
- 1983-08-26 net.sources: "missing parts of warp - (nf)" [[gg](https://groups.google.com/g/net.sources/c/jV8whC3e6dQ)]
- 1983-08-29 net.sources: "Some gripes about WARP (Estes Version)" [[gg](https://groups.google.com/g/net.sources/c/eQsRurc7VWY)]
- 1983-08-31 net.sources: "WARP fix that works !" [[gg](https://groups.google.com/g/net.sources/c/iYOhS9EH910)]
- 1983-08-31 net.sources: "A warp fix fix (and an apology)" [[gg](https://groups.google.com/g/net.sources/c/Lw96IZhmZaw)]
- 1084-07-22 net.sources: "Termcap fix for warp" [[gg](https://groups.google.com/g/net.sources/c/oNekht_wfvc)]
- 1986-10-22 net.sources: "Beta testers wanted for warp 7.0" [[gg](https://groups.google.com/g/net.sources/c/LhResGK2RUw)]

Mentions warp:
- 1985-09-20 net.sources: "Trouble with visual strek" [[gg](https://groups.google.com/g/net.sources/c/13Jy4lK42TM)]

### Misc

- 1984-10-03 net.sources: "Auto-configuring software -- potential problems" [[gg](https://groups.google.com/g/net.sources/c/kUBpHTTXa7Q)]
- 1986-10-11 net.sources: "Next MEP shar" [[gg](https://groups.google.com/g/net.sources/c/wP5fFkeeRO4)]
- 1987-03-11 mod.sources: "v09i020: Previous "obfuscated C" winners" [[gg](https://groups.google.com/g/mod.sources/c/fd8bRu9GT4I)]
- 1987-04-15 net.sources: "A network library for non-guru's (REAL SOURCE!)" [[gg](https://groups.google.com/g/net.sources/c/KfpbjEW_Md0)]

## James Gosling

Searched "James Gosling" in net.sources, mod.sources, and comp.sources.unix.

### Gosling Emacs

TODO: Search "Gosling Emacs".
TODO: Figure out his UUCP address for searching.

["Emacs/EDT hybrid"](https://groups.google.com/g/net.sources/c/8Au6-Zqjnac)
mentions "James Gosling's CMU Emacs". Perhaps that what it was initially called.

Mentions Gosling:
- 1983-08-22 net.sources: "Emacs upgrade part 2" [[gg](https://groups.google.com/g/net.sources/c/DoZqKpo6HLo)]
- 1983-08-28 net.sources: "Emacs mods: #4" [[gg](https://groups.google.com/g/net.sources/c/-SarJyiSPC8)]
- 1983-08-31 net.sources: "Emacs mods: #5" [[gg](https://groups.google.com/g/net.sources/c/PZX0xb-pOOo)]
- 1984-02-13 net.sources: "Emacs/EDT hybrid" [[gg](https://groups.google.com/g/net.sources/c/8Au6-Zqjnac)]
- 1987-01-27 mod.sources: "v08i008: A Micro-Emacs variant that resembles GNU Emacs" [[gg](https://groups.google.com/g/mod.sources/c/vAmnrWiN1_4)]

Lisp code for Gosling Emacs:
- 1982-10-25 net.sources: "Gosling Emacs incremental search package" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=dXRhaC1jcy4xMTQ3)]
  - 1982-10-27 net.sources: "Gosling Emacs incremental search package" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PGJuZXdzLnV0YWgtY3MuMTE0Nz4)]

### sc spreadsheet

Searched "sc spreadsheet" and "sc spread sheet" in net.sources, mod.sources, and
comp.sources.unix.

TODO: Search in net.sources and mod.sources.

- 1987-01-26 net.sources: "Sc 3.1 (1 of 2) spread sheet" [[gg](https://groups.google.com/g/net.sources/c/DYDQdT_QWRE)]
- 1987-08-18 comp.sources.unix: "v11i017: Spread sheet program, sc 4.1, Part01/03" [[gg](https://groups.google.com/g/comp.sources.unix/c/eKQF8BNlIJY)]
  - 1987-08-18 comp.sources.unix: "v11i018: Spread sheet program, sc 4.1, Part02/03" [[gg](https://groups.google.com/g/comp.sources.unix/c/547tGK5ozQw)]
  - 1987-08-18 comp.sources.unix: "v11i019: Spread sheet program, sc 4.1, Part03/03" [[gg](https://groups.google.com/g/comp.sources.unix/c/8KgzqvIqthQ)]
- 1988-01-31 comp.sources.unix: "v13INF3: Listing of upcoming sources" [[gg](https://groups.google.com/g/comp.sources.unix/c/hBSmGn-1GcY)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM0OUBmaWcuYmJuLmNvbT4)]
- 1988-02-04 comp.sources.unix: "v13i018: SC spreadsheet program, version 5.1, Part03/03" [[gg](https://groups.google.com/g/comp.sources.unix/c/Orc6yMVPgZA)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM3MEBmaWcuYmJuLmNvbT4)]
  - 1988-02-04 comp.sources.unix: "v13i016: SC spreadsheet program, version 5.1, Part01/03" [[gg](https://groups.google.com/g/comp.sources.unix/c/1bkc690PMQU)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM3MUBmaWcuYmJuLmNvbT4)]
  - 1988-02-04 comp.sources.unix: "v13i017: SC spreadsheet program, version 5.1, Part02/03" [[gg](https://groups.google.com/g/comp.sources.unix/c/82is1yQy640)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM3MkBmaWcuYmJuLmNvbT4)]
- 1989-03-21 comp.sources.unix: "v18i045: SC spreadsheet, version 6.1, Part01/04" [[ua](https://groups.google.com/g/comp.sources.unix/c/bttEoGdsEhU)]
  - 1989-03-21 comp.sources.unix: "v18i046: SC spreadsheet, version 6.1, Part02/04" [[ua](https://groups.google.com/g/comp.sources.unix/c/u6y62Qxyuqo)]
  - 1989-03-21 comp.sources.unix: "v18i047: SC spreadsheet, version 6.1, Part03/04" [[ua](https://groups.google.com/g/comp.sources.unix/c/wLij0Z1StOg)]
  - 1989-03-21 comp.sources.unix: "v18i048: SC spreadsheet, version 6.1, Part04/04" [[ua](https://groups.google.com/g/comp.sources.unix/c/Xt4x4sdexbY)]
- 1990-09-04 comp.sources.unix: "v23i021: The SC Spreadsheet, release 6.8, Part01/06" [[ua](https://groups.google.com/g/comp.sources.unix/c/4sJ8FTuhhJs)]
  - 1990-09-04 comp.sources.unix: "v23i022: The SC Spreadsheet, release 6.8, Part02/06" [[ua](https://groups.google.com/g/comp.sources.unix/c/KDXClPpvl_E)]
  - 1990-09-04 comp.sources.unix: "v23i023: The SC Spreadsheet, release 6.8, Part03/06" [[ua](https://groups.google.com/g/comp.sources.unix/c/HmTdWzxZJHs)]
  - 1990-09-04 comp.sources.unix: "v23i024: The SC Spreadsheet, release 6.8, Part04/06" [[ua](https://groups.google.com/g/comp.sources.unix/c/ARh-93h7ZHI)]
  - 1990-09-04 comp.sources.unix: "v23i025: The SC Spreadsheet, release 6.8, Part05/06" [[ua](https://groups.google.com/g/comp.sources.unix/c/J1jxehooPHk)]
  - 1990-09-04 comp.sources.unix: "v23i026: The SC Spreadsheet, release 6.8, Part06/06" [[ua](https://groups.google.com/g/comp.sources.unix/c/WB_68qDDLzo)]

#### vc spreadsheet

- 1985-01-01 net.sources: "Unix `vc' spreadsheet." [[gg](https://groups.google.com/g/net.sources/c/yZE-hLkRyYk)]
- 1985-01-18 net.sources: "vc documentation" [[gg](https://groups.google.com/g/net.sources/c/uusfgEJ9IgU)]
- 1985-01-22 net.sources: "vc (registered trademark, SII)" [[gg](https://groups.google.com/g/net.sources/c/A0FuxWBWCZc)]
  - 1985-01-23 net.sources: "vc (registered trademark, SII) or ATT System V???" [[gg](https://groups.google.com/g/net.sources/c/h79pKU4oksQ)]
- 1985-05-08 net.sources: "vc hacks" [[gg](https://groups.google.com/g/net.sources/c/9ygkAkOMh_w)]
- 1987-01-05 net.sources: "VC 2.1 - Part 1 of 2" [[gg](https://groups.google.com/g/net.sources/c/GyJb1ayDY1c)]
  - 1987-01-05 net.sources: "VC Part 2 of 2" [[gg](https://groups.google.com/g/net.sources/c/dN2GONb2TDI)]
- 1987-01-08 net.sources: "VC" [[gg](https://groups.google.com/g/net.sources/c/VnPibHgSuGY)]
- 1987-01-17 net.sources: "Trimmed down spread sheet program for U**X/VMS/AMIGA, happy taxes!" [[gg](https://groups.google.com/g/net.sources/c/Qxi2mMlxSQM)]

### Window

- 1983-07-01 net.sources: "Window source #0 [of 7]: misc files, header files" [[gg](https://groups.google.com/g/net.sources/c/d5R4bveOheg)]
  - 1983-07-01 net.sources: "Window sources #1 [of 0-7]: Terminal drivers (excl. TrmTERM)" [[gg](https://groups.google.com/g/net.sources/c/7TWQZ6CFWqI)]
  - 1983-07-03 net.sources: "Window source #3 [of 0-7]: misc source" [[gg](https://groups.google.com/g/net.sources/c/zq-fW05S7uI)]
  - 1983-07-03 net.sources: "Window source #4 [of 0-7]: display.c" [[gg](https://groups.google.com/g/net.sources/c/hqm-snR_KbU)]
  - 1983-07-03 net.sources: "Window source #5 [of 0-7]: misc source" [[gg](https://groups.google.com/g/net.sources/c/XGWnaQcT9xA)]
  - 1983-07-03 net.sources: "Window source #7 [of 0-7]: TrmTERM.c" [[gg](https://groups.google.com/g/net.sources/c/SiuNpgYwRxw)]
  - 1983-07-06 net.sources: "Window doc #1 [of 0-2]" [[gg](https://groups.google.com/g/net.sources/c/4APmcU0E6qo)]
- 1983-07-14 net.sources: "Windows bug fixes" [[gg](https://groups.google.com/g/net.sources/c/f0XJrZ7nRng)]
- 1983-08-08 net.sources: "Window fixes for SIGTSTP problem" [[gg](https://groups.google.com/g/net.sources/c/GBiBtLGC3cs)]

### shar

See above (intermixed).

### Misc

Mentions:
- 1982-08-20 net.sources: "new mx2.c" [[gg](https://groups.google.com/g/net.sources/c/xQLKxStNBeQ)]
- 1982-09-12 net.sources: "New mx2.c from mit-vax!mp - (nf)" [[gg](https://groups.google.com/g/net.sources/c/kncI5ht-3_A)]
- 1983-02-10 net.sources: "LIST-OF-LISTS" [[gg](https://groups.google.com/g/net.sources/c/14SnL_MM1Q8)]
- 1983-04-12 net.sources: "New LIST-OF-LISTS" [[gg](https://groups.google.com/g/net.sources/c/XddU-f_UFDM)]
- 1983-05-12 net.sources: "LIST-OF-LISTS" [[gg](https://groups.google.com/g/net.sources/c/VBC0xqdshMc)]
- 1983-07-06 net.sources: "New LIST-OF-LISTS" [[gg](https://groups.google.com/g/net.sources/c/rU_YBp1_EAw)]
- 1986-03-16 net.sources: "JARGON in ditroff format, 4 of 4" [[gg](https://groups.google.com/g/net.sources/c/TvLb-kFniz4)]

## tar

- 1984-11-29 net.sources: "Improved ansitar -- ansi tape utility" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDY2OEBhbWQuVVVDUD4)]
- 1985-07-08 mod.sources: "Diffs to tar to use a remote system's tape drive" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDkzNUBnZW5yYWQuVVVDUD4)]
- 1986-03-17 net.sources: "VMS <-> Unix tape transfer" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDUwQG1hbi5jcy51eHVrLmFjLj4)]
- 1986-12-10 mod.sources: "v07i088: Public-domain TAR program" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDc3MkBtaXJyb3IuVE1DLkNPTT4)]
- 1987-03-03 mod.sources: "v08i099: ANSI tape program, Part01/02" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDIwNjBAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-03-03 mod.sources: "v08i100: ANSI tape program, Part02/02" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDIwNjFAbWlycm9yLlRNQy5DT00%2B)]

## Compress

- 1984-07-05 net.sources: "File compression utility" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDExMzFAdXRhaC1nci5VVUNQPg)]
- 1985-01-03 mod.sources: "Compress release 3.0" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDU3OEBnZW5yYWQuVVVDUD4)]
- 1985-08-01 mod.sources: "Compress 4.0 (part 0 of 2)" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDk5M0BnZW5yYWQuVVVDUD4)]
  - 1985-08-01 mod.sources: "Compress 4.0 (part 0 of 2)" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDk5NEBnZW5yYWQuVVVDUD4)]
  - 1985-08-01 mod.sources: "Compress 4.0 (part 1 of 2)" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDk5NUBnZW5yYWQuVVVDUD4)]
  - 1985-08-01 mod.sources: "Compress 4.0 (part 2 of 2)" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDk5NkBnZW5yYWQuVVVDUD4)]
- 1986-07-07 net.sources: "Compress for MS-DOS, part 1/2" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE3OTNAZWNzdmF4LlVVQ1A%2B)]
- 1986-07-12 net.sources: "Compress 4.0 for MS-DOS" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDYxOEBnY2MtbWlsby5BUlBBPg)]

## ARC

- 1986-01-25 net.sources: "ARC Archiver for MS-DOS" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDE5MzNAYnJsLXRnci5BUlBBPg)]
- 1986-01-31 net.sources: "MS-DOS ARC version 5" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIyNkBoYWRyb24uVVVDUD4)]
- 1986-07-21 net.sources: "ARC version 5.12 (uuencoded)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDMxNDFAdXRjc3JpLlVVQ1A%2B)]
- 1986-07-22 net.sources: "ARC 5.12 Sources (ARC'd with arc 5.12)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDMxNDZAdXRjc3JpLlVVQ1A%2B)]
- 1986-08-04 net.sources: "ARC for BSD4.2 (part 1 of 5)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ1NUBpbWFnZW4uVVVDUD4)]
  - 1986-08-04 net.sources: "ARC for BSD4.2 (part 2 of 5)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ1NkBpbWFnZW4uVVVDUD4)]
  - 1986-08-04 net.sources: "ARC for BSD4.2 (part 3 of 5)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ1N0BpbWFnZW4uVVVDUD4)]
  - 1986-08-04 net.sources: "ARC for BSD4.2 (part 4 of 5)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ1OEBpbWFnZW4uVVVDUD4)]
  - 1986-08-04 net.sources: "ARC for BSD4.2 (optional part 5 of 5)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQ1OUBpbWFnZW4uVVVDUD4)]
- 1986-09-18 net.sources: "ARC diffs for UNIX BSD" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDY4OUBiY3NhaWMuVVVDUD4)]
- 1986-09-30 net.sources: "Arc.shar.01" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDExMUBqcHVzYTEuVVVDUD4)]
  - 1986-09-30 net.sources: "Arc.shar.02" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDExMkBqcHVzYTEuVVVDUD4)]
  - 1986-09-30 net.sources: "Arc.shar.03" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDExM0BqcHVzYTEuVVVDUD4)]
  - 1986-09-30 net.sources: "Arc.shar.04" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDExNEBqcHVzYTEuVVVDUD4)]
- 1986-12-16 net.sources: "Public-domain ARC extraction tool" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDg4OEBwZXRzZC5VVUNQPg)]
- 1987-01-13 net.sources: "BSD ARC utility: Part 1 of 3." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIzMTJAdXNjZWFzdC5VVUNQPg)]
  - 1987-01-13 net.sources: "BSD ARC utility: Part 2 of 3." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIzMTNAdXNjZWFzdC5VVUNQPg)]
  - 1987-01-13 net.sources: "BSD ARC utility: Part 3 of 3." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIzMTRAdXNjZWFzdC5VVUNQPg)]
- 1987-02-02 net.sources: "ARC for System V R2 (1 of 3)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDU0MUBjc3VuLlVVQ1A%2B)]
  - 1987-02-02 net.sources: "ARC for System V R2 (2 of 3)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDU0MkBjc3VuLlVVQ1A%2B)]
- 1987-02-20 net.sources: "Changes to arc for 286 System V" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQyMEBwcmFpcmllLlVVQ1A%2B)]
- 1987-04-04 net.sources: "ARC bug, all UNIX versions" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDIyODlAbmNvYXN0LlVVQ1A%2B)]

## JOVE text editor

(Has regular expression search)

- 1987-02-03 mod.sources: "v08i020: The JOVE text editor, Part01/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NDBAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-03 mod.sources: "v08i021: The JOVE text editor, Part02/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NDFAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-03 mod.sources: "v08i022: The JOVE text editor, Part03/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NDJAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i023: The JOVE text editor, Part04/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NDNAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i024: The JOVE text editor, Part05/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NDRAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i025: The JOVE text editor, Part06/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NDVAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i026: The JOVE text editor, Part07/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NTdAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i027: The JOVE text editor, Part08/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NThAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i028: The JOVE text editor, Part09/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NTlAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i029: The JOVE text editor, Part10/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NjFAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i030: The JOVE text editor, Part11/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NjJAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i031: The JOVE text editor, Part12/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NjNAbWlycm9yLlRNQy5DT00%2B)]
  - 1987-02-04 mod.sources: "v08i032: The JOVE text editor, Part13/13" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDE1NjRAbWlycm9yLlRNQy5DT00%2B)]
- 1988-04-25 comp.sources.unix: "v14i057: Jove, an emacs variant, version 4.9, Part01/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY1OUBmaWcuYmJuLmNvbT4)]
  - 1988-04-25 comp.sources.unix: "v14i058: Jove, an emacs variant, version 4.9, Part02/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY2MEBmaWcuYmJuLmNvbT4)]
  - 1988-04-25 comp.sources.unix: "v14i059: Jove, an emacs variant, version 4.9, Part03/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY2MUBmaWcuYmJuLmNvbT4)]
  - 1988-04-25 comp.sources.unix: "v14i060: Jove, an emacs variant, version 4.9, Part04/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY2MkBmaWcuYmJuLmNvbT4)]
  - 1988-04-25 comp.sources.unix: "v14i061: Jove, an emacs variant, version 4.9, Part05/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY2M0BmaWcuYmJuLmNvbT4)]
  - 1988-04-26 comp.sources.unix: "v14i062: Jove, an emacs variant, version 4.9, Part06/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY2NUBmaWcuYmJuLmNvbT4)]
  - 1988-04-26 comp.sources.unix: "v14i063: Jove, an emacs variant, version 4.9, Part07/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY2NkBmaWcuYmJuLmNvbT4)]
  - 1988-04-26 comp.sources.unix: "v14i064: Jove, an emacs variant, version 4.9, Part08/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY2N0BmaWcuYmJuLmNvbT4)]
  - 1988-04-26 comp.sources.unix: "v14i065: Jove, an emacs variant, version 4.9, Part09/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY2OEBmaWcuYmJuLmNvbT4)]
  - 1988-04-26 comp.sources.unix: "v14i066: Jove, an emacs variant, version 4.9, Part10/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY2OUBmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i067: Jove, an emacs variant, version 4.9, Part11/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY3NkBmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i068: Jove, an emacs variant, version 4.9, Part12/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY3N0BmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i069: Jove, an emacs variant, version 4.9, Part13/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY3OEBmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i070: Jove, an emacs variant, version 4.9, Part14/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY3OUBmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i071: Jove, an emacs variant, version 4.9, Part15/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY4MEBmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i072: Jove, an emacs variant, version 4.9, Part16/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY4NEBmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i073: Jove, an emacs variant, version 4.9, Part17/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY4NUBmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i074: Jove, an emacs variant, version 4.9, Part18/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY4NkBmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i075: Jove, an emacs variant, version 4.9, Part19/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY4N0BmaWcuYmJuLmNvbT4)]
  - 1988-04-28 comp.sources.unix: "v14i076: Jove, an emacs variant, version 4.9, Part20/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY4OEBmaWcuYmJuLmNvbT4)]
  - 1988-04-29 comp.sources.unix: "v14i078: Jove, an emacs variant, version 4.9, Part21/21" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDY5MUBmaWcuYmJuLmNvbT4)]

## QEDIT

- 1987-01-08 net.sources: "QEDIT.arc 1 of 3" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1MkB1bWJjMy5VTUQuRURVPg)]
  - 1987-01-08 net.sources: "QEDIT.arc 2 of 3" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1M0B1bWJjMy5VTUQuRURVPg)]
  - 1987-01-08 net.sources: "QEDIT.arc 3 of 3" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1NEB1bWJjMy5VTUQuRURVPg)]
- 1987-01-13 net.sources: "QEDIT repairs 1 of 7" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1N0B1bWJjMy5VTUQuRURVPg)]
  - 1987-01-13 net.sources: "QEDIT repair 2 of 7" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1OEB1bWJjMy5VTUQuRURVPg)]
  - 1987-01-13 net.sources: "QEDIT repairs 3 of 7" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI1OUB1bWJjMy5VTUQuRURVPg)]
  - 1987-01-13 net.sources: "QEDIT repairs 4 of 7" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2MEB1bWJjMy5VTUQuRURVPg)]
  - 1987-01-13 net.sources: "QEDIT repairs 5 of 7" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2MUB1bWJjMy5VTUQuRURVPg)]
  - 1987-01-13 net.sources: "QEDIT repairs 6 of 7" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2MkB1bWJjMy5VTUQuRURVPg)]
  - 1987-01-13 net.sources: "QEDIT repairs 7 of 7" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2M0B1bWJjMy5VTUQuRURVPg)]
- 1987-01-14 net.sources: "more QEDIT" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2NEB1bWJjMy5VTUQuRURVPg)]
  - 1987-01-14 net.sources: "more QEDIT part 2 (of 4 tonight)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2NUB1bWJjMy5VTUQuRURVPg)]
  - 1987-01-14 net.sources: "more QEDIT 3 of 4" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2NkB1bWJjMy5VTUQuRURVPg)]
  - 1987-01-14 net.sources: "more QEDIT 4 of 4" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2N0B1bWJjMy5VTUQuRURVPg)]
    - 1987-01-16 net.sources: "QEDIT" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2OUB1bWJjMy5VTUQuRURVPg)]

## Flex

- 1988-05-03 comp.sources.unix: "v14i079: Flex, a lex replacement, Part01/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/LZ_EHqd7XBg)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDcwMUBmaWcuYmJuLmNvbT4)]
  - 1988-05-03 comp.sources.unix: "v14i080: Flex, a lex replacement, Part02/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/oPjL5_5OQUQ)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDcwMkBmaWcuYmJuLmNvbT4)]
  - 1988-05-03 comp.sources.unix: "v14i081: Flex, a lex replacement, Part03/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/J0BvPGk7vj8)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDcwM0BmaWcuYmJuLmNvbT4)]
  - 1988-05-03 comp.sources.unix: "v14i082: Flex, a lex replacement, Part04/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/Q9wGLpGaT58)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDcwNEBmaWcuYmJuLmNvbT4)]
  - 1988-05-03 comp.sources.unix: "v14i083: Flex, a lex replacement, Part05/05" [[gg](https://groups.google.com/g/comp.sources.unix/c/rpBUDKnPu5o)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDcwNUBmaWcuYmJuLmNvbT4)]
  - 1988-05-06 comp.sources.unix: "v14i084: Flex, a lex replacement, Patch1" [[gg](https://groups.google.com/g/comp.sources.unix/c/W9LRueHyF9o)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDcwOUBmaWcuYmJuLmNvbT4)]
- 1989-06-22 comp.sources.unix: "v19i055: Flex, a fast LEX replacement, Part01/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/nlq21TszHwM)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MjhAcHJ1bmUuYmJuLmNvbT4)]
  - 1989-06-22 comp.sources.unix: "v19i056: Flex, a fast LEX replacement, Part02/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/VemQnMC9GyQ)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MjlAcHJ1bmUuYmJuLmNvbT4)]
  - 1989-06-22 comp.sources.unix: "v19i057: Flex, a fast LEX replacement, Part03/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/y9_UZFJoGNY)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MzBAcHJ1bmUuYmJuLmNvbT4)]
  - 1989-06-22 comp.sources.unix: "v19i058: Flex, a fast LEX replacement, Part04/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/ij_rUBUCWwM)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MzFAcHJ1bmUuYmJuLmNvbT4)]
  - 1989-06-22 comp.sources.unix: "v19i059: Flex, a fast LEX replacement, Part05/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/_I7IOO7nCn8)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MzJAcHJ1bmUuYmJuLmNvbT4)]
  - 1989-06-22 comp.sources.unix: "v19i060: Flex, a fast LEX replacement, Part06/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/WvhMAAuw5fA)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MzNAcHJ1bmUuYmJuLmNvbT4)]
  - 1989-06-22 comp.sources.unix: "v19i061: Flex, a fast LEX replacement, Part07/07" [[gg](https://groups.google.com/g/comp.sources.unix/c/Cz8KPGVQklw)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MzRAcHJ1bmUuYmJuLmNvbT4)]

## Public domain yacc, lex, and prep

- 1987-01-30 net.sources: "Yacc, lex, prep source" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzM0BlbXMuVVVDUD4)]
  - 1987-02-01 net.sources: "Public Domain YACC (part 1 of 2)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzNUBlbXMuVVVDUD4)]
  - 1987-02-01 net.sources: "Public Domain YACC (part 2 of 2)" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDEzNkBlbXMuVVVDUD4)]

## uuencode and uudecode

- 1986-09-02 mod.sources: "v07i015: Uuencode and uudecode" [[ua](https://usenetarchives.com/view.php?id=mod.sources&mid=PDIyN0BtaXJyb3IuVVVDUD4)]
- 1986-11-04 net.sources: "UUENCODE C source, if you need UUENCODE - here it is!!!!" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI4MUBjYmxwZS5VVUNQPg)]
  - 1986-11-04 net.sources: "UUDECODE C source, if you need UUDECODE - here it is!!!!" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI4MkBjYmxwZS5VVUNQPg)]
- 1987-01-13 net.sources: "uuen/decode with checksums." [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDM5MTdAdXRjc3JpLlVVQ1A%2B)]

## trn

Searched "trn", "trn-3.3", and "trn-3.6" in comp.sources.unix.

- 1990-11-30 comp.sources.unix: "v23i060: TRN, version of RN that follows conversation threads, Part01/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/3IXhMR-jilM)]
  - 1990-11-30 comp.sources.unix: "v23i061: TRN, version of RN that follows conversation threads, Part02/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/htOYzwa-nL4)]
  - 1990-11-30 comp.sources.unix: "v23i062: TRN, version of RN that follows conversation threads, Part03/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/qBsoBKvXlOo)]
  - 1990-11-30 comp.sources.unix: "v23i063: TRN, version of RN that follows conversation threads, Part04/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/LoyLp59CwQo)]
  - 1990-11-30 comp.sources.unix: "v23i064: TRN, version of RN that follows conversation threads, Part05/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/Xjz3yGRbT64)]
  - 1990-11-30 comp.sources.unix: "v23i065: TRN, version of RN that follows conversation threads, Part06/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/k-ecaydISnU)]
  - 1990-11-30 comp.sources.unix: "v23i066: TRN, version of RN that follows conversation threads, Part07/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/8moJbSgPwj8)]
  - 1990-12-03 comp.sources.unix: "v23i067: TRN, version of RN that follows conversation threads, Part08/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/n4yQOpKOeSE)]
  - 1990-12-03 comp.sources.unix: "v23i068: TRN, version of RN that follows conversation threads, Part09/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/KainKKUKjXI)]
  - 1990-12-03 comp.sources.unix: "v23i069: TRN, version of RN that follows conversation threads, Part10/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/pQeX0pe0l2k)]
  - 1990-12-03 comp.sources.unix: "v23i070: TRN, version of RN that follows conversation threads, Part11/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/9hXkf8BEiRs)]
  - 1990-12-03 comp.sources.unix: "v23i071: TRN, version of RN that follows conversation threads, Part12/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/iyKaOffQkcE)]
  - 1990-12-03 comp.sources.unix: "v23i072: TRN, version of RN that follows conversation threads, Part13/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/kEIqEnrkQyI)]
  - 1990-12-03 comp.sources.unix: "v23i073: TRN, version of RN that follows conversation threads, Part14/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/ErGoTJXCugA)]
  - 1990-12-03 comp.sources.unix: "v23i074: TRN, version of RN that follows conversation threads, Patch1" [[gg](https://groups.google.com/g/comp.sources.unix/c/TPGO_ZtotTE)]
  - 1990-12-05 comp.sources.unix: "REPOST v23i068: TRN, version of RN that follows conversation threads, Part09/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/yHUNH-L8YWg)]
  - 1990-12-06 comp.sources.unix: "REPOST v23i069: TRN, version of RN that follows conversation threads, Part10/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/gBF6gkBhYZE)]
- 1991-01-03 comp.sources.unix: "v23i060: Complete reposting of TRN at patchlevel 1, Part01/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/BtRlQNBjDZ4)]
  - 1991-01-04 comp.sources.unix: "v23i061: Complete reposting of TRN at patchlevel 1, Part02/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/loWO3EI85gA)]
  - 1991-01-04 comp.sources.unix: "v23i062: Complete reposting of TRN at patchlevel 1, Part03/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/Uwx80of7W2g)]
  - 1991-01-04 comp.sources.unix: "v23i063: Complete reposting of TRN at patchlevel 1, Part04/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/mnedNPJj63Y)]
  - 1991-01-04 comp.sources.unix: "v23i064: Complete reposting of TRN at patchlevel 1, Part05/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/y1W9NSm_TJ0)]
  - 1991-01-04 comp.sources.unix: "v23i065: Complete reposting of TRN at patchlevel 1, Part06/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/IKnTW6u2yWU)]
  - 1991-01-04 comp.sources.unix: "v23i066: Complete reposting of TRN at patchlevel 1, Part07/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/Nzkpn_2dNgA)]
  - 1991-01-04 comp.sources.unix: "v23i067: Complete reposting of TRN at patchlevel 1, Part08/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/kSJ0FQBJwDE)]
  - 1991-01-04 comp.sources.unix: "v23i068: Complete reposting of TRN at patchlevel 1, Part09/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/T-BY5smwts4)]
  - 1991-01-04 comp.sources.unix: "v23i069: Complete reposting of TRN at patchlevel 1, Part10/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/2urKF-XcES4)]
  - 1991-01-04 comp.sources.unix: "v23i070: Complete reposting of TRN at patchlevel 1, Part11/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/uHcR-6TlXqk)]
  - 1991-01-04 comp.sources.unix: "v23i071: Complete reposting of TRN at patchlevel 1, Part12/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/yWiDfzqzln0)]
  - 1991-01-04 comp.sources.unix: "v23i072: Complete reposting of TRN at patchlevel 1, Part13/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/2hf3W6Aucrw)]
  - 1991-01-04 comp.sources.unix: "v23i073: Complete reposting of TRN at patchlevel 1, Part14/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/EeTvnOiYQg4)]
- 1993-11-27 comp.sources.unix: "v27i094: trn-3.3 - threaded newsreader based on RN, V3.3, Part01/12" [[gg](https://groups.google.com/g/comp.sources.unix/c/ovsf6yHM01Y)]
- 1995-10-29 comp.sources.unix: "v29i046: trn-3.6 - threaded newsreader based on RN, V3.6, Part09/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/QbhWwy0KRYs)]
  - 1995-10-29 comp.sources.unix: "v29i047: trn-3.6 - threaded newsreader based on RN, V3.6, Part10/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/TE61QxITkrQ)]
  - 1995-10-29 comp.sources.unix: "v29i048: trn-3.6 - threaded newsreader based on RN, V3.6, Part11/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/by6qYdXJhh0)]
  - 1995-10-29 comp.sources.unix: "v29i050: trn-3.6 - threaded newsreader based on RN, V3.6, Part13/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/Av1JhB-XZW4)]
  - 1995-10-29 comp.sources.unix: "v29i049: trn-3.6 - threaded newsreader based on RN, V3.6, Part12/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/zaCH71W-Q3o)]
  - 1995-10-29 comp.sources.unix: "v29i051: trn-3.6 - threaded newsreader based on RN, V3.6, Part14/14" [[gg](https://groups.google.com/g/comp.sources.unix/c/5ANT7yCY1LY)]

## NN

Has a regular expression engine.

- 1989-06-23 comp.sources.unix: "v19i062: NN, a Usenet news reader, Part01/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/W0JQwwfvK50)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MzZAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-23 comp.sources.unix: "v19i063: NN, a Usenet news reader, Part02/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/T3CuSdOWGwI)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MzdAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-23 comp.sources.unix: "v19i064: NN, a Usenet news reader, Part03/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/_y3pV9oJT2Y)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MzhAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-23 comp.sources.unix: "v19i065: NN, a Usenet news reader, Part04/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/ZqvzNedxuXs)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4MzlAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-23 comp.sources.unix: "v19i066: NN, a Usenet news reader, Part05/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/S4qjezMZtr4)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NDBAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-23 comp.sources.unix: "v19i067: NN, a Usenet news reader, Part06/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/TYvINj5v684)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NDFAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-23 comp.sources.unix: "v19i068: NN, a Usenet news reader, Part07/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/XaITMsLxY08)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NDJAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-26 comp.sources.unix: "v19i069: NN, a Usenet news reader, Part08/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/RiUWxM9cV9g)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NDdAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-26 comp.sources.unix: "v19i070: NN, a Usenet news reader, Part09/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/4H_27XeoK00)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NDhAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-26 comp.sources.unix: "v19i071: NN, a Usenet news reader, Part10/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/WUMX5BpRsqA)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NDlAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-26 comp.sources.unix: "v19i072: NN, a Usenet news reader, Part11/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/u295dD2nAc0)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NTBAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-26 comp.sources.unix: "v19i073: NN, a Usenet news reader, Part12/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/tOnwc1lyHUI)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NTFAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-26 comp.sources.unix: "v19i074: NN, a Usenet news reader, Part13/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/z8suEE0DFkA)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NTJAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-26 comp.sources.unix: "v19i075: NN, a Usenet news reader, Part14/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/51CKr7LbE-o)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NTNAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-26 comp.sources.unix: "v19i076: NN, a Usenet news reader, Part15/15" [[gg](https://groups.google.com/g/comp.sources.unix/c/43hOJiKppdk)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NTRAcGFwYXlhLmJibi5jb20%2B)]
  - 1989-06-26 comp.sources.unix: "v19i077: NN, a Usenet news reader, Patch1" [[gg](https://groups.google.com/g/comp.sources.unix/c/fQbYwgWLZs0)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDE4NTVAcGFwYXlhLmJibi5jb20%2B)]
- 1990-05-09 comp.sources.unix: "v22i036: NN Newsreader, release 6.4, Part01/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/rhqobl3raLQ)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MTlAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-09 comp.sources.unix: "v22i037: NN Newsreader, release 6.4, Part02/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/WLcJZfPSdl8)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MjBAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-09 comp.sources.unix: "v22i038: NN Newsreader, release 6.4, Part03/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/GLlX3i2Ov-I)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MjFAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-09 comp.sources.unix: "v22i039: NN Newsreader, release 6.4, Part04/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/DAQjR-WpMsI)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MjJAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-09 comp.sources.unix: "v22i040: NN Newsreader, release 6.4, Part05/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/QY-TSNeRe8M)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MjNAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-09 comp.sources.unix: "v22i041: NN Newsreader, release 6.4, Part06/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/L7XiVYiVrf8)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MjRAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-09 comp.sources.unix: "v22i042: NN Newsreader, release 6.4, Part07/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/wHnWloIU3E0)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MjVAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-10 comp.sources.unix: "v22i043: NN Newsreader, release 6.4, Part08/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/Hl021jIXRJM)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MzBAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-10 comp.sources.unix: "v22i044: NN Newsreader, release 6.4, Part09/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/_G1-vzh8KYI)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MzFAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-10 comp.sources.unix: "v22i045: NN Newsreader, release 6.4, Part10/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/t3aIy8Zc3ko)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MzJAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-10 comp.sources.unix: "v22i046: NN Newsreader, release 6.4, Part11/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/34_etq08R7w)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MzNAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-10 comp.sources.unix: "v22i047: NN Newsreader, release 6.4, Part12/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/gXpqr4AkHls)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MzRAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-10 comp.sources.unix: "v22i048: NN Newsreader, release 6.4, Part13/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/KfvpiTxjp-M)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MzVAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-10 comp.sources.unix: "v22i049: NN Newsreader, release 6.4, Part14/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/0hPSuvvFIIc)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MzZAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-10 comp.sources.unix: "v22i050: NN Newsreader, release 6.4, Part15/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/YFu2wL5L-5I)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MzdAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-10 comp.sources.unix: "v22i051: NN Newsreader, release 6.4, Part17/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/Z9YDAjgbqIk)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1MzhAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-11 comp.sources.unix: "REPOST v22i052: NN Newsreader, release 6.4, Part15/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/gep-24vH03A)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NDNAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-11 comp.sources.unix: "REPOST v22i052: NN Newsreader, release 6.4, Part16/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/dja_M315Oe8)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NDRAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-11 comp.sources.unix: "v22i052: NN Newsreader, release 6.4, Part18/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/pmGDSTZyvBc)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NDVAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-11 comp.sources.unix: "v22i053: NN Newsreader, release 6.4, Part19/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/pxVawcuUpDI)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NDZAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-11 comp.sources.unix: "v22i054: NN Newsreader, release 6.4, Part20/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/KvS1fBl1zsE)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NDdAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-11 comp.sources.unix: "v22i055: NN Newsreader, release 6.4, Part21/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/O5O1t6917Ps)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NDhAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-11 comp.sources.unix: "v22i056: NN Newsreader, release 6.4, Patch1" [[gg](https://groups.google.com/g/comp.sources.unix/c/QiN8uEIvcDY)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NDlAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-16 comp.sources.unix: "REPOST v22i054: NN Newsreader, release 6.4, Part20/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/4BWEZp-vziY)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NTNAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-16 comp.sources.unix: "REPOST v22i057: NN Newsreader, release 6.4, Part22/21" [[gg](https://groups.google.com/g/comp.sources.unix/c/B9C1kGrWdEc)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NTRAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-16 comp.sources.unix: "v22i058: NN newsreader, release 6.4, Patch2" [[gg](https://groups.google.com/g/comp.sources.unix/c/Row_xNJS44M)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NTVAbGl0Y2hpLmJibi5jb20%2B)]
  - 1990-05-24 comp.sources.unix: "v22INF3: NN postings, mail problems" [[gg](https://groups.google.com/g/comp.sources.unix/c/p3sxRtAEDJg)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NjdAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-05-24 comp.sources.unix: "v22i059: NN Newsreader, release 6.4, Patch3" [[gg](https://groups.google.com/g/comp.sources.unix/c/SM52VnEtz8M)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI1NjhAcGFwYXlhLmJibi5jb20%2B)]
  - 1990-06-08 comp.sources.unix: "v22i108: NN Newsreader, release 6.4, Patch4" [[gg](https://groups.google.com/g/comp.sources.unix/c/q-Qr8DMfNJU)] [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDI2NDhAbGl0Y2hpLmJibi5jb20%2B)]

## vn

Has a regular expression engine.

- 1986-05-21 net.sources: "Yet Another Newsreader - vn (PART 1 of 3)" [[gg](https://groups.google.com/g/net.sources/c/O3j5qDoxNqk/m)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2N0BydGVjaC5VVUNQPg)]
  - 1986-05-21 net.sources: "vn (Part 2 of 3)" [[gg](https://groups.google.com/g/net.sources/c/T0VSORHj_MI/m)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2OEBydGVjaC5VVUNQPg)]
  - 1986-05-21 net.sources: "vn (Part 3 of 3)" [[gg](https://groups.google.com/g/net.sources/c/m54np191HxU/m)] [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDI2OUBydGVjaC5VVUNQPg)]
- 1988-02-05 comp.sources.unix: "v13i019: VN newsreader, 1/88 version, Part01/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM3M0BmaWcuYmJuLmNvbT4)]
  - 1988-02-05 comp.sources.unix: "v13i020: VN newsreader, 1/88 version, Part02/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM3NEBmaWcuYmJuLmNvbT4)]
  - 1988-02-05 comp.sources.unix: "v13i021: VN newsreader, 1/88 version, Part03/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM3NUBmaWcuYmJuLmNvbT4)]
  - 1988-02-05 comp.sources.unix: "v13i022: VN newsreader, 1/88 version, Part04/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM3NkBmaWcuYmJuLmNvbT4)]
  - 1988-02-05 comp.sources.unix: "v13i023: VN newsreader, 1/88 version, Part05/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDM3N0BmaWcuYmJuLmNvbT4)]

## Emacs

- 1987-03-17 mod.sources: "v09i040: MicroEMACS, version 3.8b, Part08/14" [[gg](https://groups.google.com/g/mod.sources/c/DFEsRhB4HmE)]

## Misc

- 1984-09-26 net.sources: "perfect hash function finder" [[ua](https://usenetarchives.com/view.php?id=net.sources&mid=PDQyMzRAc2Vpc21vLlVVQ1A%2B)]
- 1988-02-19 comp.sources.unix: "v13i053: New release of little smalltalk, Part01/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDQyNUBmaWcuYmJuLmNvbT4)]
  - 1988-02-19 comp.sources.unix: "v13i054: New release of little smalltalk, Part02/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDQyNkBmaWcuYmJuLmNvbT4)]
  - 1988-02-23 comp.sources.unix: "v13i055: New release of little smalltalk, Part03/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDQzM0BmaWcuYmJuLmNvbT4)]
  - 1988-02-23 comp.sources.unix: "v13i056: New release of little smalltalk, Part04/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDQzNEBmaWcuYmJuLmNvbT4)]
  - 1988-02-23 comp.sources.unix: "v17i053: New release of little smalltalk, Part05/05" [[ua](https://usenetarchives.com/view.php?id=comp.sources.unix&mid=PDQzNUBmaWcuYmJuLmNvbT4)]
- 1991-06-24 news.software.readers: "where can I find source for xrn ?" [[gg](https://groups.google.com/g/news.software.readers/c/gV38od1Pkeg)] [[ua](https://usenetarchives.com/view.php?id=news.software.readers&mid=PDE5OTFKdW4yNC4xODAyMTMuMjIyNzFAYnJvbnplLnVjcy5pbmRpYW5hLmVkdT4)]

## No results

Searched "snippets" in net.sources, mod.sources, and comp.sources.unix.
