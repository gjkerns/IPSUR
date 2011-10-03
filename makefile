outputtex = .outputtex
outputhtml = .outputhtml
orgfile = IPSUR
backup = .backup

all:
	emacs -batch -eval "(progn (load \"~/git/org-mode/lisp/org.el\") \
	(load \"~/git/config/dotemacs.el\") \
	(R) \
	(org-publish \"ipsurlatex\") \
	(org-babel-tangle-file \"IPSUR.org\") \
	(org-publish \"ipsurhtml\"))"
	cd $(outputtex)
	latex $(orgfile).tex
	bibtex $(orgfile)
	makeindex $(orgfile)
	latex $(orgfile).tex
	latex $(orgfile).tex
	dvips $(orgfile)
	gs -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(orgfile).pdf $(orgfile).ps

latex:
	emacs -batch -eval "(progn (load \"~/git/org-mode/lisp/org.el\") (load \"~/git/config/dotemacs.el\") (R) (org-publish \"ipsurlatex\"))"
	cd $(outputtex)
	latex $(orgfile).tex
	bibtex $(orgfile)
	makeindex $(orgfile)
	latex $(orgfile).tex
	latex $(orgfile).tex
	dvips $(orgfile)
	gs -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(orgfile).pdf $(orgfile).ps

html:
	emacs -batch -eval "(progn (load \"~/git/org-mode/lisp/org.el\") \
			   (load \"~/git/config/dotemacs.el\") \
                           (R) \
                           (org-publish \"ipsurhtml\"))"
	rm sitemap.org
	rm theindex.org
	rm *.orgx

R:
	emacs -batch -eval "(progn (load \"~/git/org-mode/lisp/org.el\") \
			   (load \"~/git/config/dotemacs.el\") \
                           (R) \
                           (org-babel-tangle-file \"IPSUR.org\"))"

clean:
	-rm -r $(outputtex)
	-rm -r $(outputhtml)

backup:
	-mkdir $(backup)
	cp $(outputtex)/$(orgfile).pdf $(backup)/$(orgfile).pdf 
	cp $(outputhtml)/$(orgfile).html $(backup)/$(orgfile).html
