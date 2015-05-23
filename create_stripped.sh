for i in *_tetel.tex; do
	awk '/\maketitle/ {p=1;next}p' "$i" | sed -r "s/\\\end\{document\}//" > "${i%.tex}_stripped.tex"
done
