#!/bin/bash

rm makelog
mkdir -p ./pdfs
rm ./pdfs/*
echo "generating separate theses..."
for i in *_tetel.tex; do
	echo -n "${i}..."
	echo "===processing ${i}===" >> makelog
	xelatex -8bit --shell-escape -synctex=1 --output-directory=pdfs/ -interaction=nonstopmode "${i}" >> makelog
	ret=$?
	if [ $ret -eq 0 ]; then
	 	echo "OK"
	else
		echo "[!] Failed, check ${i%.tex}.log"
	fi
	echo "===end of ${i}===" >> makelog
done
source create_stripped.sh
echo -n "generating complete document..."
echo "===processing full_document.tex===" >> makelog
xelatex -8bit --shell-escape -synctex=1 --output-directory=pdfs/ -interaction=nonstopmode "full_document".tex >> makelog
echo "===end of full_document.tex===" >> makelog
ret=$?
if [ $ret -eq 0 ]; then
	echo "OK"
else
	echo "[!] Failed, check full_document.log"
fi
echo -n "generating complete document (6\" ebook)..."
echo "===processing full_document_kindle.tex===" >> makelog
xelatex -8bit --shell-escape -synctex=1 --output-directory=pdfs/ -interaction=nonstopmode "full_document_ebook".tex >> makelog
echo "===end of full_document_kindle.tex===" >> makelog
ret=$?
if [ $ret -eq 0 ]; then
	echo "OK"
else
	echo "[!] Failed, check full_document_ebook.log"
fi
echo -n "generating complete document (kindle optimized version)..."
echo "===processing full_document_kindle_optimized.tex===" >> makelog
xelatex -8bit --shell-escape -synctex=1 --output-directory=pdfs/ -interaction=nonstopmode "full_document_kindle_optimized".tex >> makelog
echo "===end of full_document_kindle_optimized.tex===" >> makelog
ret=$?
if [ $ret -eq 0 ]; then
	echo "OK"
else
	echo "[!] Failed, check full_document_kindle_optimized.log"
fi
echo "cleaning up output directory"
rm ./pdfs/*.aux
rm ./pdfs/*.log
rm ./pdfs/*.gz
rm ./pdfs/*.out
rm ./pdfs/*.toc
echo -n "do you want to generate a zip from these (y/n)? "
read choice
if [ "$choice" == "y" ]; then
	zip -r -j pdfs/bsz2_tetelek.zip pdfs/
fi
