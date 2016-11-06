;; LaTeX spezifische Emaeggssachen
;;(add-to-list 'load-path (expand-file-name "/Users/Shared/Software/Office/Emacs/doc-view"))
;;(require 'doc-view)


;;; Some Variables
(setq TeX-DVI-via-PDFTeX t)
;(setq TeX-PDF-mode t)
(setq TeX-auto-local ".auto/")
(setq TeX-auto-save t)
(setq TeX-save-query nil)
(setq TeX-insert-braces nil)
(setq TeX-master nil)
(setq TeX-open-quote ",,")
(setq TeX-parse-self t)
(setq TeX-printer-list
   (quote
    (("Local" "%l '\\nonstopmode\\input{%t}' ; dvips %d -o %f ; lp -o duplex  %f" "lpq ")
     ("ps"))))
(setq TeX-view-style
   (quote
    ((".*" "open %pdf")
     (".*" "xpdf -g 1270x990-1+1 -z width %pdf")
     ("^a4\\(?:dutch\\|paper\\|wide\\)?\\|sem-a4$" "%(o?)xdvi -bg white -fg black -cr red  %dS -paper a4 %d")
     ("^a5\\(?:comb\\|paper\\)?$" "%(o?)xdvi -bg white -fg black -cr red  %dS -paper a5 %d")
     ("^b5paper$" "%(o?)xdvi -bg white -fg black -cr red  %dS -paper b5 %d")
     ("^letterpaper$" "%(o?)xdvi -bg white -fg black -cr red  %dS -paper us %d")
     ("^legalpaper$" "%(o?)xdvi -bg white -fg black -cr red  %dS -paper legal %d")
     ("^executivepaper$" "%(o?)xdvi -bg white -fg black -cr red  %dS -paper 7.25x10.5in %d")
     ("^landscape$" "%(o?)xdvi -bg white -fg black -cr red  %dS -paper a4r -s 0 %d")
     ("." "%(o?)xdvi -bg white -fg black -cr red  %dS %d"))))


;;set XeLaTeX mode in tex/latex
(setq TeX-command-default "xelatex")
(setq LaTeX-command "xelatex")
(setq LaTeX-command-style (quote (("." "xelatex"))))
(setq
 TeX-command-list
 (quote
  (("XeLaTeX" "xelatex -interaction=nonstopmode %s" TeX-run-LaTeX nil t :help "Run xelatex")
   ("XeLaTeX Interactive" "xelatex %s" TeX-run-interactive nil t :help "Run xelatex interactively")
;;   ("LaTeX" "%l '\\nonstopmode\\input{%t}'" TeX-run-LaTeX nil t)
;;   ("LaTeX Interactive" "%l %t" TeX-run-interactive nil t)
   ("View" "%v " TeX-run-silent nil nil)
   ("BibTeX" "bibtex %s" TeX-run-BibTeX nil nil)
   ("Index" "makeindex %s" TeX-run-command nil t)
   ("Clean" "/Users/Shared/Bin/clean" TeX-run-command nil t))))


(setq
 TeX-expand-list
   (quote
    (("%p" TeX-printer-query)
     ("%q"
      (lambda nil
        (TeX-printer-query t)))
     ("%V"
      (lambda nil
        (TeX-output-style-check TeX-output-view-style)))
     ("%v"
      (lambda nil
        (TeX-style-check TeX-view-style)))
     ("%r"
      (lambda nil
        (TeX-style-check TeX-print-style)))
     ("%l"
      (lambda nil
        (TeX-style-check LaTeX-command-style)))
     ("%(PDF)"
      (lambda nil
        (if
            (and
             (not TeX-Omega-mode)
             (or TeX-PDF-mode TeX-DVI-via-PDFTeX))
            "pdf" "")))
     ("%(PDFout)"
      (lambda nil
        (if
            (and
             (not TeX-Omega-mode)
             (not TeX-PDF-mode)
             TeX-DVI-via-PDFTeX)
            " \"\\pdfoutput=0 \"" "")))
     ("%(mode)"
      (lambda nil
        (if TeX-interactive-mode "" "\\nonstopmode")))
     ("%(o?)"
      (lambda nil
        (if TeX-Omega-mode "o" "")))
     ("%(tex)"
      (lambda nil
        (if TeX-Omega-mode TeX-Omega-command TeX-command)))
     ("%(latex)"
      (lambda nil
        (if TeX-Omega-mode LaTeX-Omega-command LaTeX-command)))
     ("%(execopts)" ConTeXt-expand-options)
     ("%S" TeX-source-specials-expand-options)
     ("%dS" TeX-source-specials-view-expand-options)
     ("%cS" TeX-source-specials-view-expand-client)
     ("%s" file nil t)
     ("%t" file t t)
     ("%n" TeX-current-line)
     ("%d" file "dvi" t)
     ("%pdf" file "pdf" t)
     ("%f" file "ps" t)
     ("%o" TeX-view-output-file)
     ("%b" TeX-current-file-name-master-relative))))


(defun zeig-an()
  (interactive)
  (save-buffer)
  (TeX-command "View" 'TeX-master-file))


(defun erneure-anzeige(buffername dateiname)
  (interactive)
  (switch-to-buffer buffername)
  (set-buffer buffername)
  (let ((aktuelle-seite doc-view-current-page))
	(doc-view-clear-cache)
	(doc-view t dateiname)
	(set-variable 'doc-view-current-page aktuelle-seite))
  (switch-to-buffer texdatei)
  (set-buffer texdatei)
)

(defun erstelle-anzeige(dateiname)
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (doc-view t dateiname)
;  (other-window 1)
)

(defun latexrot(string)
  (interactive "sroeten: ")
  (insert-string (concat "\\rot{" string "}")))

(defun teche()
  (interactive)
  (save-buffer)
  (TeX-command "XeLaTeX" 'TeX-master-file))

; Tastaturbefehle
(define-key LaTeX-mode-map [f12]    'teche)
(define-key LaTeX-mode-map [M-f12]  'teche)
(define-key LaTeX-mode-map [C-f12]  'latexrot)
(define-key LaTeX-mode-map [S-f12]  'zeig-an)


; EIN SCHOENER IMAEGGS
(kltlayout)

;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
