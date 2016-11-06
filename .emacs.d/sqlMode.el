
(defvar psql-cmd "/opt/local/lib/postgresql96/bin/psql")
(defvar sqlplus-cmd "sqlplus")

(defun use-local-postgres()
  (set-variable 'sql-database (getenv "USER"))
  (set-variable 'sql-password "")
  (set-variable 'sql-postgres-program psql-cmd)
  (set-variable 'sql-program psql-cmd)
  (set-variable 'sql-server "localhost")
  (set-variable 'sql-user (getenv "USER"))
  (sql-highlight-postgres-keywords)
  (message (concat "Postgres on " sql-server " will be your data base !")))

(defun use-oracle()
  (set-variable 'sql-database "FPESSD50")
  (set-variable 'sql-password "incore")
  (set-variable 'sql-program sqlplus-cmd)
  (set-variable 'sql-user "incore")
  (load "~/.emacs.d/latin1.el")
  (sql-highlight-oracle-keywords)
  (message (concat "Orcale on " sql-server " will be your data base !")))

;; Selecting the SQL Programme
(cond ((executable-find psql-cmd)(use-local-postgres))
      ((executable-find sqlplus-cmd)(use-oracle))
      (t (message "! no sql-program found !")))


;;; common
(set-variable 'sql-buffer   "*SQL*")


(defun start-sql()
  (interactive)
  (let ((aktueller-buffer (current-buffer)))
    (sql-product-interactive)
    (sql-set-sqli-buffer-generally)
    (switch-to-buffer aktueller-buffer)
    (delete-other-windows)))
(define-key sql-mode-map [f12] 'start-sql)

; SQL-specific settings
(make-face 'sql-comment-face)
(set-face-foreground 'sql-comment-face "gray")
(set-face-foreground 'font-lock-comment-face "gray")
(setq sql-markup-faces '((comment . sql-comment-face)))
(setq sql-set-face t)

;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
