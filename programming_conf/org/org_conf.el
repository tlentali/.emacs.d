;;(require 'org)

;;; set path
(setq home (file-name-as-directory "~"))
(setq dropbox (file-name-as-directory "Dropbox"))
(setq alfred (file-name-as-directory "alfred"))
(setq root_org (concat home dropbox alfred))
(setq org-directory root_org)

(load-library "find-lisp")

(use-package org
  :ensure org-plus-contrib ;; load from the package instead of internal
  :mode (("\\.org$" . org-mode)
         ("\\.org.draft$" . org-mode))
  :commands (org-agenda org-capture)
  :config
      (setq org-log-done 'time) ;; add a timestamp when closing a todo
      (setq org-todo-keywords '((sequence "TODO" "NEXT" "DOING" "|" "DONE")))
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
          ))))
)

(use-package org-agenda
  :after org
  :commands (org-agenda)
  :bind (("C-c a" . org-agenda)
         ("<f12>" . org-agenda)
         ("C-c o r a" . org-agenda-refile))
  :config
  (use-package org-super-agenda
    :config (org-super-agenda-mode))
  (setq org-agenda-files (find-lisp-find-files root_org "\.org$")
        org-agenda-span 'day
        org-agenda-start-on-weekday 1
        org-agenda-compact-blocks t
        org-agenda-sticky t
        org-super-agenda-header-separator ""
        org-agenda-custom-commands
  )
)

(use-package org-capture
  :after org
  :commands (org-capture)
  :config
  (add-to-list 'org-capture-templates
               `("i" "Inbox" entry  (file (lambda () (concat root_org "inbox/inbox.org")))
                 ,(concat "* TODO %?\n"
                 "/Entered on/ %U")))
  (add-to-list 'org-capture-templates
               `("m" "Meeting" entry  (file (lambda () (concat root_org "inbox/inbox.org")))
                 ,(concat "* %? :meeting:\n"
                 "<%<%Y-%m-%d %a %H:00>>")))
  (add-to-list 'org-capture-templates
               `("n" "Note" entry  (file (lambda () (concat root_org "inbox/note.org")))
                 ,(concat "* Note (%a)\n"
                 "/Entered on/ %U\n" "\n" "%?")))
  (add-to-list 'org-capture-templates
               `("j" "Journal" entry (file+datetree (lambda () (concat root_org "inbox/diary.org")))
               "* %?\n%U\n"))
  :bind
  (("C-c c" . org-capture))
)
;; the file lambda () is added because of :
;; https://emacs.stackexchange.com/a/42140

(define-key global-map            (kbd "C-c a") 'org-agenda)
(define-key global-map            (kbd "C-c c") 'org-capture)
