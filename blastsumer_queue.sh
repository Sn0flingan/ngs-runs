#!/bin/bash
# Usage: 
for f in $@
do
	echo "Processing file $f..."
	paste - - - - < "$f" | cut -f 1,2 | sed 's/^@/>/' | tr "\t" "\n" > temp_fasta.fa
        python3 ../BLASTsumer/blastsumer_simple.py temp_fasta.fa -o "$f".result.txt
done
