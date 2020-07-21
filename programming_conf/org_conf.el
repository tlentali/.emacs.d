(require 'org)
;;; org agenda
(setq org-agenda-files (quote ("~/.personal/agenda/")))
;;(setq org-agenda-files (directory-files-recursively "~/.personal/agenda/" "~/.personal/journal" "\\.org$"))
(bind-key "C-c a" #'org-agenda)
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
  :custom (org-contacts-files '("~/.personal/agenda/contacts.org")))
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
   `(("c" "Contact" entry (file+headline "~/.personal/agenda/contacts.org" "Contacts"),
      my/org-contacts-template
      :empty-lines 1))))
;;; good looking agenda M-x org-agenda RET o RET
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
                      (org-agenda-span 5)
                      (org-agenda-overriding-header "⚡ Schedule:\n⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺")
                      (org-agenda-repeating-timestamp-show-all nil)
                      (org-agenda-remove-tags t)
                      (org-agenda-prefix-format   "  %-3i  %-15b %t%s")
                      (org-agenda-todo-keyword-format " ☐ ")
                      (org-agenda-current-time-string "⮜┈┈┈┈┈┈┈ now")
                      (org-agenda-scheduled-leaders '("" ""))
                      (org-agenda-time-grid (quote ((daily today remove-match)
                                                    (0900 1200 1500 1800 2100)
                                                    "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")))
                       ))
          ))))
;;; org journal
(require 'org-journal)
(setq org-journal-dir "~/.personal/journal/")
(setq org-journal-date-format "%A, %d %B %Y")
(setq org-journal-enable-agenda-integration t)
