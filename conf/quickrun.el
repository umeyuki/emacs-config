(require 'quickrun)
(push '("*quickrun*") popwin:special-display-config)
(global-set-key (kbd "C-l C-r") 'quickrun)
(global-set-key (kbd "C-l C-m") 'quickrun-sc)

(defun quickrun-sc (start end)
  (interactive "r")
  (if mark-active
      (quickrun :start start :end end)
    (quickrun)))

(defun quickrun-carton-exec ()
  (interactive)
  (quickrun :source `((:command . "carton exec")
                         (:exec . ("%c -- perl %s")))))

(defun quickrun-bundle-exec ()
  (interactive)
  (quickrun :source `((:command . "bundle exec")
                         (:exec . ("%c -- ruby %s")))))
