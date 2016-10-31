; PSGML for editing XML and XHTML

;;(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
;;(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)


;;(add-hook 'xml-mode-hook   ; XML-specific settings
;;        (function (lambda()

; faces creation
(make-face 'sgml-comment-face)
(make-face 'sgml-start-tag-face)
(make-face 'sgml-end-tag-face)
(make-face 'sgml-doctype-face)

; faces definitions
(set-face-foreground 'sgml-comment-face "SeaGreen")
(set-face-foreground 'sgml-start-tag-face "OrangeRed")
(set-face-foreground 'sgml-end-tag-face "OrangeRed")
(set-face-foreground 'sgml-doctype-face "MintCream")

(setq sgml-markup-faces
      '((comment . sgml-comment-face)
        (start-tag . sgml-start-tag-face)
        (end-tag . sgml-end-tag-face)
        (doctype . sgml-doctype-face)
        )
      )

; turn faces on
(setq sgml-set-face t)
;;)))


(message "htmlMode.el loaded :)")

;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
