#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - Create linear history with the four versions modifying the same directories.
# - Use the Computer History Museum's version of v1.25 and v2.0.
# - Investigate force-pushed commits.
# - Examine executable file modes.
# - Pick either the original or optimized PNG version for the logo. Where were
#   they sourced? The PNGs may have useful text (https://www.w3.org/TR/png-3/#11textinfo),
#   EXIF (https://www.w3.org/TR/png-3/#eXIf), or timestamp (https://www.w3.org/TR/png-3/#11timestampinfo)
#   information.

# https://www.hanselman.com/blog/open-sourcing-dos-4
# https://computerhistory.org/blog/microsoft-ms-dos-early-source-code/
# https://news.ycombinator.com/item?id=40163405
# https://www.os2museum.com/wp/how-not-to-release-historic-source-code/

export GIT_AUTHOR_NAME='Microsoft Open Source'
export GIT_AUTHOR_EMAIL='microsoftopensource@users.noreply.github.com'
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

commit() {
  local date="$1"
  local message="$2"
  GIT_AUTHOR_DATE="${GIT_AUTHOR_DATE-"$date"}" \
  GIT_COMMITTER_DATE="${GIT_COMMITTER_DATE-"$date"}" \
  git commit -q -m "$message"
}

mkdir ms-dos
cd ms-dos

git init -q
git config core.autocrlf false

# MS-DOS 1.25 and 2.0
# https://computerhistory.org/blog/microsoft-ms-dos-early-source-code/
unzip -q "$(get_cached_path https://d1yx3ys82bpsa0.cloudfront.net/source/msdos.zip)"


## MS-DOS 1.25

mv msdos/v11source/Tim_Paterson_16Dec2013_email.txt .
mv msdos/v11object bin
mv msdos/v11source src

# All modified 1982-05-07 19:00:00 +0000
git add -f bin/{ART.BAS,BALL.BAS,BASIC.COM,BASICA.COM,CALENDAR.BAS,CHKDSK.COM} \
           bin/{CIRCLE.BAS,COLORBAR.BAS,COMM.BAS,COMMAND.COM,COMP.COM} \
           bin/{DEBUG.COM,DISKCOMP.COM,DISKCOPY.COM,DONKEY.BAS,EDLIN.COM} \
           bin/{EXE2BIN.EXE,FORMAT.COM,LINK.EXE,MODE.COM,MORTGAGE.BAS} \
           bin/{MUSIC.BAS,PIECHART.BAS,SAMPLES.BAS,SPACE.BAS,SYS.COM}
commit '1982-05-07 19:00:00 +0000' '1982-05-07: MS-DOS 1.25'

# 1982-07-02 06:54:50 +0000 v11source/TRANS.ASM
# 1982-07-02 18:33:26 +0000 v11source/HEX2BIN.ASM
git add -f src/{TRANS.ASM,HEX2BIN.ASM}
commit '1982-07-02 18:33:26 +0000' '1982-07-02: MS-DOS 1.25'

# 1982-08-03 07:29:18 +0000 v11source/IO.ASM
git add -f src/IO.ASM
commit '1982-08-03 07:29:18 +0000' '1982-08-03: MS-DOS 1.25'

# 1982-09-19 07:00:00 +0000 v11object/SETCLOCK.COM
git add -f bin/SETCLOCK.COM
commit '1982-09-19 07:00:00 +0000' '1982-09-19: MS-DOS 1.25'

# 1983-05-09 16:59:14 +0000 v11source/ASM.ASM
git add -f src/ASM.ASM
commit '1983-05-09 16:59:14 +0000' '1983-05-09: MS-DOS 1.25'

# 1983-05-18 01:15:22 +0000 v11source/MSDOS.ASM
# 1983-05-18 01:19:00 +0000 v11source/COMMAND.ASM
# 1983-05-18 01:20:16 +0000 v11source/STDDOS.ASM
git add src/{MSDOS.ASM,COMMAND.ASM,STDDOS.ASM}
commit '1983-05-18 01:20:16 +0000' '1983-05-18: MS-DOS 1.25'

