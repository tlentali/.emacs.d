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
