(cond ((or (equal system-type 'ms-dos)
           (equal system-type 'windows-nt))
       (add-to-list 'exec-path "c:/App/sbt/bin/")))
(use-package ensime
             :ensure t
             :pin melpa-stable)

(setq ensime-mode-key-prefix [?\C-c ?e])

(message "scalaMode.el loaded :)")


;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:

