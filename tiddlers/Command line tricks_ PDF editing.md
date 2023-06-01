<br><br>

**Command line tools: `qpdf`, `mutool`.**

<br>

* merge multiple PDF files
	```bash
	qpdf --empty --pages input1.pdf input2.pdf -- output.pdf
	```

<br>

* extract pages 1-10 and drop metadata for the rest pages
	```bash
	qpdf --empty --pages input.pdf 1-10 -- output.pdf
	```

<br>

* rotate all the pages for 90 degree
	```bash
	qpdf input.pdf --rotate=+90 output.pdf
	```

<br>

* extract pages 1-10 (fonts and forms not supported)
	```bash
	mutool convert -o output.pdf input.pdf 1-10
	```	

<br>

* remove PDF password protection (need to know the password)
	```bash
	mutool clean -p "myPassword" -D input.pdf output.pdf
	```
	
