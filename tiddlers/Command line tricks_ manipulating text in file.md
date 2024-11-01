<br><br>

**Command line tools: `sed`, `awk`.**

*Results will be printed instead of being saved to the original file (add `-i` if needed)*

<br>

#### Print text

* print the 1st and 3rd line of the file
	```bash
	sed -n '1,3p' file # using sed
	cat file | awk '{ print $1 $3 }' # using awk
	```
	
* print the lines that contain "text"
	```bash
	sed -n '/text/p' file.txt
	```

* print the last line and its line number
	```bash
	sed -n '$p;$=' file # using sed
	awk 'END{print NR; print }' file # using awk
	```

* print even lines
	```bash
	sed -n 'n;p' file
	```

* print odd lines
	```bash
	sed -n 'p;n' file
	```

* print the first column with separator `-`
	```bash
	awk -F- '{print $1}' file
	```

* print the 4th and the last columns
	```bash
	awk '{ print $4, $NF}' file
	```

<br>

#### Replace text

* replace all the "test" with "test2", starting at the line N
	```bash
	sed 's/test/test2/Ng' file
	```

* Find all the words, replace them with [word]
	```bash
	sed -n 's/\w\+/[&]/gp'
	```


<br>

#### Insert text

* insert 'new line' before all the lines that start with 'test'
	```bash
	sed '/^test/i\new line` file
	```

* insert 'new line' after all the lines that start with 'test'
	```bash
	sed '/^test/a\new line` file
	```

* insert a prefix string to the begining of each line
	```bash
	sed -e 's/^/prefix/' file > newfile
	```

* insert a prefix string to the end of each line
	```bash
	sed -e 's/$/prefix/' file > newfile
	```
	
* insert "text" before the 10th line
	```bash
	sed '10 i\text' input.txt
	```

<br>

#### Delete text

* delete all the lines from the 2nd line to the last line
	```bash
	sed '2,$d' file
	```

* delete lines 2-5 and line 10
	```bash
	sed -e '2,5d;10d' file
	```
