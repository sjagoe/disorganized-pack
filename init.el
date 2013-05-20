(live-add-pack-lib "etags-select")
(live-add-pack-lib "sj-ediff")
(live-add-pack-lib "sj-misc-custom")
(live-add-pack-lib "sj-linux")
(live-add-pack-lib "grin")

(require 'sj-ediff)
(require 'sj-misc-custom)
(require 'sj-linux)
(require 'grin)

(define-coding-system-alias 'UTF-8 'utf-8)
(setq-default display-buffer-reuse-frames t)
(setq line-move-visual nil)
(setq truncate-partial-width-windows t)

(global-set-key "\M-?" 'etags-select-find-tag)
(global-set-key "\M-." 'etags-select-find-tag-at-point)

(global-set-key (kbd "M-/") 'dabbrev-expand)
