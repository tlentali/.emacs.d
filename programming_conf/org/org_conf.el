;;; set path
(setq home (file-name-as-directory "~"))
(setq dropbox (file-name-as-directory "Dropbox"))
(setq alfred (file-name-as-directory "alfred"))
(setq org_folder (file-name-as-directory "org"))
(setq root_org (concat home dropbox alfred org_folder))
(setq org-directory root_org)

(use-package org
  :straight t
  :ensure org-plus-contrib ;; load from the package instead of internal
  :mode (("\\.org$" . org-mode)
         ("\\.org.draft$" . org-mode))
  :commands (org-agenda org-capture)
  :config
  (setq org-log-done 'time) ;; add a timestamp when closing a todo
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "HOLD(h)" "|" "DONE(d)"))))

(use-package org-capture
  :after org
  :commands (org-capture)
  :config
  (add-to-list 'org-capture-templates
               ;; the file lambda () is added because of :
               ;; https://emacs.stackexchange.com/a/42140
               `("i" "Inbox" entry  (file (lambda () (concat root_org "inbox.org")))
                 ,(concat "* TODO %?\n"
                          "/Entered on/ %U")))
  (add-to-list 'org-capture-templates
               `("m" "Meeting" entry  (file+headline 
                                       (lambda () 
                                         (concat root_org "agenda.org")) "Future")
                 (concat "* %? :meeting:\n"
                         "<%<%Y-%m-%d %a %H:00>>")))
  (add-to-list 'org-capture-templates
               `("n" "Note" entry  (file (lambda () (concat root_org "note.org")))
                 ,(concat "* Note %?\n"
                          "/Entered on/ %U")))
  :bind
  (("C-c c" . org-capture)))

(use-package org-agenda
  :after org
  :commands (org-agenda)
  :bind (("C-c a" . org-agenda)
         ("<f12>" . org-agenda)
         ("C-c o r a" . org-agenda-refile))
  :config
  ;; (use-package org-super-agenda
  ;;   :config (org-super-agenda-mode))
  (load-library "find-lisp")
  (setq org-agenda-files (find-lisp-find-files root_org "\.org$"))
  (setq org-agenda-span 'day)
  (setq org-agenda-start-on-weekday 1)
  (setq org-agenda-compact-blocks t)
  (setq org-agenda-sticky t)
  (setq org-super-agenda-header-separator "")
  (setq org-agenda-hide-tags-regexp ".")
  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
          (todo   . " ")
          (tags   . " %i %-12:c")
          (search . " %i %-12:c")))
  (setq org-agenda-custom-commands
        '(("g" "Get Things Done (GTD)"
           ((agenda ""
                    ((org-agenda-skip-function
                      '(org-agenda-skip-entry-if 'deadline))
                     (org-deadline-warning-days 0)))
            (todo "NEXT"
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline))
                   (org-agenda-prefix-format "  %i %-12:c [%e] ")
                   (org-agenda-overriding-header "\nTasks\n")))
            (agenda nil
                    ((org-agenda-entry-types '(:deadline))
                     (org-agenda-format-date "")
                     (org-deadline-warning-days 7)
                     (org-agenda-skip-function
                      '(org-agenda-skip-entry-if 'notregexp "\\* NEXT"))
                     (org-agenda-overriding-header "\nDeadlines")))
            (tags-todo "inbox"
                       ((org-agenda-prefix-format "  %?-12t% s")
                        (org-agenda-overriding-header "\nInbox\n")))
            (tags "CLOSED>=\"<today>\""
                  ((org-agenda-overriding-header "\nCompleted today\n"))))))))

;; Refile
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
;; (setq org-refile-targets '(("projects.org" :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)")))
(setq org-refile-targets (quote (("projects.org" :maxlevel . 5))))
;; If issue "Invalid function: org-preserve-local-variables" do :
;; https://github.com/syl20bnr/spacemacs/issues/11801#issuecomment-451814619
;;   cd ~/.emacs.d/elpa
;;   find org*/*.elc -print0 | xargs -0 rm

(defun log-todo-next-creation-date (&rest ignore)
  "Log NEXT creation time in the property drawer under the key 'ACTIVATED'"
  (when (and (string= (org-get-todo-state) "NEXT")
             (not (org-entry-get nil "ACTIVATED")))
    (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))
(add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)

(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c a") 'org-agenda)
