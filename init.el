;; set folder names
;;-----------------
(setq home (file-name-as-directory "~"))
(setq dropbox (file-name-as-directory "Dropbox"))
(setq emacs_d (file-name-as-directory ".emacs.d"))
(setq root (concat home dropbox emacs_d))
(setq main_conf (file-name-as-directory "main_conf"))
(setq programming_conf (file-name-as-directory "programming_conf"))

;; package
;;--------
(setq path_package (concat root main_conf "package_conf.el"))
(load path_package)

;; apparence
;;----------
(setq path_package (concat root main_conf "apparence_conf.el"))
(load path_package)

;; behavior
;;---------
(setq path_package (concat root main_conf "behavior_conf.el"))
(load path_package)

;; python
;;-------
(setq path_package (concat root programming_conf "python_conf.el"))
(load path_package)

;; org
;;-------
(setq path_package (concat root programming_conf "org_conf.el"))
(load path_package)

;; magit
;;-------
(setq path_package (concat root programming_conf "magit_conf.el"))
(load path_package)

;; csv
;;-------
(setq path_package (concat root programming_conf "csv_conf.el"))
(load path_package)
