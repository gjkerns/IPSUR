
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
	 :publishing-directory "output"
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
	 :base-extension "css\\|js\\|png\\|jpg\\|ico\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt\\|asc"
	 :publishing-directory "output"
	 :recursive t
	 :publishing-function org-publish-attachment)	
	("ipsurweb" :components ("ipsurweb-notes" "ipsurweb-static"))))

