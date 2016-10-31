;;; G N U P L O T


;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
;;  (setq load-path (append (list "/sw/share/emacs/site-lisp/bbdb") load-path))

;; these lines enable the use of gnuplot mode
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode 
(global-set-key [M-f9] 'gnuplot-make-buffer)

;; end of line for gnuplot-mode
;;--------------------------------------------------------------------

;;(add-to-list
;; 'Info-default-directory-list
;; "/Users/Shared/Software/Office/Emacs/gnuplot-mode.0.6.0")

(message "gnuplot.el loaded :)")


;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
