;;; elpy
(elpy-enable)

;;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;; remove flycheck margin indicator (https://www.flycheck.org/en/latest/user/error-reports.html)
(setq-default flycheck-indication-mode 'nil)

;;; get python3 interpreter
;; (setq python-shell-interpreter "/usr/bin/python3")

;;; emacs ipython notebook
;;(require 'ein)

;; smartparens
(require 'smartparens-config)
;; Always start smartparens mode in python-mode.
(add-hook 'python-mode-hook #'smartparens-mode)

;; Disable vertical guide lines for indentation 
;; https://stackoverflow.com/questions/45214116/how-to-disable-emacs-elpy-vertical-guide-lines-for-indentation
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
