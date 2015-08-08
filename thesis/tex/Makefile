# The main latex-file
TEXFILE = main
OUT_DIR = ../out
OUT_OPTION = -output-directory $(OUT_DIR)
PDF_DIR = ../pdf
DATE_TIME = $(shell date '+%y%m%d-%H%M')
THESIS_NAME = thesis

# Fix reference file and compile source
default: full

full:
	mkdir -p $(OUT_DIR); \
	pdflatex $(OUT_OPTION) $(TEXFILE); \
	cd $(OUT_DIR); bibtex $(TEXFILE); cd -;\
	makeglossaries -d $(OUT_DIR) $(TEXFILE);\
	pdflatex $(OUT_OPTION) $(TEXFILE);\
	pdflatex $(OUT_OPTION) $(TEXFILE); \
	mkdir -p $(PDF_DIR); \
	cp $(OUT_DIR)/$(TEXFILE).pdf $(PDF_DIR)/$(THESIS_NAME)_$(DATE_TIME).pdf; \
	mv $(OUT_DIR)/$(TEXFILE).pdf ../$(THESIS_NAME).pdf;


# Removes TeX-output files
clean:
	cd $(OUT_DIR); \
	rm -f *.aux $(TEXFILE).bbl $(TEXFILE).blg *.log *.out $(TEXFILE).toc $(TEXFILE).lot $(TEXFILE).lof $(TEXFILE).glg $(TEXFILE).glo $(TEXFILE).gls $(TEXFILE).ist $(TEXFILE).acn $(TEXFILE).acr $(TEXFILE).alg $(TEXFILE).xdy $(TEXFILE).loa;\
	rm -f $(TEXFILE).lox; \
	cd -; \
	rmdir $(OUT_DIR); \
	rm -r $(PDF_DIR)/;

