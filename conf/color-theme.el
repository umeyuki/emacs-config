;; emacs default theme
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/themes/"))
(load-theme 'calm-forest t )
;; (enable-theme 'taylor)

;; (when (require 'color-theme)
;;   (color-theme-initialize)
;;   (when (require 'color-theme-solarized)
;;     (load-theme 'solarized-dark t)
;;     )
;;   )
