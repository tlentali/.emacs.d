 (use-package elpy
  :straight t
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

(use-package blacken
  :straight t
  :delight
  :hook (python-mode . blacken-mode)
  :custom (blacken-line-length 79))

(use-package py-isort
  :straight t
  :after python
  :hook ((python-mode . pyvenv-mode)
         (before-save . py-isort-before-save)))

;; (use-package pyenv-mode
;;   :straight t
;;   :after python
;;   :hook ((python-mode . pyenv-mode)
;;          (projectile-switch-project . projectile-pyenv-mode-set))
;;   :custom (pyenv-mode-set "3.8.5")
;;   :preface
;;   (defun projectile-pyenv-mode-set ()
;;     "Set pyenv version matching project name."
;;     (let ((project (projectile-project-name)))
;;       (if (member project (pyenv-mode-versions))
;;           (pyenv-mode-set project)
;;         (pyenv-mode-unset)))))

;; (use-package pyvenv
;;   :straight t
;;   :after python
;;   :hook (python-mode . pyvenv-mode)
;;   :custom
;;   (pyvenv-default-virtual-env-name "env")
;;   (pyvenv-mode-line-indicator '(pyvenv-virtual-env-name ("[venv:"
;;                                                          pyvenv-virtual-env-name "]"))))
