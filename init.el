;; set folder names
;;-----------------
(setq home (file-name-as-directory "~"))
(setq dropbox (file-name-as-directory "Dropbox"))
(setq emacs_d (file-name-as-directory ".emacs.d"))
(setq root (concat home dropbox emacs_d))

(setq main_conf (file-name-as-directory "main_conf"))
(setq programming_conf (file-name-as-directory "programming_conf"))
(setq conf (file-name-as-directory "conf"))

(setq package (file-name-as-directory "package"))
(setq apparence (file-name-as-directory "apparence"))
(setq behavior (file-name-as-directory "behavior"))

(setq python (file-name-as-directory "python"))
(setq markdown (file-name-as-directory "markdown"))
(setq csv (file-name-as-directory "csv"))
(setq org (file-name-as-directory "org"))
(setq magit (file-name-as-directory "magit"))
(setq dired (file-name-as-directory "dired"))
(setq beancount (file-name-as-directory "beancount"))

(setq theme (file-name-as-directory "theme"))
(setq snippet (file-name-as-directory "snippets"))

;; Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; package
;;--------
(setq path_package_conf (concat root conf package "package_conf.el"))
(load path_package_conf)

;; apparence
;;----------
(setq path_apparence_conf (concat root conf apparence "apparence_conf.el"))
(load path_apparence_conf)

;; behavior
;;---------
(setq path_behavior_conf (concat root conf behavior "behavior_conf.el"))
(load path_behavior_conf)

;; python
;;-------
(setq path_python_conf (concat root conf python "python_conf.el"))
(load path_python_conf)

;; org
;;-------
(setq path_org_conf (concat root conf org "org_conf.el"))
(load path_org_conf)

;; magit
;;-------
(setq path_magit_conf (concat root conf magit "magit_conf.el"))
(load path_magit_conf)

;; csv
;;----
(setq path_csv_conf (concat root conf csv "csv_conf.el"))
(load path_csv_conf)

;; beancount
;;----
(setq path_beancount_conf (concat root conf beancount "beancount_conf.el"))
(load path_beancount_conf)

;; theme
;;------
(add-to-list 'custom-theme-load-path (concat root theme))
