outputtex = .outputlatex
outputhtml = .outputhtml
orgfile = IPSUR
backup = .backup

all:
	-mkdir $(outputtex)
	-mkdir $(outputhtml)
	emacs -batch -eval "(progn (load \"~/git/org-mode/lisp/org.el\") (load \"~/git/config/dotemacs.el\") (R) (org-publish \"ipsurlatex\") (org-publish \"ipsurhtml\"))"
	-cd ~/git/IPSUR/.outputlatex; latex $(orgfile).tex; bibtex $(orgfile); makeindex $(orgfile); latex $(orgfile).tex; latex $(orgfile).tex; dvips $(orgfile)
	gs -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(outputtex)/$(orgfile).pdf $(outputtex)/$(orgfile).ps
	-rm -r ~/.org-timestamps

latex:
	-mkdir $(outputtex)
	emacs -batch -eval "(progn (load \"~/git/org-mode/lisp/org.el\") (load \"~/git/config/dotemacs.el\") (R) (org-publish \"ipsurlatex\"))"
	-cd ~/git/IPSUR/.outputlatex; latex $(orgfile).tex; bibtex $(orgfile); makeindex $(orgfile); latex $(orgfile).tex; latex $(orgfile).tex; dvips $(orgfile)
	gs -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.3 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(outputtex)/$(orgfile).pdf $(outputtex)/$(orgfile).ps
	-rm -r ~/.org-timestamps

html:
	-mkdir $(outputhtml)
	emacs -batch -eval "(progn (load \"~/git/org-mode/lisp/org.el\") (load \"~/git/config/dotemacs.el\") (R) (org-publish \"ipsurhtml\"))"
	-rm -r ~/.org-timestamps

R:
	emacs -batch -eval "(progn (load \"~/git/org-mode/lisp/org.el\") (load \"~/git/config/dotemacs.el\") (R) (org-babel-tangle-file \"IPSUR.org\"))"

clean:
	-rm -r $(outputtex)
	-rm -r $(outputhtml)

backup:
	-mkdir $(backup)
	cp $(outputtex)/$(orgfile).pdf $(backup)/$(orgfile).pdf 
	cp $(outputhtml)/$(orgfile).html $(backup)/$(orgfile).html
