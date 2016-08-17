#!/bin/bash
#Lemmatise the PYCCLE corpus with MorphAdorner

# Extract text without POS tags
echo "Striping POS tags from PYCCLE texts"
mkdir eebo-raw
for file in $(ls eebo-texts); do
	cut -f1 ./eebo-texts/$file > ./eebo-raw/$file
done
mkdir ecco-raw
for file in $(ls ecco-texts); do
	cut -f1 ./ecco-texts/$file > ./ecco-raw/$file
done

# Run MorphAdorner
echo "Running MorphAdorner"
mkdir eebo-out
mkdir ecco-out
cd morphadorner-2.0.1
source ../lemmatisation-scripts/adornplainemetext.sh
source ../lemmatisation-scripts/adornplaineccotext.sh 
cd ../

# Recombining MorphAdorner and PYCCLE
echo "Recombining MorphAdorner and PYCCLE"
mkdir eebo-final
mkdir ecco-final
python ./lemmatisation-scripts/recombine.py

# Clean up
if [ $1 == "clean" ]; then
	echo "Removing intermediate files"
	rm -r eebo-raw
	rm -r ecco-raw
	rm -r eebo-out
	rm -r ecco-out
fi