# Date:     2013-12-16 10:34:17 -0800
# Modified: 2013-12-19 23:15:52 +0000
git add Tim_Paterson_16Dec2013_email.txt
GIT_COMMITTER_DATE='2013-12-19 23:15:52 +0000' \
commit '2013-12-16 10:34:17 -0800' '2013-12-16: MS-DOS 1.25'

# The microsoft/MS-DOS commits 1.25 in fce0f75 (MS-DOS v1.25 Release)
# Author:    1982-03-03 16:51:26 -0800  Rich Turner <richturn@microsoft.com>
# Committer: 2018-09-21 17:51:26 -0700  Rich Turner <richturn@microsoft.com>
#
# The author date is obviously fabricated and is inaccurate, because all files
# are modified after it.
GIT_COMMITTER_DATE='2013-12-19 23:15:52 +0000' \
git tag ms-dos-v1.25 -a -m 'MS-DOS 1.25'


## MS-DOS 2.0

git rm -rq '*'
mv msdos/v20object bin
mv msdos/v20source src
rmdir msdos

# 1980-01-01 08:03:04 +0000 v20source/UINIT.ASM
# 1980-01-01 08:03:22 +0000 v20object/README.DOC
# 1980-01-01 08:03:22 +0000 v20source/README.txt
# 1980-01-01 08:05:08 +0000 v20source/SKELIO.ASM
# 1980-01-01 08:07:56 +0000 v20source/DOSSYM.ASM
# 1980-01-01 08:10:14 +0000 v20source/MSHEAD.ASM
# 1980-01-01 08:12:18 +0000 v20source/STDSW.ASM
# 1980-01-01 08:13:10 +0000 v20source/COMSW.ASM
# 1980-01-01 08:15:46 +0000 v20source/MSDATA.ASM
# 1980-01-01 08:15:46 +0000 v20source/HRDDRV.ASM
# 1980-01-01 08:24:52 +0000 v20source/MSINIT.ASM
# 1980-01-01 08:26:22 +0000 v20source/FC.ASM
# 1980-01-01 08:26:42 +0000 v20source/FCMES.ASM
# 1980-01-01 08:28:36 +0000 v20source/FIND.ASM
# 1980-01-01 08:29:22 +0000 v20source/FINDMES.ASM
# 1980-01-01 08:38:32 +0000 v20source/TDATA.ASM
# 1980-01-01 08:39:06 +0000 v20source/RECMES.ASM
# 1980-01-01 08:44:22 +0000 v20source/SYSIMES.ASM
# 1980-01-01 08:45:06 +0000 v20source/EXE2BIN.ASM
# 1980-01-01 08:45:24 +0000 v20source/EXEMES.ASM
# 1980-01-01 08:49:10 +0000 v20source/DEBMES.ASM
# 1980-01-01 08:51:48 +0000 v20source/DISKCOPY.ASM
# 1980-01-01 08:52:38 +0000 v20source/DISKMES.ASM
# 1980-01-01 09:12:36 +0000 v20source/DEBEQU.ASM
# 1980-01-01 10:08:10 +0000 v20source/EDLIN.ASM
# 1980-01-01 10:39:20 +0000 v20source/MORE.ASM
# 1980-01-01 10:42:56 +0000 v20source/PRINT_v211.ASM
# 1980-01-01 11:01:58 +0000 v20source/RECOVER.ASM
# 1980-01-01 11:07:50 +0000 v20source/SORTMES.ASM
# 1980-01-01 22:48:16 +0000 v20source/FORMAT.ASM
git add -f bin/README.DOC \
           src/{UINIT.ASM,README.txt,SKELIO.ASM,DOSSYM.ASM,MSHEAD.ASM} \
           src/{STDSW.ASM,COMSW.ASM,MSDATA.ASM,HRDDRV.ASM,MSINIT.ASM,FC.ASM} \
           src/{FCMES.ASM,FIND.ASM,FINDMES.ASM,TDATA.ASM,RECMES.ASM} \
           src/{SYSIMES.ASM,EXE2BIN.ASM,EXEMES.ASM,DEBMES.ASM,DISKCOPY.ASM} \
           src/{DISKMES.ASM,DEBEQU.ASM,EDLIN.ASM,MORE.ASM,PRINT_v211.ASM} \
           src/{RECOVER.ASM,SORTMES.ASM,FORMAT.ASM}
