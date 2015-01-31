(live-add-pack-lib "etags-select")
(live-add-pack-lib "sj-ediff")
(live-add-pack-lib "sj-misc-custom")
(live-add-pack-lib "sj-linux")
(live-add-pack-lib "sj-jabber")
(live-add-pack-lib "grin")
(live-add-pack-lib "log4j-mode")
(live-add-pack-lib "mo-git-blame")
(live-add-pack-lib "sj-spelling")
(live-add-pack-lib "graphviz-dot-mode")
(live-add-pack-lib "nix-mode")

(require 'sj-ediff)
(require 'sj-misc-custom)
(require 'sj-linux)
(require 'sj-spelling)
(require 'grin)
(require 'graphviz-dot-mode)

(require 'sj-jabber)

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

(global-subword-mode t)

(require 'nix-mode)


(defun standup-format-notes (beg end)
  "Format standup notes for slack"
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list (point-min) (point-min))))
  (let ((selection (buffer-substring-no-properties beg end)))
    (if (= (length selection) 0)
        (kill-new "")
      (kill-new
       (replace-regexp-in-string
        "^\\( *\\)- " "  \\1- "
        (replace-regexp-in-string
         "^\\*\\*\\*\\* " "* "
         (replace-regexp-in-string
          "^\\*\\*\\* \\(.*\\)$" "\n\\1:"
          (replace-regexp-in-string
           "^CLOCK.*$" ""
           (replace-regexp-in-string "^\\*+ Web Services " "" selection)))))))))
