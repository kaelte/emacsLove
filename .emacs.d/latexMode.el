;; LaTeX spezifische Emaeggssachen
;;(add-to-list 'load-path (expand-file-name "/Users/Shared/Software/Office/Emacs/doc-view"))
;;(require 'doc-view)



(defun zeig-an()
  (interactive)
  (save-buffer)
  (TeX-command "View" 'TeX-master-file))

; DOC-VIEW-Funktionen
; (defun zeig-an()
;   (interactive)
;   (let* ((pdfdatei (expand-file-name
; 				   (concat(TeX-master-file) ".pdf")))
; 		(texdatei (concat(TeX-master-file) ".tex"))
; 		(buffer (concat "*DocView: " pdfdatei "*")))
; 	(if (buffer-live-p (get-buffer buffer))
; 		(erneure-anzeige buffer pdfdatei)
; 	  (erstelle-anzeige pdfdatei))
; 	)
;   )


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
  (TeX-command "LaTeX" 'TeX-master-file))

;; funktioniert nicht
;(defun teche-und-zeig-an()
;  (interactive)
;  (if (teche) (zeig-an))
;)

; Tastaturbefehle

(define-key LaTeX-mode-map [f12]      'teche)
(define-key LaTeX-mode-map [M-f12]    'teche)
;(define-key LaTeX-mode-map [f12]     'TeX-command-master)
(define-key LaTeX-mode-map [C-f12]    'latexrot)

(define-key LaTeX-mode-map [f13]      'zeig-an)


; KEIN SCHOENER IMAEGGS
(kltlayout)

;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
