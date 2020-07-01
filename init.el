;; package
;;--------
(load "~/.emacs.d/main_conf/package_conf.el")

;; apparence
;;----------
(load "~/.emacs.d/main_conf/apparence_conf.el")

;; behavior
;;---------
(load "~/.emacs.d/main_conf/behavior_conf.el")

;; python
;;-------
(load "~/.emacs.d/programming_conf/python_conf.el")

;; org
;;-------
(load "~/.emacs.d/programming_conf/org_conf.el")

;; magit
;;-------
(load "~/.emacs.d/programming_conf/magit_conf.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (spaceline popup-kill-ring expand-region rainbow-delimiters beacon avy swiper zoom window-numbering use-package-ensure-system-package speed-type smooth-scrolling py-autopep8 org-plus-contrib neotree multiple-cursors markdown-mode magit horizon-theme golden-ratio flycheck elpy ein dimmer dashboard all-the-icons)))
 '(zoom-mode t nil (zoom))
 '(zoom-size (quote (0.618 . 0.618))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
