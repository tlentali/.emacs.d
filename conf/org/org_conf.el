;; set path
(setq home (file-name-as-directory "~"))
(setq dropbox (file-name-as-directory "Dropbox"))
(setq alfred (file-name-as-directory "alfred"))
(setq org_folder (file-name-as-directory "org"))
(setq root_org (concat home dropbox alfred org_folder))
(setq org-directory root_org)

(use-package org
  :straight t
  :demand ;; force to call org at startup and allow to use agenda call for example
  :ensure org-plus-contrib ;; load from the package instead of internal
  :mode (("\\.org$" . org-mode)
         ("\\.org.draft$" . org-mode))
  :commands (org-agenda org-capture)
  :bind (("C-c a" . org-agenda)
         ("<f12>" . org-agenda)
         ("C-c o r a" . org-agenda-refile)
         ("C-c c" . org-capture)
         ;;(define-key global-map (kbd "C-c c") 'org-capture)
         ;;(define-key global-map (kbd "C-c a") 'org-agenda)
         )
  :config
  (setq org-log-done 'time) ;; add a timestamp when closing a todo
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "HOLD(h)" "|" "DONE(d)")))
  ;; org-capture
  (setq org-capture-templates
        ;; the file lambda () is added because of :
        ;; https://emacs.stackexchange.com/a/42140
        '(("i" "Inbox" entry  (file (lambda () (concat root_org "inbox.org")))
           "* TODO %?\n/Entered on/ %U")
          ("m" "Meeting" entry  (file+headline
                                 (lambda () (concat root_org "agenda.org")) "Future")
           "* %? :meeting:\n<%<%Y-%m-%d %a %H:00>>")
          ("n" "Note" entry  (file (lambda () (concat root_org "note.org")))
           "* Note %?\n/Entered on/ %U")))
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
                  ((org-agenda-overriding-header "\nCompleted today\n")))
            (tags "CLOSED>=\"<yesterday>\""
                  ((org-agenda-overriding-header "\nCompleted yesterday\n")))))
          ("a" "My Agenda"
           ((agenda "" (
                        (org-agenda-overriding-header "\nSCHEDULE:\n")
                        (org-agenda-skip-scheduled-if-done t)
                        (org-agenda-skip-timestamp-if-done t)
                        (org-agenda-skip-deadline-if-done t)
                        (org-agenda-start-day "+0d")
                        (org-agenda-span 15)
                        (org-agenda-repeating-timestamp-show-all nil)
                        (org-agenda-remove-tags t)
                        (org-agenda-prefix-format "  %-3i  %-15b%t %s")
                        ;; (concat "  %-3i  %-15b %t%s" org-agenda-hidden-separator))
                        (org-agenda-todo-keyword-format " ☐ ")
                        (org-agenda-time)
                        (org-agenda-current-time-string "⮜┈┈┈┈┈┈┈ now")
                        (org-agenda-scheduled-leaders '("" ""))
                        (org-agenda-deadline-leaders '("" ""))
                        (org-agenda-time-grid (quote ((today require-timed remove-match) (0900 2100) "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")
                                                     ))))
            (todo "NEXT" (
                          (org-agenda-overriding-header "\nNEXT:\n")
                          (org-agenda-remove-tags t)
                          (org-agenda-prefix-format "  %-2i  %b")
                          (org-agenda-todo-keyword-format "")))
            (todo "TODO" (
                          (org-agenda-overriding-header "\nTODO:\n")
                          (org-agenda-remove-tags t)
                          (org-agenda-prefix-format "  %-2i  %b")
                          (org-agenda-todo-keyword-format "")))))
          ("r" "Thomas'timeline"
           ((agenda ""
                    ((org-agenda-overriding-header "\nSCHEDULE:\n")
                     (org-agenda-skip-scheduled-if-done nil)
                     (org-agenda-skip-timestamp-if-done nil)
                     (org-agenda-skip-deadline-if-done nil)
                     (org-agenda-start-day "-1d")
                     (org-agenda-span 15)
                     (org-deadline-warning-days 1)
                     (org-agenda-start-on-weekday nil)
                     (org-agenda-repeating-timestamp-show-all nil)
                     (org-agenda-prefix-format "%-12c%-20b%t [%e] %s")
                     (org-agenda-time)
                     (org-agenda-current-time-string "┈┈┈┈┈┈┈┈┈ now")
                     (org-agenda-time-grid (quote ((today require-timed remove-match) (0900 2100) "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")
                                                  ))
                     ))
            (todo "NEXT"
                  ((org-agenda-prefix-format "%-12c%-20b")
                   (org-agenda-overriding-header "\nNext\n")))
            (tags-todo "DEADLINE>=\"<today>\"&DEADLINE<=\"<+30d>\""
                  ((org-agenda-sorting-strategy '(todo-state-down))
                   (org-agenda-overriding-header "\nDeadline 30d\n")
                   (org-agenda-prefix-format "%-12c%-20b")))
            (todo "TODO"
                  ((org-agenda-prefix-format "%-12c%-20b")
                   (org-agenda-overriding-header "\nTodo\n")))
            (tags "CLOSED>=\"<today>\""
                  ((org-agenda-overriding-header "\nCompleted today\n")
                   (org-agenda-prefix-format "%-12c%-20b")))
            (tags "CLOSED<=\"<today>\"&CLOSED>=\"<-1d>\""
                  ((org-agenda-overriding-header "\nCompleted yesterday\n")
                   (org-agenda-prefix-format "%-12c%-20b")))
            (tags "CLOSED<=\"<-1d>\"&CLOSED>=\"<-2d>\""
                  ((org-agenda-overriding-header "\nCompleted between yesterday and 2 days ago\n")
                   (org-agenda-prefix-format "%-12c%-20b")))
            (tags "CLOSED<=\"<-2d>\"&CLOSED>=\"<-3d>\""
                  ((org-agenda-overriding-header "\nCompleted between 2 and 3 days ago\n")
                   (org-agenda-prefix-format "%-12c%-20b")))
            (tags "CLOSED<=\"<-3d>\"&CLOSED>=\"<-14d>\""
                  ((org-agenda-overriding-header "\nCompleted between 3 and 14 days ago\n")
                   (org-agenda-prefix-format "%-12c%-20b")))
            ))))
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
  (add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date))
