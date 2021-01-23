;; csv mode
(load "~/Dropbox/.emacs.d/programming_conf/csv-mode.el")
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode" 
    "Major mode for editing comma-separated value files." t)
