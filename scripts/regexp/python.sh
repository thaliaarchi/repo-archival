#!/bin/bash -e

. base.sh

mkdir -p regexp
cd regexp

copy_submodule github.com/python/cpython python
cd python

git filter-repo \
  --commit-callback '
    commit.message = re.sub(br"(?:\r?\n)+$", b"", commit.message) + b"\n\nSource: https://github.com/python/cpython/commit/" + commit.original_id + b"\n"
  ' \
  --paths-from-file <(cat <<EOF

Demo/comparisons/regextest.py
Demo/tkinter/guido/redemo.py
Demo/tkinter/guido/regexdemo.py
Doc/howto/regex.rst
Doc/howto/regex.tex
Doc/lib/libregex.tex
Doc/lib/libregsub.tex
Doc/library/re.rst
Doc/libregex.tex
Doc/libregsub.tex
Lib/dos_8x3/regex_sy.py
Lib/dos_8x3/regex_te.py
Lib/dos-8x3/regex_sy.py
Lib/dos-8x3/regex_te.py
Lib/dos-8x3/sre_comp.py
Lib/dos-8x3/sre_cons.py
Lib/dos-8x3/sre_pars.py
Lib/re.py
Lib/re/__init__.py
Lib/re/_casefix.py
Lib/re/_compiler.py
Lib/re/_constants.py
Lib/re/_parser.py
Lib/regex_syntax.py
Lib/regexp.py
Lib/sre_compile.py
Lib/sre_constants.py
Lib/sre_parse.py
Lib/sre.py
Lib/test/crashers/bogus_sre_bytecode.py
Lib/test/output/test_regex
Lib/test/output/test_sre
Lib/test/regex_tests.py
Lib/test/test_regex.py
Lib/test/test_sre.py
Modules/_sre.c
Modules/_sre/clinic/sre.c.h
Modules/_sre/sre_constants.h
Modules/_sre/sre_lib.h
Modules/_sre/sre_targets.h
Modules/_sre/sre.c
Modules/_sre/sre.h
Modules/_xxtestfuzz/dictionaries/fuzz_sre_compile.dict
Modules/_xxtestfuzz/fuzz_sre_compile_corpus/anchor_links
Modules/_xxtestfuzz/fuzz_sre_compile_corpus/characters
Modules/_xxtestfuzz/fuzz_sre_compile_corpus/isbn
Modules/_xxtestfuzz/fuzz_sre_compile_corpus/phone_number
Modules/clinic/_sre.c.h
Modules/pcre-int.h
Modules/pcre-internal.h
Modules/pcre.h
Modules/pcremodule.c
Modules/pypcre.c
Modules/regexmodule.c
Modules/regexpr.c
Modules/regexpr.h
Modules/sre_constants.h
Modules/sre_lib.h
Modules/sre.h
PC/VC6/_sre.dsp
PCbuild/_sre.dsp
Tools/build/generate_sre_constants.py
Tools/scripts/generate_sre_constants.py

EOF
)