commit '1980-01-01 22:48:16 +0000' '1980-01-01: MS-DOS 2.0'

# 1980-01-03 13:18:14 +0000 v20source/MSDOS.ASM
# 1980-01-03 13:25:56 +0000 v20source/MSCODE.ASM
# 1980-01-03 14:26:22 +0000 v20source/SYSCALL.ASM
# 1980-01-03 14:27:54 +0000 v20source/STDPROC.ASM
# 1980-01-03 14:57:14 +0000 v20source/XENIX.ASM
# 1980-01-03 15:40:50 +0000 v20source/STDFCB.ASM
# 1980-01-03 15:41:02 +0000 v20source/STDIO.ASM
git add -f src/{MSDOS.ASM,MSCODE.ASM,SYSCALL.ASM,STDPROC.ASM,XENIX.ASM} \
           src/{STDFCB.ASM,STDIO.ASM}
commit '1980-01-03 15:41:02 +0000' '1980-01-03: MS-DOS 2.0'

# 1982-06-03 01:06:42 +0000 v20object/CREF.EXE
git add -f bin/CREF.EXE
commit '1982-06-03 01:06:42 +0000' '1982-06-03: MS-DOS 2.0'

# 1982-10-18 19:06:50 +0000 v20source/DOSMAC.ASM
# 1982-10-18 19:07:22 +0000 v20source/DEVSYM.ASM
git add -f src/{DOSMAC.ASM,DEVSYM.ASM}
commit '1982-10-18 19:07:22 +0000' '1982-10-18: MS-DOS 2.0'

# 1982-10-29 00:31:38 +0000 v20source/PROFIL.ASM
# 1982-10-29 00:32:12 +0000 v20source/PCLOCK.ASM
# 1982-10-29 00:32:50 +0000 v20object/PROFIL.OBJ
git add -f bin/PROFIL.OBJ \
           src/{PROFIL.ASM,PCLOCK.ASM}
commit '1982-10-29 00:32:50 +0000' '1982-10-29: MS-DOS 2.0'

# 1983-01-07 00:36:48 +0000 v20object/LINK.EXE
git add -f bin/LINK.EXE
commit '1983-01-07 00:36:48 +0000' '1983-01-07: MS-DOS 2.0'

# 1983-01-15 02:35:48 +0000 v20object/FIND.EXE
# 1983-01-15 02:42:42 +0000 v20object/MORE.COM
git add -f bin/{FIND.EXE,MORE.COM}
commit '1983-01-15 02:42:42 +0000' '1983-01-15: MS-DOS 2.0'

# 1983-01-24 19:42:10 +0000 v20object/SYSIMES.OBJ
git add -f bin/SYSIMES.OBJ
commit '1983-01-24 19:42:10 +0000' '1983-01-24: MS-DOS 2.0'

# 1983-01-27 23:18:18 +0000 v20object/SYSCALL.DOC
# 1983-01-27 23:18:18 +0000 v20source/SYSCALL.txt
# 1983-01-27 23:22:46 +0000 v20object/DEVDRIV.DOC
# 1983-01-27 23:22:46 +0000 v20source/DEVDRIV.txt
# 1983-01-27 23:26:10 +0000 v20object/UTILITY.DOC
# 1983-01-27 23:26:10 +0000 v20source/UTILITY.txt
# 1983-01-27 23:30:34 +0000 v20object/INT24.DOC
# 1983-01-27 23:30:34 +0000 v20source/INT24.txt
# 1983-01-27 23:31:32 +0000 v20object/ANSI.DOC
# 1983-01-27 23:31:32 +0000 v20source/ANSI.txt
# 1983-01-27 23:34:16 +0000 v20object/PROFILE.DOC
# 1983-01-27 23:34:16 +0000 v20source/PROFILE.txt
# 1983-01-27 23:35:06 +0000 v20object/CONFIG.DOC
# 1983-01-27 23:35:06 +0000 v20source/CONFIG.txt
# 1983-01-27 23:39:32 +0000 v20object/QUICK.DOC
# 1983-01-27 23:39:32 +0000 v20source/QUICK.txt
# 1983-01-27 23:40:24 +0000 v20object/SYSINIT.DOC
# 1983-01-27 23:40:24 +0000 v20source/SYSINIT.txt
# 1983-01-27 23:42:28 +0000 v20object/INCOMP.DOC
# 1983-01-27 23:42:28 +0000 v20source/INCOMP.txt
git add -f bin/{SYSCALL.DOC,DEVDRIV.DOC,UTILITY.DOC,INT24.DOC,ANSI.DOC} \
           bin/{PROFILE.DOC,CONFIG.DOC,QUICK.DOC,SYSINIT.DOC,INCOMP.DOC} \
           src/{SYSCALL.txt,DEVDRIV.txt,UTILITY.txt,INT24.txt,ANSI.txt} \
           src/{PROFILE.txt,CONFIG.txt,QUICK.txt,SYSINIT.txt,INCOMP.txt}
