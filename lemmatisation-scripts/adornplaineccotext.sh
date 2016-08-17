#!/bin/bash
java -Xmx8g -Xss1m -cp :bin/:dist/*:lib/* \
	edu.northwestern.at.morphadorner.MorphAdorner \
	-p eccoplaintext.properties ^
	-l data/eccolexicon.lex ^
	-t data/ncftransmat.mat ^
	-u data/eccosuffixlexicon.lex ^
	-a data/ncfmergedspellingpairs.tab ^
	-a data/eccomergedspellingpairs.tab ^
	-s data/standardspellings.txt ^
	-w data/spellingsbywordclass.txt ^
	-o $1 \
	"${@:2}"
