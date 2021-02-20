(use-package elpy
  :init
  (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  :custom
  (elpy-rpc-backend "jedi")
  :config
  (setq elpy-rpc-python-command "python3"))
