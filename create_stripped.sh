for i in *_tetel.tex; do
	echo -n "generating stripped version from ${i}... ";
	awk '/\maketitle/ {p=1;next}p' "$i" | sed -r "s/\\\end\{document\}//" > "${i%.tex}_stripped.tex";
	echo "${i%.tex}_stripped.tex OK"
done
