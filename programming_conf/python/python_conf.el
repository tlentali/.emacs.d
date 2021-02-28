(use-package elpy
  :straight t
  :ensure
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :bind
  (:map elpy-mode-map
        ("C-M-n" . elpy-nav-forward-block)
        ("C-M-p" . elpy-nav-backward-block))
  :hook ((elpy-mode . flycheck-mode)
         (elpy-mode . (lambda ()
                        (set (make-local-variable 'company-backends)
                             '((elpy-company-backend :with company-yasnippet)))))
         ;; https://stackoverflow.com/questions/45214116/how-to-disable-emacs-elpy-vertical-guide-lines-for-indentation
         (elpy-mode . (lambda () (highlight-indentation-mode -1)))
         )
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  ;; fix for MacOS, see https://github.com/jorgenschaefer/elpy/issues/1550
  (setq elpy-shell-echo-output nil)
  (setq elpy-rpc-python-command "python3")
  (setq elpy-rpc-timeout 2)
  ;; remove flycheck margin indicator (https://www.flycheck.org/en/latest/user/error-reports.html)
  (setq-default flycheck-indication-mode 'nil)
  ;; get python3 interpreter
  (setq python-shell-interpreter "/usr/bin/python3")
)

;; emacs ipython notebook
;;(require 'ein)
