# Lemmatisation - Introduction

This repository provides scripts for generating a lemmatised copy of the 
Penn-York Computer-annotated Corpus of a Large Amount of English, using
the [MorphAdorner](http://morphadorner.northwestern.edu) lemmatiser. As with
the original PYCCLE, none of the output is hand corrected, so the usual
problems with machine annotation exist.



# Lemmatisation - Process

The lemmatisation process is run on the output of the original PYCCLE
corpus. Follow the instructions in README.md for downloading or recreating 
the PYCCLE corpus. These instructions describe what to do after
the original PYCCLE has been obtained.

1. Create symbolic links to the PYCCLE files in the main directory of the
repository: 
ln -s /eebo-texts/ *pyccle-path*/pyccle-eebo/pyccle-eebo-phase1/texts
ln -s /ecco-texts/ *pyccle-path*/pyccle-ecco/texts
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

# The PYCCLE corpus

The Penn-York Computer-annotated Corpus of a Large Amount of English
based on the TCP (PYCCLE-TCP) corpus is a part-of-speech tagged version
of the Early English Books Online
([EEBO](http://www.textcreationpartnership.org/tcp-eebo/)) and
Eighteenth Century Collections Online
([ECCO](http://www.textcreationpartnership.org/tcp-ecco/)) corpora, as
digitized by the Text Creation Partnership (TCP).

You can download the corpus from the following links:

- [EEBO Phase 1](https://s3.amazonaws.com/pyccle/pyccle-eebo.tgz)
- [ECCO](https://s3.amazonaws.com/pyccle/pyccle-ecco.tgz)

Please be advised that these are large downloads (1GB for the EEBO;
100MB for ECCO)  This repository *does not* contain the texts, due to
the inefficiency of git for storing large files.  Eventually, it will
house the scripts used for constructing the corpus (which are being
slowly migrated).

## Composition

The EEBO portion of the corpus (1473–1700) comprises 25,363 texts in
Phase 1 and 22,967 texts in Phase 2, for a total of roughly 900 million
words.  The ECCO portion of the corpus contains 2,473 texts for a total
of roughly 100 million words.

The EEBO-Phase1 and ECCO texts are publicly available from the TCP, and
in an annotated form through PYCCLE.  The EEBO-Phase2 texts are only
available to the faculty, staff, and students of institutions which
partner with the TCP, and thus cannot be made publicly available here.
Please contact Aaron Ecay if you qualify for access to EEBO-Phase2 and
would like to access the PYCCLE versions of those texts.

## Annotation

The texts have been acquired in their TEI-annotated XML format.  They
have been stripped of metadata, including footnotes, marginalia, and
**any verse material** (text occurring in `<L>...</L>` XML tags).  The
texts were then tagged using a POS tagger trained on the PPCEME.

### Accuracy

The PYCCLE texts have not been hand-corrected.  There are several
conceivable sources of error:
- Uncorrected OCR errors in the texts.
- Annotation differences between the TCP and PPCEME
  - PPCEME contractions are split manually.  The PYCCLE uses an
    automatic tokenizer which splits contractions based on Modern
    English rules.  Thus, non-standard contractions such as “shalbe” (=
    “shall be”) are not identified, and are often tagged incorrectly.
  - The PPCEME and TCP projects differ in their use of diacritics and
    Unicode characters to indicate non-standard orthographic variants,
    such as the superscript characters in words like M<sup>r</sup> or
    y<sup>rs</sup>; the diacritic representing a final “n” in words like
    “conditiõ”; and others.  Thus, these words may be incorrectly
    identified and tagged.
  - The TCP includes texts (or parts of texts) in foreign languages such
    as Latin and Welsh.
- Inherent limitations of automatic POS tagging

## Metadata

The files are supplied with a csv file listing their code name (A or B
followed by 5 digits for the EEBO; K followed by 6 digits for the ECCO).
This information has been automatically scraped from metadata supplied
with the corpus, and may in rare cases be incorrect or incomplete.  More
complete metadata is available on the
[Oxford Text Archive website](http://ota.ox.ac.uk/tcp/).  I have not
been able to locate this metadata in a machine-readable format.  **If
you are able to supply this information please get in touch with me.**

## Searching

You can use the
[Weihnachsgurke](https://github.com/aecay/weihnachtsgurke) program for
searching the PYCCLE.

## Licensing

The original texts from the TCP are licensed under the
[CC0](https://creativecommons.org/about/cc0) license.  The
PYCCLE-annotated versions are licensed under the
[CC Attribution](https://creativecommons.org/licenses/by/4.0/) license.
This means that you must cite the PYCCLE when you create materials based
off of it, but you are otherwise free to use it as you see fit.  For
academic publications, an appropriate citation is:

> Ecay, Aaron.  (2015).  “The Penn-York Computer-annotated Corpus of a
> Large amount of English based on the TCP (PYCCLE-TCP)”.  Public
> release 1.  <https://github.com/uoy-linguistics/pyccle>.

As a courtesy, **I would appreciate being notified if you create a
publication or resource based on PYCCLE** (including a conference
presentation or poster, academic article, online resource, further
annotated database, etc.)

## Updates

If you would like to be notified of updates to the corpus, please
subscribe to
[this issue](https://github.com/uoy-linguistics/pyccle/issues/1) in the
project’s Github repository.  Updates will be posted as comments there.

## Reporting issues

You can also use the Github
[issue tracker](https://github.com/uoy-linguistics/pyccle/issues) to
report issues with the corpus.
