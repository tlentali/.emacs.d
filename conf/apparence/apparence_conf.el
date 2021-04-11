;; theme
;;(add-to-list 'custom-theme-load-path
;;                  "~/Dropbox/.emacs.d/theme/")
;; (add-to-list 'load-path "~/Dropbox/.emacs.d/theme/")
;; (use-package horizon-theme)
;; (load-theme 'sanityinc-tomorrow-eighties t)
;; (load-theme 'zerodark t)
;; (zerodark-setup-modeline-format)

;; (use-package atom-one-dark-theme
;; :ensure t
;; :init
;;   (load-theme 'atom-one-dark t))

;; (use-package zerodark-theme
;; :ensure t
;; :init
;;   (load-theme 'zerodark t)
;;   (zerodark-setup-modeline-format))

;; (use-package monokai-pro-theme
;;   :ensure t
;;   :config
;;   (load-theme 'monokai-pro-ristretto t))

;; distraction-free writing mode with writeroom
(use-package writeroom-mode
  :straight t
  :ensure t
  :bind ("C-x w" . 'writeroom-mode))

;; modeline
;; choose mood line as modeline
;; (mood-line-mode)
;; mode line cursor position
;; (setq line-number-mode t)
;; (setq column-number-mode -1)
(use-package doom-modeline
  :straight t
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-project-detection 'project)
  ;; Whether display the buffer encoding.
  (setq doom-modeline-buffer-encoding nil)
  ;; Specify font family in modeline
  ;; If the actual char height is larger, it respects the actual height.
  (setq doom-modeline-height 25)
  ;; How wide the mode-line bar should be. It's only respected in GUI.
  (setq doom-modeline-bar-width 1)
  (set-face-attribute 'mode-line nil :family "Source Code Pro" :height 100)
  (set-face-attribute 'mode-line-inactive nil :family "Source Code Pro" :height 100)
)

;; add all the icon for doom modeline
(use-package all-the-icons
  :straight t)

;; helps visually distinguish file-visiting windows from other windows
(use-package solaire-mode
  :straight t
  :custom (solaire-mode-remap-fringe t)
  :config
  (solaire-mode-swap-bg)
  (solaire-global-mode +1))

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
