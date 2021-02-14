(require 'org)

;;; set path
(setq home (file-name-as-directory "~"))
(setq dropbox (file-name-as-directory "Dropbox"))
(setq alfred (file-name-as-directory "alfred"))
(setq root_org (concat home dropbox alfred))

(setq org-directory root_org)

(load-library "find-lisp")
(setq org-agenda-files
   (find-lisp-find-files root_org "\.org$"))

;;(setq org-agenda-files (directory-files-recursively "~/.personal/agenda/" "~/.personal/journal" "\\.org$"))
(bind-key "C-c a" #'org-agenda)

;; org todo sequence
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "|" "DONE")))

;;; org-contact
(use-package org
  :ensure org-plus-contrib)

(use-package use-package-ensure-system-package :ensure t)
(use-package org
  :ensure org-plus-contrib
  ;; The rest of your org-mode configuration
)
(use-package org-contacts
  :ensure nil
  :after org
  :custom (org-contacts-files '(concat root_org "contact/contacts.org")))

(use-package org-capture
  :ensure nil
  :after org
  :preface
  (defvar my/org-contacts-template "* %(org-contacts-template-name)
:PROPERTIES:
:PHONE: %^{phone}
:EMAIL: %(org-contacts-template-email)
:ADDRESS: %^{adress}
:BIRTHDAY: %^{yyyy-mm-dd}
:NOTE: %^{NOTE}
:END:" "Template for org-contacts.")
  :custom
  (org-capture-templates
   `(("c" "Contact" entry (file+headline (concat root_org "contact/contacts.org") "Contacts"),
      my/org-contacts-template
      :empty-lines 1))))

;;; good looking agenda M-x org-agenda RET o RET
;;; or C-c a o
;; https://www.reddit.com/r/unixporn/comments/jprtoj/xmonad_productivity_workflow_emacs_orgmode_agenda/
(setq org-agenda-custom-commands
      '(("o" "My Agenda"
         ((todo "TODO" (
                      (org-agenda-overriding-header "\n⚡ Do Today:\n⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺")
                      (org-agenda-remove-tags t)
                      (org-agenda-prefix-format " %-2i %-15b")
                      (org-agenda-todo-keyword-format "")
                       ))
          (agenda "" (
                      (org-agenda-start-day "+0d")
                      (org-agenda-span 15)
                      (org-agenda-overriding-header "⚡ Schedule:\n⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺")
                      (org-agenda-repeating-timestamp-show-all nil)
                      (org-agenda-remove-tags t)
                      (org-agenda-prefix-format   "  %-3i  %-15b %t%s")
                      (org-agenda-todo-keyword-format " ☐ ")
                      (org-agenda-current-time-string "<┈┈┈┈┈┈┈ now")
                      (org-agenda-scheduled-leaders '("" ""))
                      (org-agenda-time-grid (quote ((daily today remove-match)
                                                    (0900 1200 1500 1800 2100)
                                                    "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")))
                       ))
          ))))
;;; org journal
(require 'org-journal)
(setq org-journal-dir (concat "/journal/"))
(setq org-journal-file-format "%Y%m%d.org")
(setq org-journal-date-format "%A, %d %B %Y")
(setq org-journal-enable-agenda-integration t)

(setq org-default-notes-file (concat root_org "refile/refile.org"))

;; I use C-c c to start capture mode
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
;; https://emacs.stackexchange.com/a/42140
(setq org-capture-templates
      (quote (("t" "todo" entry (file (lambda () (concat root_org "refile/refile.org")))
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file (lambda () (concat root_org "refile/refile.org")))
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t)
              ("n" "note" entry (file (lambda () (concat root_org "refile/refile.org")))
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree (lambda () (concat root_org "refile/diary.org")))
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file (lambda () (concat root_org "refile/refile.org")))
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file (lambda () (concat root_org "refile/refile.org")))
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file (lambda () (concat root_org "refile/refile.org")))
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (fiqle (lambda () (concat root_org "refile/refile.org")))
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
