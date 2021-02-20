(global-set-key (kbd "C-x g") 'magit-status)

(use-package magit
  :commands (magit-status magit-log)
  :init
  (global-magit-file-mode)
  :bind
  (("C-x g" . magit-status))
)
