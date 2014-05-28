;; color-theme.el
(when (require 'color-theme)
  (color-theme-initialize)
  (when (require 'color-theme-solarized)
    (load-theme 'solarized-dark t)
    )
  )