commit '1983-01-27 23:42:28 +0000' '1983-01-27: MS-DOS 2.0'

# 1983-01-29 01:51:16 +0000 v20object/PROHST.EXE
# 1983-01-29 02:06:32 +0000 v20source/PROHST.HLP
# 1983-01-29 02:07:20 +0000 v20object/PROHST.PAS
# 1983-01-29 02:08:22 +0000 v20object/FILBP.PAS
git add -f bin/{PROHST.EXE,PROHST.PAS,FILBP.PAS} \
           src/PROHST.HLP
commit '1983-01-29 02:08:22 +0000' '1983-01-29: MS-DOS 2.0'

# 1983-02-01 17:16:44 +0000 v20object/CHKDSK.COM
# 1983-02-01 17:19:44 +0000 v20object/EXE2BIN.EXE
# 1983-02-01 17:36:46 +0000 v20object/FC.EXE
# 1983-02-01 18:13:10 +0000 v20object/DEBUG.COM
# 1983-02-01 20:37:30 +0000 v20source/PRINT.ASM
# 1983-02-01 20:39:38 +0000 v20object/PRINT.COM
# 1983-02-01 21:13:10 +0000 v20object/MASM.EXE
# 1983-02-01 22:22:24 +0000 v20object/RECOVER.COM
# 1983-02-01 22:26:52 +0000 v20object/SYS.COM
git add -f bin/{CHKDSK.COM,EXE2BIN.EXE,FC.EXE,DEBUG.COM,PRINT.COM,MASM.EXE} \
           bin/{RECOVER.COM,SYS.COM} \
           src/PRINT.ASM
commit '1983-02-01 22:26:52 +0000' '1983-02-01: MS-DOS 2.0'

# 1983-02-02 02:45:40 +0000 v20object/EDLIN.COM
git add -f bin/EDLIN.COM
commit '1983-02-02 02:45:40 +0000' '1983-02-02: MS-DOS 2.0'

# 1983-02-03 22:03:10 +0000 v20object/FORMES.OBJ
# 1983-02-03 22:18:22 +0000 v20object/FORMAT.OBJ
# 1983-02-03 22:45:06 +0000 v20source/GENFOR.ASM
# 1983-02-03 23:37:24 +0000 v20object/FORMAT.DOC
# 1983-02-03 23:37:24 +0000 v20source/FORMAT.txt
git add -f bin/{FORMES.OBJ,FORMAT.OBJ,FORMAT.DOC} \
           src/{GENFOR.ASM,FORMAT.txt}
commit '1983-02-03 23:37:24 +0000' '1983-02-03: MS-DOS 2.0'

# 1983-02-09 03:04:38 +0000 v20object/SORT.EXE
# 1983-02-09 03:48:00 +0000 v20object/MSDOS.SYS
# 1983-02-09 03:50:36 +0000 v20object/COMMAND.COM
# 1983-02-09 04:04:46 +0000 v20object/DOSPATCH.TXT
# 1983-02-09 04:24:00 +0000 v20object/SYSINIT.OBJ
git add -f bin/{SORT.EXE,MSDOS.SYS,COMMAND.COM,DOSPATCH.TXT,SYSINIT.OBJ}
commit '1983-02-09 04:24:00 +0000' '1983-02-09: MS-DOS 2.0'

