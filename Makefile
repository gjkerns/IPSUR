#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2013 G. Jay Kerns
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

texdir = tex
orgfile = IPSUR
backdir = backup

all:
	-mkdir $(texdir)
	emacs -batch -eval "(progn (load \"~/gitm/IPSUR/init-ipsur.el\") (R) (org-publish \"ipsurlatex\"))"
	-cd $(texdir); latex $(orgfile).tex; bibtex $(orgfile); makeindex $(orgfile); latex $(orgfile).tex; latex $(orgfile).tex; dvips $(orgfile)
	gs -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(texdir)/$(orgfile).pdf $(texdir)/$(orgfile).ps
	-rm -r ~/.org-timestamps

latex:
	-mkdir $(texdir)
	emacs -batch -eval "(progn (load \"~/gitm/IPSUR/init-ipsur.el\") (R) (org-publish \"ipsurlatex\"))"
	-cd $(texdir); latex $(orgfile).tex; bibtex $(orgfile); makeindex $(orgfile); latex $(orgfile).tex; latex $(orgfile).tex; dvips $(orgfile)
	gs -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(texdir)/$(orgfile).pdf $(texdir)/$(orgfile).ps
	-rm -r ~/.org-timestamps

backup:
	-mkdir $(backdir)
	cp $(texdir)/$(orgfile).pdf $(backdir)/$(orgfile).pdf 

clean:
	-rm -r $(texdir)

distclean:
	-rm -r $(texdir)
	-rm -r $(backdir)
