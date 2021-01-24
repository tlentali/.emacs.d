;; package
;;--------
(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;; since horizon theme ask for it
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; for org-contact
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(ein
    elpy
    flycheck
    py-autopep8
    neotree
    multiple-cursors
    yasnippet
    use-package
    horizon-theme
    smooth-scrolling
    window-numbering
    zoom
    markdown-mode
    magit
    dimmer
    swiper
    beacon
    rainbow-delimiters
    expand-region
    popup-kill-ring
    writeroom-mode
    smex
    projectile
    ctrlf
    company
    smartparens
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)
