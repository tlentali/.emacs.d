(use-package beancount
  :straight (beancount
             :type git
             :host github
             :repo "cnsunyour/beancount.el")
  :defer t
  :bind
  ("C-M-b" . (lambda ()
               (interactive)
               (find-file "~/source/flouze/flouze.beancount")))
  :mode
  ("\\.bean\\(?:count\\)?\\'" . beancount-mode)
)
