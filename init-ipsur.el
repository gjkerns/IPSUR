;;    IPSUR: Introduction to Probability and Statistics Using R
;;    Copyright (C) 2013 G. Jay Kerns
;;
;;    This file is part of IPSUR.
;;
;;    IPSUR is free software: you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation, either version 3 of the License, or
;;    (at your option) any later version.
;;
;;    IPSUR is distributed in the hope that it will be useful,
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;    GNU General Public License for more details.
::
;;    You should have received a copy of the GNU General Public License
;;    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

(defvar org-dist "~/git/org-mode")
(add-to-list 'load-path (concat org-dist "/lisp"))
(add-to-list 'load-path (concat org-dist "/contrib/lisp"))

(setq load-path (cons "~/git/ESS/lisp" load-path))
(require 'ess-site)
(setq ess-ask-for-ess-directory nil)

(require 'org)
(require 'ox-latex)
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (latex . t)
   (org . t)
   (sh . t)))
(setq org-entities-user nil)
(setq org-export-latex-packages-alist nil)
(setq ox-latex-classes nil)
(setq ox-latex-tables-booktabs nil)
(setq ox-latex-title-command nil)
(setq org-export-latex-hyperref-format "\\ref{%s}")
(setq org-latex-toc-command "\\tableofcontents\n\n")
(setq ox-latex-classes nil)
(add-to-list 'org-latex-classes
            '("scrbook"
               "\\documentclass{scrbook}
               [NO-DEFAULT-PACKAGES]"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")))

(setq org-publish-project-alist
      '(	
	("ipsurlatex-org"
	 :base-directory "~/git/IPSUR/"
	 :base-extension "org"
	 :publishing-directory "~/git/IPSUR/tex"
	 :publishing-function org-latex-publish-to-latex
	 :auto-sitemap nil
	 :makeindex nil
	 )
	
	("ipsurlatex-ps"
	 :base-directory "~/git/IPSUR/ps/"
	 :base-extension "ps"
	 :recursive t
	 :publishing-directory "~/git/IPSUR/tex/ps"
	 :publishing-function org-publish-attachment)

	("ipsurlatex-tex"
	 :base-directory "~/git/IPSUR/include/"
	 :base-extension "tex"
	 :publishing-directory "~/git/IPSUR/tex/include"
	 :publishing-function org-publish-attachment)
		
	("ipsurlatex-other"
	 :base-directory "~/git/IPSUR/include/"
	 :base-extension "bib"
	 :publishing-directory "~/git/IPSUR/tex/include"
	 :publishing-function org-publish-attachment)
	
	("ipsurlatex" :components ("ipsurlatex-org" "ipsurlatex-tex" "ipsurlatex-other" "ipsurlatex-ps"))
	))



