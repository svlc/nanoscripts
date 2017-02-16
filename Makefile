SHELL = /bin/sh

# clear, then define suffix list
.SUFFIXES:
.SUFFIXES: .rst .html .pdf

IN_FILES = $(wildcard *.rst)
HTML_FILES = $(patsubst %.rst,%.html,$(IN_FILES))
PDF_FILES = $(patsubst %.rst,%.pdf,$(IN_FILES))

.PHONY: all clean
all   : $(HTML_FILES) $(PDF_FILES)

html:	$(HTML_FILES) figures/nanoscripts.png

pdf:	$(PDF_FILES)

%.pdf: %.rst
	rst2pdf $(<)

%.html: %.rst
	rst2html2 $(<) > $(@)

figures/nanoscripts.png:	figures/nanoscripts.svg
	inkscape -f $< -e $(@) -h "117"

clean :
	rm -f $(HTML_FILES) $(PDF_FILES)
	find . -name "*~" -type f -print0 | xargs -0 rm -f
