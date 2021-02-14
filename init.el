;; set folder names
;;-----------------
(setq home (file-name-as-directory "~"))
(setq dropbox (file-name-as-directory "Dropbox"))
(setq emacs_d (file-name-as-directory ".emacs.d"))
(setq root (concat home dropbox emacs_d))

(setq main_conf (file-name-as-directory "main_conf"))
(setq programming_conf (file-name-as-directory "programming_conf"))

(setq python (file-name-as-directory "python"))
(setq markdown (file-name-as-directory "markdown"))
(setq csv (file-name-as-directory "csv"))
(setq org (file-name-as-directory "org"))
(setq magit (file-name-as-directory "magit"))
(setq dired (file-name-as-directory "dired"))

(setq theme (file-name-as-directory "theme"))
(setq snippet (file-name-as-directory "snippets"))

;; package
;;--------
(setq path_package_conf (concat root main_conf "package_conf.el"))
(load path_package_conf)

;; apparence
;;----------
(setq path_apparence_conf (concat root main_conf "apparence_conf.el"))
(load path_apparence_conf)

;; behavior
;;---------
(setq path_behavior_conf (concat root main_conf "behavior_conf.el"))
(load path_behavior_conf)

;; python
;;-------
(setq path_python_conf (concat root programming_conf python "python_conf.el"))
(load path_python_conf)

;; org
;;-------
(setq path_org_conf (concat root programming_conf org "org_conf.el"))
(load path_org_conf)

;; magit
;;-------
(setq path_magit_conf (concat root programming_conf magit "magit_conf.el"))
(load path_magit_conf)

;; csv
;;----
(setq path_csv_conf (concat root programming_conf csv "csv_conf.el"))
(load path_csv_conf)

;; theme
;;------
(add-to-list 'custom-theme-load-path (concat root theme))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (doom-modeline zoom zerodark-theme yasnippet-snippets yascroll writeroom-mode window-numbering use-package-ensure-system-package undo-tree treemacs swiper speed-type spaceline smooth-scrolling smex smartparens shrink-path rainbow-delimiters py-autopep8 projectile popup-kill-ring org-plus-contrib org-journal neotree multiple-cursors mood-line markdown-toc magit jupyter impatient-mode ido-vertical-mode horizon-theme golden-ratio gist flycheck expand-region elpy ein dimmer diff-hl dashboard ctrlf color-theme-sanityinc-tomorrow beacon)))
 '(zoom-mode t nil (zoom))
 '(zoom-size (quote (0.618 . 0.618))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:foreground "#f60386" :background "#2d2d2d")))))
