(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
(push '("_\..+$" :regexp t) popwin:special-display-config)
(push '(" *auto-async-byte-compile*") popwin:special-display-config)
(push '("*quickrun*") popwin:special-display-config)
(setq popwin:close-popup-window-timer-interval 0.5)