# 1983-02-15 00:39:00 +0000 v20object/DISKCOPY.COM
git add -f bin/DISKCOPY.COM
commit '1983-02-15 00:39:00 +0000' '1983-02-15: MS-DOS 2.0'

# 1983-08-18 21:13:16 +0000 v20source/MISC.ASM
# 1983-08-18 21:14:38 +0000 v20source/GETSET.ASM
# 1983-08-18 21:25:40 +0000 v20source/DIRCALL.ASM
# 1983-08-18 21:26:36 +0000 v20source/ALLOC.ASM
# 1983-08-18 21:27:22 +0000 v20source/DEV.ASM
# 1983-08-18 21:28:48 +0000 v20source/DIR.ASM
# 1983-08-18 21:30:38 +0000 v20source/DISK.ASM
# 1983-08-18 21:31:30 +0000 v20source/FAT.ASM
# 1983-08-18 21:32:20 +0000 v20source/ROM.ASM
# 1983-08-18 21:32:46 +0000 v20source/STDBUF.ASM
# 1983-08-18 21:33:56 +0000 v20source/STDCALL.ASM
# 1983-08-18 21:39:02 +0000 v20source/STDCTRLC.ASM
# 1983-08-18 21:45:52 +0000 v20source/TIME.ASM
# 1983-08-18 21:51:18 +0000 v20source/XENIX2.ASM
# 1983-08-18 21:59:06 +0000 v20source/COMMAND.ASM
# 1983-08-18 21:59:40 +0000 v20source/RUCODE.ASM
# 1983-08-18 22:00:18 +0000 v20source/RDATA.ASM
# 1983-08-18 22:01:24 +0000 v20source/INIT.ASM
# 1983-08-18 22:05:08 +0000 v20source/TCODE2.ASM
# 1983-08-18 22:10:32 +0000 v20source/TCODE3.ASM
# 1983-08-18 22:11:40 +0000 v20source/TCODE4.ASM
# 1983-08-18 22:13:22 +0000 v20source/TUCODE.ASM
# 1983-08-18 22:14:20 +0000 v20source/COPY.ASM
# 1983-08-18 22:15:16 +0000 v20source/COPYPROC.ASM
# 1983-08-18 22:15:56 +0000 v20source/CPARSE.ASM
# 1983-08-18 22:17:42 +0000 v20source/TSPC.ASM
# 1983-08-18 22:18:16 +0000 v20source/COMLINK
# 1983-08-18 22:56:58 +0000 v20source/DEBUG.ASM
# 1983-08-18 22:58:12 +0000 v20source/DEBCOM1.ASM
# 1983-08-18 23:03:54 +0000 v20source/DEBASM.ASM
# 1983-08-18 23:05:14 +0000 v20source/DEBUASM.ASM
# 1983-08-18 23:07:06 +0000 v20source/DEBCONST.ASM
# 1983-08-18 23:07:40 +0000 v20source/DEBDATA.ASM
# 1983-08-18 23:10:38 +0000 v20source/CHKDSK.ASM
# 1983-08-18 23:12:18 +0000 v20source/CHKPROC.ASM
# 1983-08-18 23:14:44 +0000 v20source/CHKMES.ASM
# 1983-08-18 23:21:46 +0000 v20source/EDLMES.ASM
git add -f src/{MISC.ASM,GETSET.ASM,DIRCALL.ASM,ALLOC.ASM,DEV.ASM,DIR.ASM} \
           src/{DISK.ASM,FAT.ASM,ROM.ASM,STDBUF.ASM,STDCALL.ASM,STDCTRLC.ASM} \
           src/{TIME.ASM,XENIX2.ASM,COMMAND.ASM,RUCODE.ASM,RDATA.ASM,INIT.ASM} \
           src/{TCODE2.ASM,TCODE3.ASM,TCODE4.ASM,TUCODE.ASM,COPY.ASM} \
           src/{COPYPROC.ASM,CPARSE.ASM,TSPC.ASM,COMLINK,DEBUG.ASM} \
           src/{DEBCOM1.ASM,DEBASM.ASM,DEBUASM.ASM,DEBCONST.ASM,DEBDATA.ASM} \
           src/{CHKDSK.ASM,CHKPROC.ASM,CHKMES.ASM,EDLMES.ASM}
