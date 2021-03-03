(use-package magit
  :straight t
  :commands (magit-status magit-log)
  :bind
  (("C-x g" . magit-status))
)
