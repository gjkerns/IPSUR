;;; init-ipsur.el --- IPSUR: Introduction to Probability and Statistics Using R
;;
;; Copyright (C) 2014 G. Jay Kerns
;;
;; Author: Jay Kerns <gkerns@ysu.edu>
;; Version: 2.0
;; Keywords: textbook, statistics
;; Package-Requires: ((ess "15.03") (org "8.2.10")))
;;
;; This file is part of IPSUR.
;;
;; IPSUR is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; IPSUR is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
::
;; You should have received a copy of the GNU General Public License
;; along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; This file contains a function to export IPSUR.org to PDF, Tex, HTML, etc.
;;
;;; Code:

(require 'ess-site)

(require 'org)
(require 'ox-latex)

(defvar ipsur-base-dir (file-name-directory load-file-name) "Base directory of IPSUR code.")

(defun ipsur-init ()
  "Initialize needed variables for IPSUR."
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
        `(
          ("ipsurlatex-org"
           :base-directory ,ipsur-base-dir
           :base-extension "org"
           :exclude "INSTALL.org"
           :publishing-directory ,ipsur-base-dir
           :publishing-function org-latex-publish-to-latex
           :auto-sitemap nil
           :makeindex nil)
          
          ("ipsurlatex-ps"
           :base-directory ,(file-name-directory (concat ipsur-base-dir "fig"))
           :base-extension "ps"
           :recursive t
           :publishing-directory ,(file-name-directory (concat ipsur-base-dir "fig"))
           :publishing-function org-publish-attachment)

          ("ipsurlatex-pdf"
           :base-directory ,(file-name-directory (concat ipsur-base-dir "fig"))
           :base-extension "pdf"
           :recursive t
           :publishing-directory ,(file-name-directory (concat ipsur-base-dir "fig"))
           :publishing-function org-publish-attachment)

          ("ipsurlatex-tex"
           :base-directory ,(file-name-directory (concat ipsur-base-dir "include"))
           :base-extension "tex"
           :publishing-directory ,(file-name-directory (concat ipsur-base-dir "include"))
           :publishing-function org-publish-attachment)
          
          ("ipsurlatex-other"
           :base-directory ,(file-name-directory (concat ipsur-base-dir "include"))
           :base-extension "bib"
           :publishing-directory ,(file-name-directory (concat ipsur-base-dir "include"))
           :publishing-function org-publish-attachment)
          
          ("ipsurlatex" :components ("ipsurlatex-org" "ipsurlatex-tex"  "ipsurlatex-pdf" "ipsurlatex-other" "ipsurlatex-ps"))

          ("ipsurweb-notes"
           :base-directory ,(file-name-directory (concat ipsur-base-dir "www"))
           :base-extension "org"
           :publishing-directory ,(file-name-directory (concat ipsur-base-dir "html"))
           :recursive t
           :publishing-function org-html-publish-to-html
           :headline-levels 4             ; Just the default for this project.
           :auto-preamble t
           :section-numbers nil
           :headline-levels 3
           :table-of-contents nil
           :html-doctype "html5"
           :html-head "<link rel='stylesheet' type='text/css' href='css/style.css' />"
           :html-head-include-default-style nil)
          
          ;; These are static files (images, pdf, etc)
          ("ipsurweb-static"
           :base-directory ,(file-name-directory (concat ipsur-base-dir "www"))
           :base-extension "css\\|R\\|RData\\|js\\|png\\|jpg\\|ico\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt\\|asc"
           :publishing-directory (file-name-directory (concat ipsur-base-dir "html"))
           :recursive t
           :publishing-function org-publish-attachment)

          ("ipsurweb" :components ("ipsurweb-notes" "ipsurweb-static")))))

(defmacro with-org-and-R (&rest body)
  "Macro to set-up R and org-file before executing BODY."
  `(let ((R-p (get-buffer "*R*"))
         (org-p (get-file-buffer (concat ipsur-base-dir "IPSUR.org"))))
     (when (not R-p)
       (setq ess-ask-for-ess-directory nil)
       (R)
       (set-process-query-on-exit-flag (get-process "R") nil))
     (find-file (concat ipsur-base-dir "IPSUR.org"))
     (ipsur-init)
     ,@body
     (when (not org-p)
       (kill-buffer))
     (when (not R-p)
       (kill-buffer (get-buffer "*R*")))))

(defun ipsur-make-figures ()
  "Create figures for IPSUR textbook."
  (interactive)
  (with-org-and-R
   (org-babel-execute-buffer)
   (save-buffer)))

(defun ipsur-publish (project)
  "Export IPSUR to a format determined by PROJECT."
  (interactive)
  (with-org-and-R
   (org-publish project)))

(defun ipsur-publish-pdf ()
    "Create PDF for IPSUR textbook."
    (interactive)
    (when (not (file-exists-p (concat ipsur-base-dir "IPSUR.tex")))
      (ipsur-publish "ipsurlatex"))
    (mapc #'shell-command (list "xelatex --interaction=nonstopmode IPSUR.tex"
                                "bibtex IPSUR"
                                "makeindex IPSUR"
                                "xelatex --interaction=nonstopmode IPSUR.tex"))
    (mapc #'(lambda (f)
              (delete-file (concat ipsur-base-dir f)))
          (list "IPSUR.aux" "IPSUR.bbl" "IPSUR.blg" "IPSUR.brf" "IPSUR.idx" "IPSUR.ilg" "IPSUR.ind"
                "IPSUR.lof" "IPSUR.log" "IPSUR.lot" "IPSUR.out" "IPSUR.tex" "IPSUR.toc")))

(defun ipsur-tangle ()
    "Generate R files for IPSUR textbook."
    (interactive)
    (with-org-and-R
     (org-babel-tangle)))

(provide 'init-ipsur)
;;; init-ipsur.el ends here
