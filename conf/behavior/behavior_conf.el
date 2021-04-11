;;; behavior_conf.el --- behavior you want for your emacs
;;; Commentary:
;;; behavior --- all the behavior related config are here
;;; Code:

(use-package emacs
  :config
  (setq-default
   delete-selection-mode 1          ; typed text replaces the selection if the selection is active
   indent-tabs-mode nil             ; always replace tabs with spaces
   tab-width 4                      ; set tab width to 4 spaces for all buffers
   global-subword-mode 1            ; emacs treats camelCasestrings as a single word by default, this changes said behaviour
   electric-indent-mode 0           ; Past without indentation mess
   truncate-lines t                 ; truncate line, don't toggle
   cursor-in-non-selected-windows t ; Let the cursor in inactive windows
   kill-ring-max 128                ; Maximum length of kill ring
   mark-ring-max 128                ; Maximum length of mark ring
   inhibit-startup-screen t         ; startup screen : scratch
   inhibit-splash-screen t          ; Disable start-up screen
   inhibit-startup-message t        ; No startup message
   initial-scratch-message ""       ; Empty the initial *scratch* buffer
   select-enable-clipboard t        ; Merge system's and Emacs' clipboard
   use-package-always-ensure t      ; Avoid the :ensure keyword for each package
   make-backup-files nil            ; No backup file
   auto-save-default nil            ; Disable backups auto-saves
   )
  (global-linum-mode 0)        ; no line number
  (menu-bar-mode -1)           ; remove menu
  (tool-bar-mode -1)           ; remove tool bar
  (toggle-scroll-bar -1)       ; remove scroll bar
  (global-yascroll-bar-mode 1) ; add yascroll (text scroll bar) instead of scroll bar
  ;; cursor
  (set-cursor-color "#f60386")          ; Set cursor color to indian pink
  (setq-default cursor-type '(bar . 2)) ; cursor in bar
  (blink-cursor-mode 0)                 ; no blink cursor
   ;; Start full screen
  (custom-set-variables
   '(initial-frame-alist (quote ((fullscreen . maximized)))))
  ;; font
  ;; (custom-set-faces
  ;;  '(default ((t (:height 100 :family "hack")))))
  ;; (set-frame-font "source code pro-10" nil t)
  (setq default-frame-alist '((font . "Source Code Pro-10")))
  ;; remove right and left margin
  ;; https://emacsredux.com/blog/2015/01/18/customizing-the-fringes/
  (fringe-mode '(1 . 1))
  (defalias 'yes-or-no-p 'y-or-n-p) ; change yes-or-no questions into y-or-n questions
  ; Shortcut to project.org file
  (global-set-key (kbd "<f6>") (lambda() (interactive)(find-file "~/Dropbox/alfred/org/projects.org")))
  ; After you split a window, your cursor goes on the new one
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
  ; highlights matching parens when the cursor is just behind one of them
  (show-paren-mode 1)
  (defvar show-paren-delay 0)
  ; change the color/face
  ; https://emacs.stackexchange.com/questions/47795/spacemacs-how-can-i-customize-the-highlight-style-of-a-matching-parenthesis
  ;(require 'paren)
  (custom-set-faces
   '(show-paren-match ((t (:foreground "#f60386" :background nil :underline t)))))
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold))

; cursor scroll smoothly
(use-package smooth-scrolling
  :straight t
  :config
  (smooth-scrolling-mode 1)
  ; mousewheel scroll one line at a time (less "jumpy" than defaults) (add M-x pixel-scroll-mode)
  (when (display-graphic-p)
    (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
          mouse-wheel-progressive-speed nil))
  (setq scroll-step 1
        scroll-margin 0
        scroll-conservatively 100000))

; window-numbering
(use-package window-numbering
  :straight t
  :config
  (window-numbering-mode 1))

(use-package zoom
  :straight t
  :config
  (zoom-mode t)
  (setq zoom-size '(0.618 . 0.618)))

; dimmer visually highlight the selected buffer
(use-package dimmer
  :straight t
  :config
  (dimmer-mode))

; projectile
(use-package projectile
  :straight t
  :config
  (projectile-mode +1)
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map))

; treemacs
(use-package treemacs
  :straight t
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

    ; The default width and height of the icons is 22 pixels. If you are
    ; using a Hi-DPI display, uncomment this to double the icon size.
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
        ("C-<f8>"    . treemacs-select-window)))

(use-package treemacs-projectile
  :straight t
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :straight t
  :after treemacs magit)

; move around quickly
(use-package avy
  :straight t
  :ensure t
  :bind
  ("C-c SPC" . avy-goto-char))

(use-package smartparens
  :straight t
  :ensure t
  :config
  (setq sp-show-pair-from-inside nil)
  (require 'smartparens-config)
  (smartparens-global-mode t)
  :diminish smartparens-mode)

; colors parentheses and other delimiters depending on their depth
(use-package rainbow-delimiters
  :straight t
  :config
  (progn
    (defun @-enable-rainbow-delimiters ()
      (rainbow-delimiters-mode t))
    (add-hook 'prog-mode-hook '@-enable-rainbow-delimiters)))

; briefly highlighted your cursor when changing buffer
(use-package beacon
  :straight t
  :ensure t
  :config
    (beacon-mode 1)
    ; only flash on window/buffer changes...
    (setq beacon-blink-when-window-changes t)
    ; ... don't be excessive:
    (setq beacon-blink-when-window-scrolls nil)
    (setq beacon-blink-duration .2)       ; default .3
    (setq beacon-blink-delay .2)          ; default .3
    (setq beacon-size 8))

; Expand region selection
(use-package expand-region
  :straight t
  :ensure t
  :bind (("C-+" . er/expand-region)
         ("C-=" . er/contract-region)))

; popup-kill-ring
(use-package popup-kill-ring
  :straight t
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(use-package ido
  :straight t
  :ensure t
  :config
  (setq ido-enable-flex-matching nil
    ido-create-new-buffer 'always
    ido-everywhere t)
  (ido-mode t))

; ido vertical
(use-package ido-vertical-mode
  :straight t
  :ensure t
  :init
  (ido-vertical-mode 1)
  :config
  (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))

(use-package undo-tree
  :straight t
  :ensure t
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t))
  ; Redo
  (defalias 'redo 'undo-tree-redo)
  (global-set-key (kbd "C-S-z") 'redo))

(use-package smex
  :straight t
  :ensure t
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command))

(use-package diff-hl
  :straight t
  :config
  (global-diff-hl-mode)
  (diff-hl-margin-mode 1)
  ; show diff on the spot, without saving the file
  (diff-hl-flydiff-mode 1))

; ctrlf
;; (use-package ctrlf
;;   :straight t
;;   :init
;;   (ctrlf-mode +1))

; cua mode (copy/paste normal mode)
(use-package cua-base
  :straight t
  :config (cua-mode)
  (setq cua-auto-tabify-rectangles nil) ; Don't tabify after rectangle commands
  (transient-mark-mode 1) ; No region when it is not highlighted
  (setq cua-keep-region-after-copy nil))

(use-package yasnippet
  :straight t
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "~/Dropbox/.emacs.d/snippets")))

; (use-package centaur-tabs
;   :demand
;   :config
;   (centaur-tabs-mode t)
;   (setq centaur-tabs-style "bar"
;     centaur-tabs-height 25
;     centaur-tabs-set-icons t
;     centaur-tabs-set-modified-marker t
;     centaur-tabs-show-navigation-buttons t
;     centaur-tabs-set-bar 'over
;       centaur-tabs-gray-out-icons 'buffer
;     x-underline-at-descent-line t)
;   (centaur-tabs-headline-match)
;   :bind
;   ("C-<prior>" . centaur-tabs-backward)
;   ("C-<next>" . centaur-tabs-forward)
; )

(use-package ibuffer
  :straight t
  :bind
  ("C-x b" . ibuffer))

(use-package ibuffer-vc
  :straight t
  :ensure t
  :defer 5
  :init
  ; Include version control status info in the ibuffer list.
  (setq ibuffer-formats
        '((mark modified read-only vc-status-mini " | "
                (name 30 30 :left :elide)
                " | "
                (size 9 -1 :right)
                " | "
                (mode 16 16 :left :elide)
                " | "
                (vc-status 16 16 :left)
                " | "
                filename-and-process)))
  :config (add-hook 'ibuffer-hook (lambda()
                                    (ibuffer-vc-set-filter-groups-by-vc-root)
                                    (unless (eq ibuffer-sorting-mode 'alphabetic)
                                      (ibuffer-do-sort-by-alphabetic)))))

; Smart Move, move to the beginning/end of line, code or comment
(use-package mwim
  :straight t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

; Display Keybind
(use-package which-key
  :straight t
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-right)))

(use-package company
  :straight t
  :init
  (global-company-mode)
  :config
  ; set default `company-backends'
  (setq company-backends
        '((company-files    ; files & directory
           company-keywords ; keywords
           company-jedi     ; python
           company-capf)    ; completion-at-point-functions
          (company-abbrev company-dabbrev)
          ))
  (setq company-idle-delay 0) ; No delay in showing suggestions (https://www.monolune.com/configuring-company-mode-in-emacs/)
  (setq company-minimum-prefix-length 1) ; Show suggestions after entering one character.
  (setq company-selection-wrap-around t) ; the end of the list of suggestions does not wrap around to the top of the list again
  (setq company-tooltip-align-annotations t
          ; Easy navigation to candidates with M-<n>
          company-show-numbers t)
  ;; :bind (:map company-active-map ("<tab>" . company-complete-selection))
  ; Use tab to navigate in company mode
  (eval-after-load 'company
    '(progn
       (define-key company-active-map (kbd "TAB") 'company-select-next)
       (define-key company-active-map [tab] 'company-select-next)))
  )

(use-package company-quickhelp          ; Documentation popups for Company
  :straight t
  :defer t
  :config
  (company-quickhelp-mode))

(use-package prescient
  :straight t
  :config
  (setq prescient-save-file (concat user-emacs-directory "prescient_cache"))
    (prescient-persist-mode))

; alternative to highlight-symbol : https://github.com/wolray/symbol-overlay/
(use-package highlight-symbol
  :straight t
  :init
  (global-set-key [(control f3)] 'highlight-symbol)
  (global-set-key [f3] 'highlight-symbol-next)
  (global-set-key [(shift f3)] 'highlight-symbol-prev)
  (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
)

(use-package counsel
  :straight t
  :after ivy
  :delight
  :bind (("C-x C-d" . counsel-dired-jump)
         ("C-x C-h" . counsel-minibuffer-history)
         ("C-x C-l" . counsel-find-library)
         ("C-x C-r" . counsel-recentf)
         ("C-x C-u" . counsel-unicode-char)
         ("C-x C-v" . counsel-set-variable)
         ("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config (counsel-mode)
  (setq ivy-extra-directories nil)
  :custom (counsel-rg-base-command "rg -S -M 150 --no-heading --line-number --color never %s")
  (add-to-list 'ivy-sort-functions-alist
             '(counsel-recentf . file-newer-than-file-p)))

(use-package ivy
  :straight t
  :delight
  :after ivy-rich
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("M-H"   . ivy-resume)
         :map ivy-minibuffer-map
         ;("<tab>" . ivy-alt-done)
         ("<return>" . ivy-alt-done)
         ("C-i"   . ivy-partial-or-done)
         ("S-SPC" . nil)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-switch-buffer-kill))
  :custom
  (ivy-case-fold-search-default t)
  (ivy-count-format "(%d/%d) ")
  (ivy-re-builders-alist '((t . ivy--regex-plus)))
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package ivy-rich
  :straight t
  :defer 0.1
  :preface
  (defun ivy-rich-branch-candidate (candidate)
    "Displays the branch candidate of the candidate for ivy-rich."
    (let ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate))
          ""
        (format "%s%s"
                (propertize
                 (replace-regexp-in-string abbreviated-home-dir "~/"
                                           (file-name-directory
                                            (directory-file-name candidate)))
                 'face 'font-lock-doc-face)
                (propertize
                 (file-name-nondirectory
                  (directory-file-name candidate))
                 'face 'success)))))

  (defun ivy-rich-compiling (candidate)
    "Displays compiling buffers of the candidate for ivy-rich."
    (let* ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate)
              (not (magit-git-repo-p candidate)))
          ""
        (if (my/projectile-compilation-buffers candidate)
            "compiling"
          ""))))

  (defun ivy-rich-file-group (candidate)
    "Displays the file group of the candidate for ivy-rich"
    (let ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate))
          ""
        (let* ((group-id (file-attribute-group-id (file-attributes candidate)))
               (group-function (if (fboundp #'group-name) #'group-name #'identity))
               (group-name (funcall group-function group-id)))
          (format "%s" group-name)))))

  (defun ivy-rich-file-modes (candidate)
    "Displays the file mode of the candidate for ivy-rich."
    (let ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate))
          ""
        (format "%s" (file-attribute-modes (file-attributes candidate))))))

  (defun ivy-rich-file-size (candidate)
    "Displays the file size of the candidate for ivy-rich."
    (let ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate))
          ""
        (let ((size (file-attribute-size (file-attributes candidate))))
          (cond
           ((> size 1000000) (format "%.1fM " (/ size 1000000.0)))
           ((> size 1000) (format "%.1fk " (/ size 1000.0)))
           (t (format "%d " size)))))))

  (defun ivy-rich-file-user (candidate)
    "Displays the file user of the candidate for ivy-rich."
    (let ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate))
          ""
        (let* ((user-id (file-attribute-user-id (file-attributes candidate)))
               (user-name (user-login-name user-id)))
          (format "%s" user-name)))))

  (defun ivy-rich-switch-buffer-icon (candidate)
    "Returns an icon for the candidate out of `all-the-icons'."
    (with-current-buffer
        (get-buffer candidate)
      (let ((icon (all-the-icons-icon-for-mode major-mode :height 0.9)))
        (if (symbolp icon)
            (all-the-icons-icon-for-mode 'fundamental-mode :height 0.9)
          icon))))
  :config
  (plist-put ivy-rich-display-transformers-list
             'counsel-find-file
             '(:columns
               ((ivy-rich-candidate               (:width 73))
                (ivy-rich-file-user               (:width 8 :face font-lock-doc-face))
                (ivy-rich-file-group              (:width 4 :face font-lock-doc-face))
                (ivy-rich-file-modes              (:width 11 :face font-lock-doc-face))
                (ivy-rich-file-size               (:width 7 :face font-lock-doc-face))
                (ivy-rich-file-last-modified-time (:width 30 :face font-lock-doc-face)))))
  (plist-put ivy-rich-display-transformers-list
             'counsel-projectile-switch-project
             '(:columns
               ((ivy-rich-branch-candidate        (:width 80))
                (ivy-rich-compiling))))
  (plist-put ivy-rich-display-transformers-list
             'ivy-switch-buffer
             '(:columns
               ((ivy-rich-switch-buffer-icon       (:width 2))
                (ivy-rich-candidate                (:width 40))
                (ivy-rich-switch-buffer-size       (:width 7))
                (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
                (ivy-rich-switch-buffer-major-mode (:width 20 :face warning)))
               :predicate (lambda (cand) (get-buffer cand))))
  (ivy-rich-mode 1))

(use-package all-the-icons-ivy
  :straight t
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window))
  :config
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-dired-jump)
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-find-library)
  (all-the-icons-ivy-setup))

(use-package swiper
  :straight t
  :after ivy
  :bind (("C-s" . swiper)
         :map swiper-map
         ("M-%" . swiper-query-replace)))

(use-package ivy-prescient
  :straight t
  :config (ivy-prescient-mode t))

;; spell

(use-package hydra
  :straight t
  :defer 2
  :bind (("C-c f" . hydra-flycheck/body)
         ("C-c k" . hydra-spelling/body)))

(provide 'behavior_conf)
;;; behavior_conf.el ends here
