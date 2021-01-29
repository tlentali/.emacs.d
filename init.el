;; set folder names
;;-----------------
(setq home (file-name-as-directory "~"))
(setq dropbox (file-name-as-directory "Dropbox"))
(setq emacs_d (file-name-as-directory ".emacs.d"))
(setq root (concat home dropbox emacs_d))
(setq main_conf (file-name-as-directory "main_conf"))
(setq programming_conf (file-name-as-directory "programming_conf"))
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
(setq path_python_conf (concat root programming_conf "python_conf.el"))
(load path_python_conf)

;; org
;;-------
(setq path_org_conf (concat root programming_conf "org_conf.el"))
(load path_org_conf)

;; magit
;;-------
(setq path_magit_conf (concat root programming_conf "magit_conf.el"))
(load path_magit_conf)

;; csv
;;----
(setq path_csv_conf (concat root programming_conf "csv_conf.el"))
(load path_csv_conf)

;; theme
;;------
(add-to-list 'custom-theme-load-path (concat root theme))
