;; ============================= Spelling ==============================
;; =====================================================================
;; Set default spell checker to aspell
(setq ispell-program-name "aspell")
(setq ispell-dictionary "british")
(add-to-list 'exec-path "C:/cygwin/aspell")
;; Flyspell for LaTeX documents
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; Flyspell for text documents
(add-hook 'text-mode-hook 'flyspell-mode)
;; Flyspell for twiki
(add-hook 'erin-mode-hook 'flyspell-mode)

(provide 'sj-spelling)
