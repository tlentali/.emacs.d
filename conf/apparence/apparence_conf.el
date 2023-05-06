;;; apparence_conf.el --- apparence you want for your emacs
;;; Commentary:
;;; apparence --- all the apparence related config are here
;;; Code:

; add all the icon for doom modeline
(use-package all-the-icons
  :straight t)

; distraction-free writing mode with writeroom
(use-package writeroom-mode
  :straight t
  :ensure t
  :bind ("C-x w" . 'writeroom-mode))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  (doom-themes-org-config) ; Corrects (and improves) org-mode's native fontification.
)

(use-package doom-modeline
  :straight t
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-project-detection 'project)
  (setq doom-modeline-buffer-encoding nil) ; Whether display the buffer encoding.
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 1)
  (set-face-attribute 'mode-line nil :family "Source Code Pro" :height 100)
  (set-face-attribute 'mode-line-inactive nil :family "Source Code Pro" :height 100)
)

(provide 'apparence_conf)
;;; apparence_conf.el ends here
