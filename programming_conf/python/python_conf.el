(use-package elpy
    :ensure t
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
           (elpy-mode . (lambda () (highlight-indentation-mode -1)))
           )
    :config
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    ; fix for MacOS, see https://github.com/jorgenschaefer/elpy/issues/1550
    (setq elpy-shell-echo-output nil)
    (setq elpy-rpc-python-command "python3")
    (setq elpy-rpc-timeout 2))

;;; remove flycheck margin indicator (https://www.flycheck.org/en/latest/user/error-reports.html)
(setq-default flycheck-indication-mode 'nil)

;;; get python3 interpreter
;; (setq python-shell-interpreter "/usr/bin/python3")

;;; emacs ipython notebook
;;(require 'ein)

;; smartparens
;(require 'smartparens-config)
;; Always start smartparens mode in python-mode.
;(add-hook 'python-mode-hook #'smartparens-mode)

;; Disable vertical guide lines for indentation 
;; https://stackoverflow.com/questions/45214116/how-to-disable-emacs-elpy-vertical-guide-lines-for-indentation
;;(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(use-package py-isort
    ;;:straight (:host github :repo "humitos/py-cmd-buffer.el")
    :hook (python-mode . py-isort-enable-on-save)
    :config
    (setq py-isort-options '("--lines=88" "-m=3" "-tc" "-fgw=0" "-ca")))

(use-package py-autoflake
    ;;:straight (:host github :repo "humitos/py-cmd-buffer.el")
    :hook (python-mode . py-autoflake-enable-on-save)
    :config
    (setq py-autoflake-options '("--expand-star-imports")))

(use-package py-docformatter
    ;;:straight (:host github :repo "humitos/py-cmd-buffer.el")
    :hook (python-mode . py-docformatter-enable-on-save)
    :config
    (setq py-docformatter-options '("--wrap-summaries=88" "--pre-summary-newline")))

(use-package blacken
    ;;:straight t
    :hook (python-mode . blacken-mode)
    :config
    (setq blacken-line-length '88))

(use-package python-docstring
    ;;:straight t
    :hook (python-mode . python-docstring-mode))

;; https://medium.com/analytics-vidhya/managing-a-python-development-environment-in-emacs-43897fd48c6a
;; (use-package pyenv
;;     ;;:straight (:host github :repo "aiguofer/pyenv.el")
;;     :config
;;     (setq pyenv-use-alias 't)
;;     (setq pyenv-modestring-prefix " ")
;;     (setq pyenv-modestring-postfix nil)
;;     (setq pyenv-set-path nil)(global-pyenv-mode)
;;     (defun pyenv-update-on-buffer-switch (prev curr)
;;       (if (string-equal "Python" (format-mode-line mode-name nil nil curr))
;;           (pyenv-use-corresponding)))
;;     (add-hook 'switch-buffer-functions 'pyenv-update-on-buffer-switch))


(use-package python
  :mode ("\\.py" . python-mode)
  :ensure t)

(use-package pyvenv)

(use-package python-black
  :demand t
  :after python
  :config
  (python-black-on-save-mode))
