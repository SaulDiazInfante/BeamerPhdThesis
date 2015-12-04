# Makefile for LaTeX
##################################################################
# Use:
# make
# make clean
# options for ps2pdf: http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.50/Ps2pdf.htm

TEX:=$(shell ls *.tex)
FILES= *.tex Makefile *.bst *.pdf *.bib
FOLDER= BeamerPhdThesis/
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.out *.thm *.ps *.idx *.ilg *.ind *.tdo *.pdf *.tar.gz *.log *.spl *.synctex.gz
LATEX	= latex
BIBTEX	= bibtex
MAKEINDEX = makeindex
XDVI	= xdvi -gamma 4
DVIPS	= dvips
DVIPDF  = dvipdft
L2H	= latex2html
GH	= gv
FILES= *.tex *.sty *.png *.bbl *.bib *.pdf *.lyx Makefile *.mpg *jpg biblio
FOLDERS= \Imagenes \images
NAMETAR1:= $(shell date '+%Y%b%d_%H_%M')
NAMETAR="$(NAMETAR1)_BeamerPhdThesis.tar.gz"

pdflatex: BeamerPhdThesis.tex
	pdflatex --synctex=1 BeamerPhdThesis.tex
	sh biblio.sh
	bibtex BeamerPhdThesis.aux
	pdflatex --synctex=1 BeamerPhdThesis.tex
	pdflatex --synctex=1 BeamerPhdThesis.tex
clean:
	rm -f $(OTHER) $(PS)
	(cd introduction && rm -f $(OTHER) $(PS))
	(cd papers/* && rm -f $(OTHER) $(PS))

tar: $(FILES)
	(cd .. && tar -cvf $(NAMETAR) $(FOLDER))
	
