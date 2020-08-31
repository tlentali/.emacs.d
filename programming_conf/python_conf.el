;;; elpy
(elpy-enable)

;;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;; get python3 interpreter
;; (setq python-shell-interpreter "/usr/bin/python3")

;;; emacs ipython notebook
;;(require 'ein)

;;; yasnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "~/Dropbox/.emacs.d/snippets")))
