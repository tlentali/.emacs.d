;;; spelling_conf.el --- spelling you want for your emacs
;;; Commentary:
;;; spelling --- all the spelling related config are here
;;; Code:

(use-package ispell
  :straight t
  :bind
  (("C-. d b" . ispell-buffer)
   ("C-. d f" . ispell-change-dictionary-to-french)
   ("C-. d e" . ispell-change-dictionary-to-english))
  :init
  (progn
    (setq ispell-dictionary "english")

    (defun ispell-set-dictionary (dict)
      (save-excursion
        (add-file-local-variable 'ispell-local-dictionary dict)))

    (defun ispell-change-dictionary-to-french (arg)
      (interactive "P")
      (ispell-change-dictionary "francais")
      (when arg
        (ispell-set-dictionary "francais"))
      (flyspell-buffer))

    (defun ispell-change-dictionary-to-english (arg)
      (interactive "P")
      (ispell-change-dictionary "english")
      (when arg
        (ispell-set-dictionary "english"))
      (flyspell-buffer))))

(use-package flyspell
  :straight t
  :defer 1
  :hook ((markdown-mode org-mode text-mode) . flyspell-mode)
  :custom
  (flyspell-issue-message-flag nil)
  (flyspell-issue-welcome-flag nil)
  (flyspell-mode 1))

(use-package flyspell-popup
  :straight t
  :ensure t
  :after flyspell
  :bind (:map flyspell-mode-map
              ("C-;" . #'flyspell-popup-correct)))

(use-package flycheck
  :straight t
  :defer 2
  :hook ((markdown-mode org-mode text-mode) . flycheck-mode)
  :diminish
  ;; :init (global-flycheck-mode)
  :custom
  (flycheck-display-errors-delay .3)
  (flycheck-stylelintrc "~/.stylelintrc.json"))

(provide 'spelling_conf)
;;; spelling_conf.el ends here
