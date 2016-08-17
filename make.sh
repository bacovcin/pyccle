#!/bin/bash
#Lemmatise the PYCCLE corpus with MorphAdorner

# Extract text without POS tags
echo "Striping POS tags from PYCCLE texts"
mkdir eebo-raw
for file in ./eebo-texts/*.tag; do
	cut -f1 $file > ./eebo-raw/$file
done
mkdir ecco-raw
for file in ./eebo-texts/*.tag; do
	cut -f1 $file > ./ecco-raw/$file
done

# Run MorphAdorner
echo "Running MorphAdorner"
cp ./lemmatisation-scripts/adornplainemetext.sh ./morphadorner-2.0.1/
mkdir eebo-out
bash ./morphadorner-2.0.1/adornplainemetext.sh ./eebo-out ./eebo-raw/*.tag

cp ./lemmatisation-scripts/adornplaineccotext.sh ./morphadorner-2.0.1/
mkdir ecco-out
bash ./morphadorner-2.0.1/adornplaineccotext.sh ./ecco-out ./ecco-raw/*.tag

# Recombining MorphAdorner and PYCCLE
echo "Recombining MorphAdorner and PYCCLE"
mkdir eebo-final
mkdir ecco-final
python ./emmatisation-scripts/recombine.py

# Clean up
if [$1 == 'clean']; then
	echo "Removing intermediate files"
	rm -r eebo-raw
	rm -r ecco-raw
	rm -r eebo-out
	rm -r ecco-out
fi
