;;;; Emacs configuration file for spell checking

;; spell checker
(require 'ispell)

;; Settings for hunspell
(defun use-hunspell()
  "Sets hunspell as spell checker."
  (setq-default ispell-program-name (executable-find "hunspell"))
  (setq ispell-program-name (executable-find "hunspell"))
  (defvar dict_de_ch "de_CH_frami")
  (defvar dict_en_GB "en_GB")
  (defvar dict_fr_FR "fr")
  (defvar dict_es_CO "es_ANY")
  (setq ispell-really-hunspell t)
  (defun woerterbuch(kuerzel)
    (setq tail (list '"-d"
                     (eval kuerzel)
                     '("-i" "utf-8")
                     '(nil utf-8)))
    (setq head (list (eval kuerzel)
                     '("[A-Za-z]" "[^A-Za-z]" "[']" t)))
    (append head tail))
  (defvar woerterbuecher
    (list (woerterbuch dict_de_ch)
          (woerterbuch dict_en_GB)
          (woerterbuch dict_fr_FR)
          (woerterbuch dict_es_CO)))
  (setq ispell-dictionary-base-alist woerterbuecher)
  (setq ispell-dictionary-alist woerterbuecher)
  (setq ispell-hunspell-dictionary-alist woerterbuecher)
  (message "hunspell will correct your terrible spelling !"))


;; Settings for aspell
(defun use-aspell()
  "Sets aspell as spell checker."
  (setq-default ispell-program-name "aspell")
  (defvar dict_de_ch "de_CH")
  (defvar dict_en_GB "en_GB")
  (defvar dict_fr_FR "fr_CH")
  (defvar dict_es_CO "es")
  (message "aspell will correct your terrible spelling !"))


;; Selecting the spell checker
(cond ((executable-find "aspell")(use-aspell))
      ((executable-find "hunspell")(use-hunspell))
      (t (message "! no spell checker found !")))



;; Common to all

;;;; short cuts
(defun rechtschreibpruefung(sprache reg-start reg-end)
  (interactive "s" "r")
  (set-default 'ispell-local-dictionary sprache)
  (setq ispell-dictionary sprache
        ispell-extra-args '() ;; TeX mode "-t"
        ispell-silently-savep t)
  (ispell-change-dictionary sprache)
  (ispell-region reg-start reg-end))

(defun rechtschreibpruefung-deutsch(reg-start reg-end)
  (interactive "r")
  (rechtschreibpruefung dict_de_ch reg-start reg-end))

(defun rechtschreibpruefung-englisch(reg-start reg-end)
  (interactive "r")
  (rechtschreibpruefung dict_en_GB reg-start reg-end))

(defun rechtschreibpruefung-francais(reg-start reg-end)
  (interactive "r")
  (rechtschreibpruefung dict_fr_FR reg-start reg-end))

(defun rechtschreibpruefung-espanol(reg-start reg-end)
  (interactive "r")
  (rechtschreibpruefung dict_es_CO reg-start reg-end))

(global-set-key [?\C-c ?\C-d] (quote rechtschreibpruefung-deutsch))
(global-set-key [?\C-c ?\C-e] (quote rechtschreibpruefung-englisch))
(global-set-key [?\C-c ?\C-f] (quote rechtschreibpruefung-francais))
(global-set-key [?\C-c ?\C-s] (quote rechtschreibpruefung-espanol))


;;; Local Variables:
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
