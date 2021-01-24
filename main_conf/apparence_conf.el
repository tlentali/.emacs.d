;;; Start full screen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;;; hide the startup message
(setq inhibit-startup-message t)

;;; no line number
(global-linum-mode 0)
;;(set-face-foreground 'linum "grey")

;;; remove menu
(menu-bar-mode -1)

;;; remove tool bar
(tool-bar-mode -1)

;;; remove scroll bar
(toggle-scroll-bar -1)

;;; add yascroll (text scroll bar) instead of scroll bar
(global-yascroll-bar-mode 1)

;;; theme
(add-to-list 'custom-theme-load-path
                  "~/Dropbox/.emacs.d/theme/")
(add-to-list 'load-path "~/Dropbox/.emacs.d/theme/")
;;(use-package horizon-theme)
(load-theme 'sanityinc-tomorrow-eighties t)

;; Cursor
; Set cursor color to indian pink
(set-cursor-color "#f60386")
; cursor in bar
(setq-default cursor-type '(bar . 2))
; no blink cursor
(blink-cursor-mode 0)

;; startup screen : scratch
(setq-default inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;; distraction-free writing mode with writeroom
(use-package writeroom-mode
  :ensure t
  :bind ("C-x w" . 'writeroom-mode))

;;; font
;(custom-set-faces
;  '(default ((t (:height 100 :family "hack")))))
;(set-frame-font "source code pro-10" nil t)
(setq default-frame-alist '((font . "Source Code Pro-10")))

;;; choose mood line as modeline
(mood-line-mode)
;;; mode line cursor position
(setq line-number-mode t)
(setq column-number-mode -1)

;; remove right and left margin
;; https://emacsredux.com/blog/2015/01/18/customizing-the-fringes/
(fringe-mode '(1 . 1))
