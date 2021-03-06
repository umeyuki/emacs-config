(require 'auto-complete-config)
(ac-config-default)

;; 候補メニューは0.8秒までださない
(setq ac-auto-show-menu 0.8)

;; メニュー専用のキーマップを使う (for C-p/C-n)
(setq ac-use-menu-map t)
(setq ac-auto-start nil)
(define-key ac-mode-map (kbd "C-l C-a") 'auto-complete)
