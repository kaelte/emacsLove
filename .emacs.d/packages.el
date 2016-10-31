;;; Package Manager

(require 'package)

(setq use-package-always-ensure t)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
;; Marmalade is not tasty anymore
;;        ("marmalade" . "https://marmalade-repo.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        )
      )

(package-initialize)

(message "(package-initialize) done ")

(when (not package-archive-contents)
   (package-refresh-contents)
   (package-install 'use-package))

(require 'use-package)

(message "packages.el loaded :)")

;;; Local Variables:
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
