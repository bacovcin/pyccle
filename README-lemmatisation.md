# Lemmatisation - Introduction

This repository provides scripts for generating a lemmatised copy of the 
Penn-York Computer-annotated Corpus of a Large Amount of English, using
the [MorphAdorner](http://morphadorner.northwestern.edu) lemmatiser. As with
the original PYCCLE, none of the output is hand corrected, so the usual
problems with machine annotation exist.

MorphAdorn's LICENSE can be found (here)[http://morphadorner.northwestern.edu/licenses/]

# Lemmatisation - Process

The lemmatisation process is run on the output of the original PYCCLE
corpus. Follow the instructions in README.md for downloading or recreating 
the PYCCLE corpus. These instructions describe what to do after
the original PYCCLE has been obtained.

1. Create symbolic links to the PYCCLE files in the main directory of the
repository: 
ln -s *pyccle-path*/pyccle-eebo-phase1/texts ./eebo-texts
ln -s *pyccle-path*/pyccle-ecco/texts ./ecco-texts
2. Unzip MorphAdorner: 
unzip morphadorner-2.0.1.zip
3. Run the make.sh script in the lemmatisation-scripts folder.
./lemmatisation-scripts/make.sh
4. The resulting files will be output into the eebo-final and ecco-final
directories

# Lemmatisation - Output

The output of the lemmatisation process will be new copies of the PYCCLE
files with the following five columns:

1. Original text (original word in original spelling)
2. Standardised spelling (standardisation of the spelling from MorphAdorner)
3. Lemma (root of word from MorphAdorner)
4. NUPOS Part of Speech (NUPOS part of speech tag from MorphAdorner)
5. Penn-Treebank Part of Speech (original part of speech tag from PYCCLE)

N.B. This output is not strictly speaking information preserving with respect
to the original PYCCLE. MorphAdorner includes its own chunking algorithm for
determining word breaks, whose output is used here. When (parts of) multiple 
PYCCLE words correspond to a single MorphAdorner word, the Penn-Treebank
Part of Speech includes all of the original POS tags joined with '+'.
