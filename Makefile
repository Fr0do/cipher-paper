MAIN    = cipher
LATEX   = pdflatex
BIBTEX  = bibtex

.PHONY: all clean watch

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex sections/*.tex checklist.tex references.bib
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

clean:
	rm -f $(MAIN).{aux,bbl,blg,log,out,pdf,synctex.gz,fls,fdb_latexmk}
	rm -f sections/*.aux

watch:
	fswatch -o $(MAIN).tex sections/*.tex checklist.tex references.bib | xargs -n1 -I{} make all
