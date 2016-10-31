;; Emacs configuration file for spell checking

(set-variable 'ispell-program-name "C:/App/Aspell/bin/aspell")

(defun rechtschreibpruefung(sprache reg-start reg-end)
  (interactive "s" "r")
  (ispell-change-dictionary sprache)
  (ispell-region reg-start reg-end))

(defun rechtschreibpruefung-deutsch(reg-start reg-end)
  (interactive "r")
  (rechtschreibpruefung "german8" reg-start reg-end))

(defun rechtschreibpruefung-englisch(reg-start reg-end)
  (interactive "r")
  (rechtschreibpruefung "british" reg-start reg-end))

(defun rechtschreibpruefung-franz(reg-start reg-end)
  (interactive "r")
  (rechtschreibpruefung "french" reg-start reg-end))

(global-set-key [?\C-d]  (quote rechtschreibpruefung-deutsch))
(global-set-key [?\C-e]  (quote rechtschreibpruefung-englisch))
(global-set-key [?\C-f]  (quote rechtschreibpruefung-franz))


;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
