(live-add-pack-lib "etags-select")
(live-add-pack-lib "sj-ediff")
(live-add-pack-lib "sj-misc-custom")
(live-add-pack-lib "sj-linux")
(live-add-pack-lib "grin")
(live-add-pack-lib "log4j-mode")
(live-add-pack-lib "mo-git-blame")

(require 'sj-ediff)
(require 'sj-misc-custom)
(require 'sj-linux)
(require 'grin)

(define-coding-system-alias 'UTF-8 'utf-8)
(setq-default display-buffer-reuse-frames t)
(setq line-move-visual nil)
(setq truncate-partial-width-windows t)

(require 'etags-select)

(global-set-key "\M-?" 'etags-select-find-tag)
(global-set-key "\M-." 'etags-select-find-tag-at-point)

(global-set-key (kbd "M-/") 'dabbrev-expand)

(window-number-meta-mode 0)

(defun etags-select-get-tag-files ()
  "Get tag files."
  (if etags-select-use-xemacs-etags-p
      (buffer-tag-table-list)
    (progn
      (mapcar 'tags-expand-table-name tags-table-list)
      (tags-table-check-computed-list)
      tags-table-computed-list)))

(require 'log4j-mode)
(require 'mo-git-blame)

(setenv "PYTHONUNBUFFERED" "true")

(subword-mode t)
