;;; elpy
(elpy-enable)
;;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
;;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;;; get python3 interpreter
;;; (setq python-shell-interpreter "/usr/bin/python3")
;;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
))
;;; emacs ipython notebook
;;(require 'ein)
;;; yasnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "~/.emacs.d/snippets")))
