;;; org agenda
(setq org-agenda-files (quote ("~/.personal/agenda/")))
;a;; org-contact
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

