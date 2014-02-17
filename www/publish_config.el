;;    IPSUR: Introduction to Probability and Statistics Using R
;;    Copyright (C) 2014 G. Jay Kerns
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
(require 'org)
(require 'ox-publish)

(setq org-publish-project-alist
      '(;; These are the main web files
	("ipsurweb-notes"
	 :base-directory "~/git/IPSUR/www/" ;; Change this to your local dir
	 :base-extension "org"
	 :publishing-directory "~/git/IPSURweb"
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
	 :base-directory "~/git/IPSUR/www/" ;; Change this to your local dir
	 :base-extension "css\\|R\\|RData\\|js\\|png\\|jpg\\|ico\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt\\|asc"
	 :publishing-directory "~/git/IPSURweb"
	 :recursive t
	 :publishing-function org-publish-attachment)	
	("ipsurweb" :components ("ipsurweb-notes" "ipsurweb-static"))))

