TEX = latex
BIBTEX = bibtex
TOPS = dvips
TOPDF = ps2pdf
SUB = msV0
PROG_TEX = tex
PROG_DVI = dvi
PROG_PS = ps
TARG_TEX = ${SUB}.tex
OBJ_TEX = ${SUB}.dvi
OBJ_DVI = ${SUB}.ps
OBJ_PS = ${SUB}.pdf

all: $(PROG_PS)

$(PROG_PS) : $(OBJ_DVI) 
	$(TOPDF) $(OBJ_DVI)

$(OBJ_TEX) : $(TARG_TEX) 
	$(TEX) $(SUB)
	$(BIBTEX) $(SUB)
	$(TEX) $(SUB)
	$(TEX) $(SUB)


$(OBJ_DVI) : $(OBJ_TEX)
	$(TOPS) $(OBJ_TEX)


.PHONY: clean
clean:
	$(RM) ${SUB}.dvi
	$(RM) ${SUB}.ps
	$(RM) ${SUB}.pdf
	$(RM) ${SUB}.log
	$(RM) ${SUB}.aux
	$(RM) ${SUB}.bbl
	$(RM) ${SUB}.bbg
