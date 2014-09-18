;; color-theme.el
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/themes/"))
(load-theme 'taylor t t)
(enable-theme 'taylor)

;; (when (require 'color-theme)
;;   (color-theme-initialize)
;;   (when (require 'color-theme-solarized)
;;     (load-theme 'solarized-dark t)
;;     )
;;   )
