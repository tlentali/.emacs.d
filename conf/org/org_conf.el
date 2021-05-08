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
        '(("i" "Inbox" entry  (file  (lambda () (concat root_org "inbox.org")))
           "* TODO %?\n/Entered on/ %U")
          ("m" "Meeting" entry  (file+headline
                                 (lambda () (concat root_org "agenda.org")) "Future")
           "* %? :meeting:\n<%<%Y-%m-%d %a %H:00>>")
          ("n" "Note" entry  (file (lambda () (concat root_org "note.org")))
           "* Note %?\n/Entered on/ %U")))
  (load-library "find-lisp")
  (setq org-agenda-files (find-lisp-find-files root_org "\.org$"))
  ;; Refile
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-refile-use-cache nil)
  (setq org-refile-use-outline-path nil)
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))
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
        '(("w" "Tom's agenda"
           ((agenda ""
                    ((org-agenda-overriding-header "\nSCHEDULE:\n")
                     (org-agenda-skip-scheduled-if-done nil)
                     (org-agenda-skip-timestamp-if-done nil)
                     (org-agenda-skip-deadline-if-done nil)
                     (org-agenda-start-day "1d")
                     (org-agenda-span 7)
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
            (tags "CLOSED<=\"<today>\"&CLOSED>=\"<-7d>\""
                  ((org-agenda-overriding-header "\nCompleted this week\n")
                   (org-agenda-prefix-format "%-12c%-20b")))
            ))))
  
(use-package org-contacts
  :ensure nil
  :after org
  :custom (org-contacts-files '("~/Dropbox/alfred/org/contact.org")))

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

;; Automatically saving files after refile 
;; https://github.com/rougier/emacs-gtd/issues/9#issue-769874432
;; Save the corresponding buffers
(defun gtd-save-org-buffers ()
  "Save `org-agenda-files' buffers without user confirmation.
See also `org-save-all-org-buffers'"
  (interactive)
  (message "Saving org-agenda-files buffers...")
  (save-some-buffers t (lambda () 
			 (when (member (buffer-file-name) org-agenda-files) 
			   t)))
  (message "Saving org-agenda-files buffers... done"))

;; Add it after refile
(advice-add 'org-refile :after
	    (lambda (&rest _)
	      (gtd-save-org-buffers)))
