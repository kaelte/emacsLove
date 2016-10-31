;;; Defines the layout

;; (set-keyboard-coding-system (quote utf-8))

; some colours
(set-background-color "ivory")
(set-foreground-color "black")


(set-face-attribute  'font-lock-builtin-face
                     nil
                     :foreground  "gray20"
                     :inherit 'font-lock-keyword-face )

(set-face-attribute  'font-lock-keyword-face
                     nil
                     :foreground  "black"
                     :slant 'normal
                     :weight 'semi-bold )

(set-face-attribute  'font-lock-doc-face
                     nil
                     :foreground  "SeaGreen"
                     :slant 'normal
                     :weight 'semi-bold )

(set-face-attribute  'font-lock-string-face nil
                     :foreground  "blue"
                     :slant 'italic )


; size of frame
(add-to-list 'default-frame-alist '(width  . 64))
(add-to-list 'default-frame-alist '(height . 32))
(add-to-list 'default-frame-alist '(top    .  1))
(add-to-list 'default-frame-alist '(left   .  1))



(set-variable 'indent-tabs-mode 'nil)


; some modes
(column-number-mode 42)
(show-paren-mode 42)
(transient-mark-mode 42)

;; MAUSRAEDCHEN AN
(mouse-wheel-mode 1)


(condition-case nil
    (kill-buffer "*Quail Completions*")
  (error nil))


(set-default-font "-outline-Courier New-normal-normal-normal-mono-*-*-*-*-c-*-iso8859-1")

;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
