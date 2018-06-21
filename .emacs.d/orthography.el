;;; Emacs configuration file for spell checking

;;spell checker
(require 'ispell)


;; Settings for hunspell
(defun use-hunspell()
  "Sets hunspell as spell checker."
  (setq-default ispell-program-name (executable-find "hunspell"))
  (setq ispell-program-name (executable-find "hunspell"))
  (defvar dict_de_ch "de_CH")
  (defvar dict_en_GB "en_GB")
  (defvar dict_fr_FR "fr_CH")
  (defvar dict_es_CO "es_CO")
  (message "hunspell will correct your spelling !"))


;; Settings for aspell
(defun use-aspell()
  "Sets aspell as spell checker."
  (setq-default ispell-program-name "aspell")
  (cond ((or (equal system-type 'ms-dos)
             (equal system-type 'windows-nt))
         (setq dict_de_ch "deutsch")
         (setq dict_en_GB "english")
         (setq dict_fr_FR "francais")
         (setq dict_es_CO "castellano"))
        (t
         (defvar dict_de_ch "de_CH")
         (defvar dict_en_GB "en_GB")
         (defvar dict_fr_FR "fr_CH")
         (defvar dict_es_CO "es")))
  (message "aspell will correct your spelling !"))


;;;Selecting the spell checker
(cond ((executable-find "aspell")(use-aspell))
      ((executable-find "hunspell")(use-hunspell))
      (t (message "! no spell checker found !")))



;; Common to all

;; (ispell-set-spellchecker-params)

;;;; short cuts
(defun rechtschreibpruefung(sprache reg-start reg-end)
  (interactive "r" "s")
  (message sprache)
  (set-default 'ispell-local-dictionary sprache)
  (setq ispell-dictionary sprache
        ispell-extra-args '() ;; TeX mode "-t"
        ispell-silently-savep t)
  (ispell-change-dictionary sprache)
  (ispell-region reg-start reg-end)
  )

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

;; Does not work on Mac OS X 10.12 with Emacs 25 (global-set-key [?\C-c ?\C-d] (quote rechtschreibpruefung-deutsch)) (global-set-key [?\C-c ?\C-e] (quote rechtschreibpruefung-englisch)) (global-set-key [?\C-c ?\C-f] (quote rechtschreibpruefung-francais)) (global-set-key [?\C-c ?\C-s] (quote rechtschreibpruefung-espanol))

;; This works
(global-set-key [f7] (quote rechtschreibpruefung-deutsch))
(global-set-key [M-f7] (quote rechtschreibpruefung-englisch))
(global-set-key [C-f7] (quote rechtschreibpruefung-francais))
(global-set-key [S-f7] (quote rechtschreibpruefung-espanol))


;;; Local Variables:
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
