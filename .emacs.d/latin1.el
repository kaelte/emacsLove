;; Enable Latin-1 iso-88591
(setq default-enable-multibyte-characters nil)
(condition-case nil
    (set-language-environment "Latin-1")
  (error nil)
  )

(setq current-language-environment "Latin-1")

