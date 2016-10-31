;;; fuer umlaute et al.
(load "~/.emacs.d/utf8.el")

;;; einige tasturmakri
(load "~/.emacs.d/keyboard.el")

;;; basic emacs layout
(load "~/.emacs.d/layout.el")

;;; fuer die rechtschreibpruefung
(load "~/.emacs.d/orthography.el")


;;; a pretty print
(setenv "GS_LIB" "c:/App/gs/gs9.16/lib;c:/App/gs/gs9.16/fonts")
(setq ps-lpr-command "c:/App/gs/gs9.16/bin/gswin64c.exe")
(setq ps-lpr-switches '("-dNOPAUSE" "-dBATCH" "-r288" "-g2380x3368" "-sDEVICE=pdfwrite" "-sOutputFile=m:/Desktop/emacs_druck.pdf"))
(setq ps-printer-name t)
(setq ps-header-title-font-size (quote (10 . 12)))
(setq ps-font-size (quote (7 . 8)))
(setq ps-paper-type (quote a4))


;;; ENABLE FUNCTIONS
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)



;;; CUA mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy nil) ;; Standard Windows behaviour-bash: cua-mode: command not found


(setq auto-mode-alist
      (nconc
       '(("\\.gp$" . gnuplot-mode))
       '(("\\.html$" . html-mode))
       '(("\\.sql$" . sql-mode))
       '(("\\.type$" . sql-mode))
       '(("\\.xml$" . html-mode))
       auto-mode-alist))


;;; WEITERE IMAEGGSADATEIEN

;;; Gnuplot
(add-hook 'gnuplot-mode (function (lambda() (load "~/.emacs.d/gnuplot.el"))))


;;; for editing HTML files
(add-hook 'nxml-mode (function (lambda() (load "~/.emacs.d/htmlMode.el"))))
(add-hook 'html-mode (function (lambda() (load "~/.emacs.d/htmlMode.el"))))

;;; for LaTeX mode
(add-hook 'LaTeX-mode-hook (function (lambda() (load "~/.emacs.d/latexMode.el"))))

;;; for Scala mode
(add-hook 'scala-mode-hook (function (lambda() (load "~/.emacs.d/scalaMode.el"))))

;;; for SQL mode
(add-hook 'sql-mode-hook (function (lambda() (load "~/.emacs.d/sqlMode.el"))))

;;; for Shell Script mode
(add-hook 'sh-mode-hook (function (lambda() (load "~/.emacs.d/shellScriptMode.el"))))

;;; Package Manager
(load "~/.emacs.d/packages.el")

;;; No idea if that helps
(setq ensime-mode-key-prefix [?\C-c ?e])


(message "dotEmacs.el loaded :)")

;;; Local Variables:
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
