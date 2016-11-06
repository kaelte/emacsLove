;; Enable utf-8
(setq default-enable-multibyte-characters t)
(condition-case nil
    (set-language-environment "utf-8")
  (error nil)
  )

(set-input-method "TeX")
(setq current-language-environment "utf-8")
(setq default-input-method "TeX")
(set-keyboard-coding-system (quote utf-8))

;; Unicode Zeichen für Tastatur
(global-set-key [?\M-o]  (quote "Ω"))
(global-set-key [?\M-R]  (quote "ℝ"))
(global-set-key [?\M-\214]  (quote "∀"))
(global-set-key [?\M-\332]  (quote "∈"))
(global-set-key [?\M-\333]  (quote "∃"))
(global-set-key [?\M-\322]  (quote "²"))
(global-set-key [?\M-g ?\M-d]  (quote "⇔"))
(global-set-key [?\C-=]    (quote "≈"))
(global-set-key [?\C-\"]    (quote "„"))
(global-set-key [?\M-\"]    (quote "‟"))
(global-set-key [\kp-multiply] (quote "∙"))
(global-set-key [?\C-.]    (quote "∙"))
(global-set-key [\C-\kp-multiply] (quote "∙"))
(global-set-key [\kp-divide] (quote ":"))

;;; Local Variables:
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
