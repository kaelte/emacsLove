;;(setq debug-on-error t)
;;(setenv "PATH" (getenv "PATH"))

;;(setq exec-path (getenv "PATH"))


;;; fuer umlaute et al.
(load "~/.emacs.d/utf8.el")

;;; einige tasturmakri
(load "~/.emacs.d/keyboard.el")

;;; basic emacs layout
(load "~/.emacs.d/layout.el")

;;; fuer die rechtschreibpruefung
(load "~/.emacs.d/orthography.el")


;;; WEITERE IMAEGGSADATEIEN

;;; Package Manager
(load "~/.emacs.d/packages.el")

(setq auto-mode-alist
      (nconc
       '(("\\.gp$" . gnuplot-mode))
       '(("\\.html$" . html-mode))
       '(("\\.sql$" . sql-mode))
       '(("\\.type$" . sql-mode))
       '(("\\.xml$" . html-mode))
       auto-mode-alist))

;;; Gnuplot
(add-hook 'gnuplot-mode (function (lambda() (load "~/.emacs.d/gnuplot.el"))))


;;; for editing HTML files
(add-hook 'nxml-mode (function (lambda() (load "~/.emacs.d/htmlMode.el"))))
(add-hook 'html-mode (function (lambda() (load "~/.emacs.d/htmlMode.el"))))
(add-hook 'xhtml-mode (function (lambda() (load "~/.emacs.d/htmlMode.el"))))

;;; for LaTeX mode
(add-hook 'LaTeX-mode-hook (function (lambda() (load "~/.emacs.d/latexMode.el"))))

;;; for Scala mode
(add-hook 'scala-mode-hook (function (lambda() (load "~/.emacs.d/scalaMode.el"))))

;;; for SQL mode
(add-hook 'sql-mode-hook (function (lambda() (load "~/.emacs.d/sqlMode.el"))))

;;; for Shell Script mode
(add-hook 'sh-mode-hook (function (lambda() (load "~/.emacs.d/shellScriptMode.el"))))


(message "dotEmacs.el loaded :)")

;;; Local Variables:
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
