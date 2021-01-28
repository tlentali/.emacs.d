;; set folder names
;;-----------------
(setq home (file-name-as-directory "~"))
(setq dropbox (file-name-as-directory "Dropbox"))
(setq emacsd (file-name-as-directory ".emacs.d"))
(setq main_conf (file-name-as-directory "main_conf"))
(setq programming_conf (file-name-as-directory "programming_conf"))

;; package
;;--------
(setq path_package (concat home dropbox emacsd main_conf "package_conf.el"))
(load path_package)

;; apparence
;;----------
(setq path_package (concat home dropbox emacsd main_conf "apparence_conf.el"))
(load path_package)

;; behavior
;;---------
(setq path_package (concat home dropbox emacsd main_conf "behavior_conf.el"))
(load path_package)

;; python
;;-------
(setq path_package (concat home dropbox emacsd programming_conf "python_conf.el"))
(load path_package)

;; org
;;-------
(setq path_package (concat home dropbox emacsd programming_conf "org_conf.el"))
(load path_package)

;; magit
;;-------
(setq path_package (concat home dropbox emacsd programming_conf "magit_conf.el"))
(load path_package)
