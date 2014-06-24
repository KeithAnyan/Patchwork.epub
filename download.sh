#!/bin/sh

# mkdir
mkdir -p OEBPS/Text originals

# download
while read p; do
	name=$(basename $p)
	orig=originals/$name
	targ=OEBPS/Text/$name
	curl $p > $orig
	php utils/blogger.php $orig > $targ
done <urls

