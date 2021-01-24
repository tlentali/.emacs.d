;;; typed text replaces the selection if the selection is active
(delete-selection-mode 1) 

;;; always replace tabs with spaces
(setq-default indent-tabs-mode nil)

;;; set tab width to 4 spaces for all buffers
(setq-default tab-width 4)

;;; cursor scroll smoothly 
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;;; mousewheel scroll one line at a time (less "jumpy" than defaults) (add M-x pixel-scroll-mode)
(when (display-graphic-p)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
        mouse-wheel-progressive-speed nil))
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 100000)

;;; Past without indentation mess
(electric-indent-mode 0)

;;; window-numbering
(require 'window-numbering)
(window-numbering-mode 1)

;;; zoom current window size
(custom-set-variables '(zoom-mode t))
;; (defun size-callback ()
;;   (cond ((> (frame-pixel-width) 1280) '(0.90 . 0.75))
;;         (t                            '(0.618 . 0.618))))
;; (custom-set-variables
;;  '(zoom-size 'size-callback))
(custom-set-variables '(zoom-size '(0.618 . 0.618)))

;;; dimmer visually highlight the selected buffer
(require 'dimmer)
(dimmer-mode t)

;;; neotree
;;(require 'neotree)
;;(global-set-key [f8] 'neotree-toggle)

;;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("C-x t t"   . treemacs)))

;;; disable backups auto-saves
(setq make-backup-files nil)
(setq auto-save-default nil)

;;; change yes-or-no questions into y-or-n questions
(defalias 'yes-or-no-p 'y-or-n-p)

;;; After you split a window, your cursor goes on the new one
(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;;; swiper instead of the default search
(use-package swiper
  :ensure t
  :bind ("C-c s" . 'swiper))

;;; ibuffer instead of the default switch-to-buffer
(global-set-key (kbd "C-x b") 'ibuffer)

;;; move around quickly
(use-package avy
  :ensure t
  :bind
    ("M-s" . avy-goto-char))

;;; emacs treats camelCase strings as a single word by default, this changes said behaviour
(global-subword-mode 1)

;; dealing with pair symbol
(require 'smartparens-config)
(smartparens-global-mode t)

;;; colors parentheses and other delimiters depending on their depth
(use-package rainbow-delimiters
  :ensure t
  :init
   (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;;; highlights matching parens when the cursor is just behind one of them
(show-paren-mode 1)
(setq show-paren-delay 0)
; change the color/face
;; https://emacs.stackexchange.com/questions/47795/spacemacs-how-can-i-customize-the-highlight-style-of-a-matching-parenthesis
(require 'paren)
(custom-set-faces
 '(show-paren-match ((t (:foreground "#f60386" :background "#2d2d2d")))))
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

;;; briefly highlighted your cursor when changing buffer 
(use-package beacon
  :ensure t
  :config
    (beacon-mode 1)
    ;; only flash on window/buffer changes...
    (setq beacon-blink-when-window-changes t)
    ;; ... don't be excessive:
    (setq beacon-blink-when-window-scrolls nil)
    (setq beacon-blink-duration .2)       ; default .3
    (setq beacon-blink-delay .2)          ; default .3
    (setq beacon-size 8)
)

;;; Expand region selection
(use-package expand-region
  :ensure t
  :bind ("C-q" . er/expand-region))

;;; popup-kill-ring
(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

;;; use ido to find file and switch buffer
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

;;; ido vertical
(use-package ido-vertical-mode
  :ensure t
  :init 
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

;;; undo tree
(require 'undo-tree)
;;turn on everywhere
(global-undo-tree-mode 1)
;; make ctrl-z undo
;;(global-set-key (kbd "C-z") 'undo)
;; make ctrl-Z redo
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-S-z") 'redo)  

;;; key binding helper smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; show git diff in file
(global-diff-hl-mode)
(diff-hl-margin-mode 1)
(diff-hl-flydiff-mode 1)

;; projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

;; ctrlf
(ctrlf-mode +1)

;; cua mode (copy/paste normal mode) 
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy nil) 

;; yasnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "~/Dropbox/.emacs.d/snippets")))

;; company (text completion framework)
(add-hook 'after-init-hook 'global-company-mode)
; No delay in showing suggestions (https://www.monolune.com/configuring-company-mode-in-emacs/)
(setq company-idle-delay 0)
; Show suggestions after entering one character.
(setq company-minimum-prefix-length 1)
; the end of the list of suggestions does not wrap around to the top of the list again
(setq company-selection-wrap-around t)

;; truncate line, don't toggle
(set-default 'truncate-lines t)
