;;; hydra_conf.el --- hydra you want for your emacs
;;; Commentary:
;;; hydra --- all the hydra related config are here
;;; Code:

; make Emacs bindings that stick around
(use-package hydra
  :straight t
  :defer 2
  :bind (("C-c f" . hydra-flycheck/body)
         ("C-c k" . hydra-spelling/body)
         ("C-c b" . hydra-projectile/body)))

(defhydra hydra-spelling (:color blue)
  "
  ^
  ^Spelling^          ^Errors^            ^Checker^
  ^────────^──────────^──────^────────────^───────^───────
  _q_ quit            _<_ previous        _c_ correction
  ^^                  _>_ next            _d_ dictionary
  ^^                  _f_ check           _m_ mode
  ^^                  ^^                  ^^
  "
  ("q" nil)
  ("<" flyspell-correct-previous :color pink)
  (">" flyspell-correct-next :color pink)
  ("c" ispell)
  ("d" ispell-change-dictionary)
  ("f" flyspell-buffer)
  ("m" flyspell-mode))

(defhydra hydra-flycheck (:color blue)
  "
  ^
  ^Flycheck^          ^Errors^            ^Checker^
  ^────────^──────────^──────^────────────^───────^─────
  _q_ quit            _<_ previous        _?_ describe
  _M_ manual          _>_ next            _d_ disable
  _v_ verify setup    _f_ check           _m_ mode
  ^^                  _l_ list            _s_ select
  ^^                  ^^                  ^^
  "
  ("q" nil)
  ("<" flycheck-previous-error :color pink)
  (">" flycheck-next-error :color pink)
  ("?" flycheck-describe-checker)
  ("M" flycheck-manual)
  ("d" flycheck-disable-checker)
  ("f" flycheck-buffer)
  ("l" flycheck-list-errors)
  ("m" flycheck-mode)
  ("s" flycheck-select-checker)
  ("v" flycheck-verify-setup))

(defhydra hydra-projectile (:color blue)
  "
  ^
  ^Projectile^        ^Buffers^           ^Find^              ^Search^
  ^──────────^────────^───────^───────────^────^──────────────^──────^────────────
  _q_ quit            _b_ list            _d_ directory       _r_ replace
  _i_ reset cache     _k_ kill all        _D_ root            _R_ regexp replace
  ^^                  _S_ save all        _f_ file            _s_ search
  ^^                  ^^                  _p_ project         ^^
  ^^                  ^^                  ^^                  ^^
  "
  ("q" nil)
  ("b" counsel-projectile-switch-to-buffer)
  ("d" counsel-projectile-find-dir)
  ("D" projectile-dired)
  ("f" counsel-projectile-find-file)
  ("i" projectile-invalidate-cache :color red)
  ("k" projectile-kill-buffers)
  ("p" counsel-projectile-switch-project)
  ("r" projectile-replace)
  ("R" projectile-replace-regexp)
  ("s" counsel-rg)
  ("S" projectile-save-project-buffers))

(provide 'hydra_conf)
;;; hydra_conf.el ends here
