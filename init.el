;; package
;;--------
(load "~/.emacs.d/package_conf.el")

;; apparence
;;----------
(load "~/.emacs.d/apparence_conf.el")

;; behavior
;;---------
(load "~/.emacs.d/behavior_conf.el")

;; python
;;-------
(load "~/.emacs.d/python_conf.el")

;; org
;;-------
(load "~/.emacs.d/org_conf.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (markdown-mode zoom window-numbering use-package-ensure-system-package smooth-scrolling py-autopep8 org-plus-contrib neotree multiple-cursors horizon-theme golden-ratio flycheck elpy ein dimmer)))
 '(zoom-mode (quote (0.618 . 0.618)) nil (zoom))
 '(zoom-size (quote (0.618 . 0.618))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
