(use-package "startup"
  :config
  ;; Start full screen
  (custom-set-variables
   '(initial-frame-alist (quote ((fullscreen . maximized)))))
  ;; no line number
  (global-linum-mode 0)
  ;; remove menu
  (menu-bar-mode -1)
  ;; remove tool bar
  (tool-bar-mode -1)
  ;; remove scroll bar
  (toggle-scroll-bar -1)
  ;; add yascroll (text scroll bar) instead of scroll bar
  (global-yascroll-bar-mode 1)
  ;; theme
  ;;(add-to-list 'custom-theme-load-path
  ;;                  "~/Dropbox/.emacs.d/theme/")
  ;; (add-to-list 'load-path "~/Dropbox/.emacs.d/theme/")
  ;; (use-package horizon-theme)
  ;; (load-theme 'sanityinc-tomorrow-eighties t)
  ;; (load-theme 'zerodark t)
  ;; (zerodark-setup-modeline-format)
  ;; Cursor
  ;; Set cursor color to indian pink
  (set-cursor-color "#f60386")
  ;; cursor in bar
  (setq-default cursor-type '(bar . 2))
  ;; no blink cursor
  (blink-cursor-mode 0)
  ;; startup screen : scratch
  (setq-default inhibit-startup-screen t)
  (setq inhibit-splash-screen t)
  (setq inhibit-startup-message t)
  (setq initial-scratch-message "")
  ;; font
  ;; (custom-set-faces
  ;;  '(default ((t (:height 100 :family "hack")))))
  ;;(set-frame-font "source code pro-10" nil t)
  (setq default-frame-alist '((font . "Source Code Pro-10")))
  ;; remove right and left margin
  ;; https://emacsredux.com/blog/2015/01/18/customizing-the-fringes/
  (fringe-mode '(1 . 1)))

(use-package zerodark-theme
:ensure t
:init
  (load-theme 'zerodark t)
  (zerodark-setup-modeline-format))

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
