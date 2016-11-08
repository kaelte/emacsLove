;;; Defines the layout

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

(cond ((x-list-fonts "-*-Courier-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")
       (defvar my-font "-*-Courier-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1"))
      ((x-list-fonts "-outline-Consolas-normal-normal-normal-mono-13-*-*-*-c-*-iso10646-1")
       (defvar my-font "-outline-Consolas-normal-normal-normal-mono-13-*-*-*-c-*-iso10646-1")))


(set-default-font my-font)
(set-frame-font my-font)


;;; a pretty print
(cond ((executable-find "gs") (setq ps-lpr-command "gs"))
      ((or (equal system-type 'ms-dos)
           (equal system-type 'windows-nt))
       (setenv "GS_LIB" "c:/App/gs/gs9.16/lib;c:/App/gs/gs9.16/fonts"))
       (setq ps-lpr-command "c:/App/gs/gs9.16/bin/gswin64c.exe"))
(concat "-sOutputFile=" (getenv "HOME") "/Desktop/emacs_druck.pdf")
(setq ps-lpr-switches
      (list(concat "-sOutputFile=" (getenv "HOME") "/Desktop/emacs_druck.pdf")
           "-dNOPAUSE" "-dBATCH" "-r288" "-g2380x3368" "-sDEVICE=pdfwrite"
           "-" ;; stdin needed for Mac OS X. For windows native too ?
           ))

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

;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
