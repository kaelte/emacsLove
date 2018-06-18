(if (not (getenv "TERM_PROGRAM"))
    (let ((path (shell-command-to-string "$SHELL -cl \"printf %s \\\"\\\$PATH\\\"\"")))
      (setenv "PATH" path)))
(setq exec-path (split-string (getenv "PATH") ":"))

(defvar emacsD (file-name-directory load-file-name))
(defun loadMyFile (fileName) (load (concat emacsD fileName)))


;;; fuer umlaute et al.
(loadMyFile "./utf8.el")

;;; einige tasturmakri
(loadMyFile "keyboard.el")

;;; basic emacs layout
(loadMyFile "layout.el")

;;; fuer die rechtschreibpruefung
(loadMyFile "orthography.el")


;;; WEITERE IMAEGGSADATEIEN

;;; Package Manager
(loadMyFile "packages.el")

(setq auto-mode-alist
      (nconc
       '(("\\.gp$" . gnuplot-mode))
       '(("\\.html$" . html-mode))
       '(("\\.sql$" . sql-mode))
       '(("\\.type$" . sql-mode))
       '(("\\.xml$" . html-mode))
       auto-mode-alist))

;;; Gnuplot
(add-hook 'gnuplot-mode (function (lambda() (loadMyFile "gnuplot.el"))))


;;; for editing HTML files
(add-hook 'nxml-mode (function (lambda() (loadMyFile "htmlMode.el"))))
(add-hook 'html-mode (function (lambda() (loadMyFile "htmlMode.el"))))
(add-hook 'xhtml-mode (function (lambda() (loadMyFile "htmlMode.el"))))

;;; for LaTeX mode
(add-hook 'LaTeX-mode-hook (function (lambda() (loadMyFile "latexMode.el"))))

;;; for Scala mode
(add-hook 'scala-mode-hook (function (lambda() (loadMyFile "scalaMode.el"))))

;;; for SQL mode
(add-hook 'sql-mode-hook (function (lambda() (loadMyFile "sqlMode.el"))))

;;; for Shell Script mode
(add-hook 'sh-mode-hook (function (lambda() (loadMyFile "shellScriptMode.el"))))


(message "dotEmacs.el loaded :)")
(message "PATH:")
(message (getenv "PATH"))
(message "exec-path")
(prin1 exec-path)

;;; Local Variables:
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