commit '1983-08-18 23:21:46 +0000' '1983-08-18: MS-DOS 2.0'

# 1983-08-19 18:52:32 +0000 v20source/FCB.ASM
# 1983-08-19 18:53:04 +0000 v20source/BUF.ASM
# 1983-08-19 18:54:24 +0000 v20source/STRIN.ASM
# 1983-08-19 18:55:22 +0000 v20source/PROC.ASM
# 1983-08-19 18:55:50 +0000 v20source/CTRLC.ASM
# 1983-08-19 18:59:32 +0000 v20source/EXEC.ASM
git add -f src/{FCB.ASM,BUF.ASM,STRIN.ASM,PROC.ASM,CTRLC.ASM,EXEC.ASM}
commit '1983-08-19 18:59:32 +0000' '1983-08-19: MS-DOS 2.0'

# 1983-08-25 22:04:08 +0000 v20source/COMSEG.ASM
# 1983-08-25 22:04:22 +0000 v20source/DOSSEG.ASM
# 1983-08-25 22:05:44 +0000 v20source/DOSSYM_v211.ASM
# 1983-08-25 22:06:00 +0000 v20source/IFEQU.ASM
# 1983-08-25 22:06:18 +0000 v20source/COMEQU.ASM
# 1983-08-25 23:46:20 +0000 v20source/DOSLINK
git add -f src/{COMSEG.ASM,DOSSEG.ASM,DOSSYM_v211.ASM,IFEQU.ASM,COMEQU.ASM} \
           src/DOSLINK
commit '1983-08-25 23:46:20 +0000' '1983-08-25: MS-DOS 2.0'

# 1983-09-08 08:48:06 +0000 v20source/TCODE.ASM
# 1983-09-08 08:49:00 +0000 v20source/TCODE5.ASM
git add -f src/{TCODE.ASM,TCODE5.ASM}
commit '1983-09-08 08:49:00 +0000' '1983-09-08: MS-DOS 2.0'

# 1983-09-12 17:41:22 +0000 v20source/DOSMAC_v211.ASM
git add -f src/DOSMAC_v211.ASM
commit '1983-09-12 17:41:22 +0000' '1983-09-12: MS-DOS 2.0'

# 1983-09-23 04:23:54 +0000 v20source/MOREMES.ASM
# 1983-09-23 04:29:40 +0000 v20source/SYS.ASM
# 1983-09-23 04:52:50 +0000 v20source/SYSMES.ASM
# 1983-09-23 05:00:04 +0000 v20source/FORMES.ASM
# 1983-09-23 05:27:04 +0000 v20source/SORT.ASM
# 1983-09-23 06:03:32 +0000 v20source/EDLPROC.ASM
git add -f src/{MOREMES.ASM,SYS.ASM,SYSMES.ASM,FORMES.ASM,SORT.ASM,EDLPROC.ASM}
commit '1983-09-23 06:03:32 +0000' '1983-09-23: MS-DOS 2.0'

# 1983-09-28 21:41:50 +0000 v20source/DOSMES.ASM
git add -f src/DOSMES.ASM
commit '1983-09-28 21:41:50 +0000' '1983-09-28: MS-DOS 2.0'

# 1983-10-13 04:24:26 +0000 v20source/SYSINIT.ASM
git add -f src/SYSINIT.ASM
commit '1983-10-13 04:24:26 +0000' '1983-10-13: MS-DOS 2.0'

# 1983-10-20 17:28:10 +0000 v20source/DEBCOM2.ASM
git add -f src/DEBCOM2.ASM
commit '1983-10-20 17:28:10 +0000' '1983-10-20: MS-DOS 2.0'

