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
(use-package dimmer
  :config
  (dimmer-mode)
)

;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map)
)

;;; neotree
;(require 'neotree)
;(global-set-key [f8] 'neotree-toggle)
;(setq neo-theme (if (display-graphic-p) 'icons 'nerd))



;; (use-package neotree
;;   :custom
;;   (neo-theme 'nerd2)
;;   :config
;;   (progn
;;     (setq neo-smart-open t)
;;     (setq neo-theme (if (display-graphic-p) 'icons 'nerd))
;;     (setq neo-window-fixed-size nil)
;;     ;; (setq-default neo-show-hidden-files nil)
;;     (global-set-key [f2] 'neotree-toggle)
;;     (global-set-key [f8] 'neotree-dir)))



;;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   3
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         t
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'right
          treemacs-read-string-input             'from-child-frame
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         25
          treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    (treemacs-resize-icons 13)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("C-x t t"   . treemacs-display-current-project-exclusively)
        ([f8]        . treemacs)
        ("C-<f8>"    . treemacs-select-window)
  )
)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t
)

(use-package treemacs-magit
  :after treemacs magit
)

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
;;(use-package swiper
;;  :ensure t
;;  :bind ("C-c s" . 'swiper))

;;; ibuffer instead of the default switch-to-buffer
(global-set-key (kbd "C-x b") 'ibuffer)

;;; move around quickly
(use-package avy
  :ensure t
  :bind
    ("M-s" . avy-goto-char)
)

;;; emacs treats camelCase strings as a single word by default, this changes said behaviour
(global-subword-mode 1)

;; dealing with pair symbol
(require 'smartparens-config)
(smartparens-global-mode t)

;;; colors parentheses and other delimiters depending on their depth
(use-package rainbow-delimiters
  :ensure t
  :init
   (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
)

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
  :bind ("C-q" . er/expand-region)
)

;;; popup-kill-ring
(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring)
)

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
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
)

;;(require 'undo-tree)
;;turn on everywhere
;;(global-undo-tree-mode 1)
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
;; show diff on the spot, without saving the file
(diff-hl-flydiff-mode 1) 

;; ctrlf
(use-package ctrlf
  :init
  (ctrlf-mode +1))

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
;;(add-hook 'after-init-hook 'global-company-mode)
; No delay in showing suggestions (https://www.monolune.com/configuring-company-mode-in-emacs/)
;;(setq company-idle-delay 0)
; Show suggestions after entering one character.
;;(setq company-minimum-prefix-length 1)
; the end of the list of suggestions does not wrap around to the top of the list again
;;(setq company-selection-wrap-around t)

(use-package company
  :diminish company-mode
  :init
  (global-company-mode)
  :config
  ;; set default `company-backends'
  (setq company-backends
        '((company-files          ; files & directory
           company-keywords       ; keywords
           company-capf)  ; completion-at-point-functions
          (company-abbrev company-dabbrev)
          ))
  (setq company-idle-delay 0) ; No delay in showing suggestions (https://www.monolune.com/configuring-company-mode-in-emacs/)
  (setq company-minimum-prefix-length 1) ; Show suggestions after entering one character.
  (setq company-selection-wrap-around t) ; the end of the list of suggestions does not wrap around to the top of the list again
)

(use-package company-statistics
    :init
    (company-statistics-mode))

(use-package company-quickhelp
    :config
    (company-quickhelp-mode))

(use-package prescient)

(use-package company-prescient
  :after company
  :config
  (company-prescient-mode))

;; truncate line, don't toggle
(set-default 'truncate-lines t)

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "bar"
	  centaur-tabs-height 25
	  centaur-tabs-set-icons t
	  centaur-tabs-set-modified-marker t
	  centaur-tabs-show-navigation-buttons t
	  centaur-tabs-set-bar 'over
      centaur-tabs-gray-out-icons 'buffer
	  x-underline-at-descent-line t)
  (centaur-tabs-headline-match)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
)
