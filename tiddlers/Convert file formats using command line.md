<br><br>

Tools needed: `convert`, `pandoc`, `mutool`.

<br>

* `PNG` to `EPS`
	```bash
	convert input.png eps2:output.eps
	```

<br>

* `PNG` to `PDF`
	```bash
	mutool convert -o output.pdf input.png
	mutool convert -o output.pdf *.png # multiple images
	```

<br>

* `PDF` to `TXT`
	```bash
	mutool draw -F txt input.pdf -o output.txt
	```

<br>

* `PDF` to `PNG` (pages 1-10, rotate 90 degree, resolution 200 dpi)
	```bash
	mutool convert -O rotate=90 resolution=200 -o output%d.png input.pdf 1-10
	```

<br>

* `LaTeX` to `Docx` with bibliography (in [IEEE style](https://github.com/citation-style-language/styles/blob/master/ieee.csl))
	```bash
	pandoc -s input.tex --bibliography input.bib --citeproc --csl ieee.csl -o output.docx
	```	

<br>

* `LaTeX` bibliography to `HTML` (in [IEEE style](https://github.com/citation-style-language/styles/blob/master/ieee.csl))
	```bash
	pandoc -s input.bib --citeproc --csl ieee.csl -o output.html
	```
