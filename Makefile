#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2014 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

.PHONY: pkg
.PHONY: www

basedir  := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
buildir  = $(basedir)/build
figdir   = $(basedir)/fig
psdir    = $(basedir)/ps
pdfdir   = $(basedir)/pdf
htmldir  = $(basedir)/html
texdir   = $(basedir)/tex
orgfile  = IPSUR
backdir  = $(basedir)/backup
Rdir     = $(basedir)/R

all:
	-mkdir $(texdir)
	-mkdir $(psdir)
	emacs --batch -eval "(progn (load \"$(basedir)/init-ipsur.el\") (R) (ipsur-publish \"ipsurlatex\"))"
	-cd $(texdir); latex $(orgfile).tex; bibtex $(orgfile); makeindex $(orgfile); latex $(orgfile).tex; latex $(orgfile).tex; dvips $(orgfile)
	gs -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(texdir)/$(orgfile).pdf $(texdir)/$(orgfile).ps
	-rm -r ~/.org-timestamps

tex:
	-mkdir $(texdir)
	emacs --batch --eval "(progn (load \"$(basedir)/init-ipsur.el\") (ipsur-publish \"ipsurlatex\"))"
	-rm -r ~/.org-timestamps

pdf:
	emacs --batch --eval "(progn (load \"$(basedir)/init-ipsur.el\") (ipsur-publish-pdf)"

texpdf: tex pdf

figures:
	emacs --batch --eval "(progn (load \"$(basedir)/init-ipsur.el\") (ipsur-make-figures))"

pkg:
	R CMD build pkg

check:
	R CMD check *.tar.gz

Rtangle:
	-mkdir $(Rdir)
	emacs --batch --eval "(progn (load \"$(basedir)/init-ipsur.el\") (R) (ipsur-init) (find-file \"$(basedir)/$(orgfile).org\") (org-babel-tangle) (kill-buffer))"

web:
	@echo "Generating HTML..."
	emacs --batch -eval "(progn (load \"$(basedir)/init-ipsur.el\") (ipsur-publish \"ipsurweb\"))"
	@echo "HTML generation done"
	-rm -r ~/.org-timestamps

publish:
	@echo "Generating HTML..."
	emacs --batch -eval "(progn (load \"$(basedir)/init-ipsur.el\") (ipsur-publish \"ipsurweb\"))"
	@echo "HTML generation done"
	-rm -r ~/.org-timestamps
	cd $(basedir)/html
	git add -A
	git commit -m "publishing website"
	git push
	cd $(basedir)/

backup:
	-mkdir $(backdir)
	cp $(orgfile).pdf $(backdir)/$(orgfile).pdf 

clean:
	-rm IPSUR.{aux,bbl,blg,brf,idx,ilg,ind,lof,log,lot,out,tex,toc}
	-rm -r IPSUR.Rcheck
	-rm -r ~/.org-timestamps

distclean:
	-rm IPSUR.{aux,bbl,blg,brf,idx,ilg,ind,lof,log,lot,out,pdf,tex,toc}
	-rm -r $(backdir)
	-rm -r $(Rdir)
	-rm -r IPSUR.Rcheck
	-rm -r ~/.org-timestamps
