;; package
;;--------
(load "~/Dropbox/.emacs.d/main_conf/package_conf.el")

;; apparence
;;----------
(load "~/Dropbox/.emacs.d/main_conf/apparence_conf.el")

;; behavior
;;---------
(load "~/Dropbox/.emacs.d/main_conf/behavior_conf.el")

;; python
;;-------
(load "~/Dropbox/.emacs.d/programming_conf/python_conf.el")

;; org
;;-------
(load "~/Dropbox/.emacs.d/programming_conf/org_conf.el")

;; magit
;;-------
(load "~/Dropbox/.emacs.d/programming_conf/magit_conf.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("183c9561df46e9796cef46e3277e7fc39022be5ca537124a8618dbaec2804d39" "d88049c628f3a8a92f9e46982d3e891867e4991de2b3a714f29f9f5eb91638c1" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-capture-templates
   (quote
    (("c" "Contact" entry
      (file+headline "~/Dropbox/personal/agenda/contacts.org" "Contacts")
      "* %(org-contacts-template-name)
:PROPERTIES:
:PHONE: %^{phone}
:EMAIL: %(org-contacts-template-email)
:ADDRESS: %^{adress}
:BIRTHDAY: %^{yyyy-mm-dd}
:NOTE: %^{NOTE}
:END:" :empty-lines 1))))
 '(org-contacts-files (quote ("~/Dropbox/personal/agenda/contacts.org")))
 '(package-selected-packages
   (quote
    (zerodark-theme zoom writeroom-mode window-numbering use-package-ensure-system-package undo-tree treemacs swiper speed-type spaceline smooth-scrolling shrink-path rainbow-delimiters py-autopep8 popup-kill-ring org-plus-contrib org-journal neotree multiple-cursors markdown-toc magit impatient-mode ido-vertical-mode horizon-theme golden-ratio flycheck expand-region elpy ein dimmer dashboard color-theme-sanityinc-tomorrow beacon all-the-icons)))
 '(zoom-mode t nil (zoom))
 '(zoom-size (quote (0.618 . 0.618))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 100 :family "hack")))))
