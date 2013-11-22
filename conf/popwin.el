(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
(push '(" *auto-async-byte-compile*") popwin:special-display-config)
