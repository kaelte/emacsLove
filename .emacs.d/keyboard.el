;;; We define a few keyboard keys

;; F4
(global-set-key [f4]    'goto-line)

;; F5
(global-set-key [f5]    'describe-char)

;; F9
(global-set-key [f9]    'set-justification-left)
(global-set-key [C-f9]  'set-justification-right)

;; F11
(global-set-key [f11]   'increase-left-margin)
(global-set-key [M-f11] 'decrease-left-margin)

;; delete
(global-set-key [delete]  (quote delete-char))


;; Weg mit dem rahmen
(defun weg-damit-und-dem-rahmen()
  "Deletes current buffer and frame"
  (interactive)
  (weg-damit)
  (delete-frame))

(defun weg-damit()
  "Deletes current buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key [?\C-q]  (quote delete-frame))
(global-set-key [?\M-q]  (quote weg-damit))