# 2013-02-23 16:45:34 +0000 v20source/WSMSGS.OVR
# 2013-02-23 16:45:36 +0000 v20source/WSBAUD.BAS
# 2013-02-23 16:45:36 +0000 v20source/WSOVLY1.OVR
git add -f src/{WSMSGS.OVR,WSBAUD.BAS,WSOVLY1.OVR}
commit '2013-02-23 16:45:36 +0000' '2013-02-23: MS-DOS 2.0'

# The microsoft/MS-DOS commits 2.0 in 80ab2fd (MS-DOS v2.0 Release)
# Author:    1983-08-12 17:53:34 -0700 Rich Turner <richturn@microsoft.com>
# Committer: 2018-09-21 17:53:34 -0700 Rich Turner <richturn@microsoft.com>
#
# The author date is obviously fabricated and is inaccurate, because most files
# are modified after it.
GIT_COMMITTER_DATE='2013-02-23 16:45:36 +0000' \
git tag ms-dos-v2.0 -a -m 'MS-DOS 2.0'

git rm -rq '*'


## MS-DOS 3.30

7z x "$(get_cached_path https://archive.org/download/microsoftSrcLeakCollection/ms_dos_3_30_oem_adaptation_kit_source_code.7z)"
mv dos-3.30/SOURCE src
rmdir dos-3.30

# 1987-07-24 05:00:02 +0000 SOURCE/{PROGREF,SRC,AG.DOC,README.BF,README.DIS}/**
git add -f src/{PROGREF,SRC,AG.DOC,README.BF,README.DIS}
commit '1987-07-24 05:00:02 +0000' '1987-07-24: MS-DOS 3.30'

# 1988-02-02 06:00:02 +0000 SOURCE/UPDSRC/**
git add -f src/UPDSRC
commit '1988-02-02 06:00:02 +0000' '1988-02-02: MS-DOS 3.30'

GIT_COMMITTER_DATE='1988-02-02 06:00:02 +0000' \
git tag ms-dos-v3.30 -a -m 'MS-DOS 3.30'

git rm -rq '*'


## MS-DOS 6.0

7z x "$(get_cached_path https://archive.org/download/microsoftSrcLeakCollection/ms_dos_6_0_source_code.7z)"
mv dos-6.0 src

# All files have dates in sequence alphabetically from 1999-10-31 16:33:52 +0000
# to 1999-10-31 19:01:40 +0000. Use the earlier date.
git add -f src
commit '1999-10-31 19:01:40 +0000' '1999-10-31: MS-DOS 6.0'

GIT_COMMITTER_DATE='1999-10-31 19:01:40 +0000' \
git tag ms-dos-v6.0 -a -m 'MS-DOS 6.0'


# The repo was force-pushed to reorganize and remove an insult. Discussed at
# https://news.ycombinator.com/item?id=40163766. Strangely, both of these cooked
# repos have many corrupt packed objects.
clone_swh https://github.com/microsoft/MS-DOS 661305ed4e91e8ab578dcb96ac4816b0f32ece32 ms-dos-1
clone_swh https://github.com/microsoft/MS-DOS 656c98b804c7845b1352a84f08177401caaea866 ms-dos-2

clone_submodule https://github.com/microsoft/MS-DOS ms-dos-3

cd ms-dos-3

# 1. Remove translated READMEs. With the addition of MS-DOS v4.0, they became
#    out of date and a5eb02a (Moving localized READMEs, 2024-04-25) moved them
#    to .readmes/, essentially deprecating them. Since the purpose here is to
#    make a linear development history, these feel out of place.
# 2. Pick "src" as the directory name.
# 3. Move icons to docs/
git filter-repo --quiet \
  --invert-paths \
  --path-regex 'README[.-].+\.md' \
  --path-regex .readmes/thanks.md \
  --invert-paths \
  \
  --path-rename v1.25/source/:v1.25/src/ \
  --path-rename v2.0/source/:v2.0/src/ \
  \
  --path-rename msdos-logo.png:docs/msdos-logo.png \
  --path-rename msdos-logo_250x250.png:docs/msdos-logo_250x250.png \
  --path-rename .readmes/:docs/
