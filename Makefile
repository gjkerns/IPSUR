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

basedir  = git
buildir  = build
ipsurdir = IPSUR
psdir    = ps
pdfdir   = pdf
htmldir  = html
texdir   = tex
orgfile  = IPSUR
backdir  = backup
Rdir     = R

all:
	-mkdir $(texdir)
	-mkdir $(psdir)
	emacs -Q -batch -eval "(progn (load \"~/$(basedir)/$(ipsurdir)/init-ipsur.el\") (R) (org-publish \"ipsurlatex\"))"
	-cd $(texdir); latex $(orgfile).tex; bibtex $(orgfile); makeindex $(orgfile); latex $(orgfile).tex; latex $(orgfile).tex; dvips $(orgfile)
	gs -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(texdir)/$(orgfile).pdf $(texdir)/$(orgfile).ps
	-rm -r ~/.org-timestamps

tex:
	-mkdir $(texdir)
	emacs -Q -batch -eval "(progn (load \"~/$(basedir)/$(ipsurdir)/init-ipsur.el\") (R) (org-publish \"ipsurlatex\"))"
	-rm -r ~/.org-timestamps

pdf:
	-rm $(pdfdir)
	cp -R $(texdir) $(pdfdir)
	-cd $(pdfdir); pdflatex $(orgfile).tex; bibtex $(orgfile); makeindex $(orgfile); pdflatex $(orgfile).tex

texpdf:
	-mkdir $(texdir)
	-mkdir $(psdir)
	emacs -Q -batch -eval "(progn (load \"~/$(basedir)/$(ipsurdir)/init-ipsur.el\") (R) (org-publish \"ipsurlatex\"))"
	cp -R $(texdir) $(pdfdir)
	-cd $(pdfdir); pdflatex $(orgfile).tex; bibtex $(orgfile); makeindex $(orgfile); pdflatex $(orgfile).tex
	-rm -r ~/.org-timestamps

figures:
	-mkdir $(psdir)
	emacs -Q --batch --eval "(progn (load \"~/$(basedir)/$(ipsurdir)/init-ipsur.el\") (R) (find-file \"~/$(basedir)/$(ipsurdir)/$(orgfile).org\") (org-babel-execute-buffer) (kill-buffer))"

pkg:
	R CMD build pkg

check:
	R CMD check *.tar.gz

Rtangle:
	-mkdir $(Rdir)
	emacs -Q --batch --eval "(progn (load \"~/$(basedir)/$(ipsurdir)/init-ipsur.el\") (R) (find-file \"~/$(basedir)/$(ipsurdir)/$(orgfile).org\") (org-babel-tangle) (kill-buffer))"

web:
	@echo "Generating HTML..."
	emacs -Q -batch -eval "(progn (load \"~/git/IPSUR/www/publish_config.el\") (org-publish \"ipsurweb\"))"
	@echo "HTML generation done"
	-rm -r ~/.org-timestamps

publish:
	@echo "Generating HTML..."
	emacs -Q -batch -eval "(progn (load \"~/git/IPSUR/www/publish_config.el\") (org-publish \"ipsurweb\"))"
	@echo "HTML generation done"
	-rm -r ~/.org-timestamps
	cd ~/git/IPSURweb
	git add -A
	git commit -m "publishing website"
	git push
	cd ~/git/IPSUR

backup:
	-mkdir $(backdir)
	cp $(texdir)/$(orgfile).pdf $(backdir)/$(orgfile).pdf 

clean:
	-rm -r $(texdir)
	-rm -r $(pdfdir)
	-rm -r IPSUR.Rcheck
	-rm -r ~/.org-timestamps

distclean:
	-rm -r $(texdir)
	-rm -r $(pdfdir)
	-rm -r $(backdir)
	-rm -r $(Rdir)
	-rm -r IPSUR.Rcheck
	-rm -r ~/.org-timestamps
