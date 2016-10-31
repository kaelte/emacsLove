(load "~/.emacs.d/latin1.el")


(defun start-sqlplus()
  (interactive)
  (let ((aktueller-buffer (current-buffer)))
    (sql-product-interactive)
    (sql-set-sqli-buffer-generally)
    (switch-to-buffer aktueller-buffer)
    (delete-other-windows)))




(set-variable 'sql-buffer   "*SQL*")
(set-variable 'sql-database "FPESSD50")
(set-variable 'sql-program  "sqlplus")
(set-variable 'sql-user     "incore")
(set-variable 'sql-password "incore")

(sql-highlight-oracle-keywords)
;;(sql-product-interactive)
;;(sql-set-sqli-buffer-generally)


(define-key sql-mode-map [f12]    'start-sqlplus)



;;; Local Variables: 
;;; mode: emacs-lisp
;;; coding: utf-8
;;; End:
