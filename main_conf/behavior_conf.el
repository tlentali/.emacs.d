;;; typed text replaces the selection if the selection is active
(delete-selection-mode 1) 
;;; always replace tabs with spaces
(setq-default indent-tabs-mode nil)
;;; set tab width to 4 for all buffers
(setq-default tab-width 4)
;;; cursor scroll smoothly 
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
;;; mousewheel scroll one line at a time (less "jumpy" than defaults) (add M-x pixel-scroll-mode)
(when (display-graphic-p)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
        mouse-wheel-progressive-speed nil))
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 100000)
;;; Past without indentation mess
(electric-indent-mode 0)
;;; window-numbering
(require 'window-numbering)
(window-numbering-mode 1)
;;; zoom current window size
;; (defun size-callback ()
;;   (cond ((> (frame-pixel-width) 1280) '(0.90 . 0.75))
;;         (t                            '(0.618 . 0.618))))
;; (custom-set-variables
;;  '(zoom-size 'size-callback))
(custom-set-variables '(zoom-size '(0.618 . 0.618)))
;;; dimmer visually highlight the selected buffer
(require 'dimmer)
(dimmer-mode t)

