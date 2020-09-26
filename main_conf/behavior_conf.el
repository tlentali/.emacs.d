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

;;; typing the first character in a set of 2, completes the second one after your cursor
(setq electric-pair-pairs '(
                           (?\{ . ?\})
                           (?\( . ?\))
                           (?\[ . ?\])
                           (?\" . ?\")
                           ))
(electric-pair-mode t)

;;; briefly highlighted your cursor when changing buffer 
(use-package beacon
  :ensure t
  :config
    (beacon-mode 1))

;;; colors parentheses and other delimiters depending on their depth
(use-package rainbow-delimiters
  :ensure t
  :init
   (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;;; highlights matching parens when the cursor is just behind one of them
(show-paren-mode 1)

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

;; cua mode 
(cua-mode t)
    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
    (transient-mark-mode 1) ;; No region when it is not highlighted
    (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour 
