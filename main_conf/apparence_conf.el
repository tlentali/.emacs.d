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

;;; dashboard homepage
(require 'dashboard)
;;(require 'all-the-icons) ;;; add M-x all-the-icons-install-fonts to make it works
;; Set the title
(setq dashboard-banner-logo-title "")
;; Set the banner
(setq dashboard-startup-banner 'logo)
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" which displays whatever image you would prefer
;; Content is not centered by default. To center, set
(setq dashboard-center-content 1)
;; customize which widgets are displayed
(setq show-week-agenda-p t)
(setq dashboard-items '((recents  . 8)
                        (agenda . 5)))
;; to add icons to the widget headings and their items
;;(setq dashboard-set-heading-icons t)
;;(setq dashboard-set-file-icons t)
;; show info about the packages loaded and the init time
(setq dashboard-set-init-info nil)
;;hook
(dashboard-setup-startup-hook)

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
