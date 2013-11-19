(require 'auto-complete-config)
(ac-config-default)

;; 候補メニューは0.8秒までださない
(setq ac-auto-show-menu 0.8)

;; メニュー専用のキーマップを使う (for C-p/C-n)
(setq ac-use-menu-map t)
;; (define-key ac-menu-map (kbd "C-n")   'ac-next)
;; (define-key ac-menu-map (kbd "C-p")   'ac-previous)
;; (define-key ac-menu-map (kbd "M-TAB") nil)
