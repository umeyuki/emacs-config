;; unique buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "[^*]+*")

;; (require 'color-moccur)
;; (require 'moccur-edit)
;; (define-key global-map (kbd "C-l o") 'moccur)
;; (define-key global-map (kbd "C-l g") 'moccur-grep)

;; ; auto-save
;; (require 'auto-save-buffers)
;; (run-with-idle-timer 180 t 'auto-save-buffers)

;; ; xterm-mouse-mode
;; (unless (fboundp 'track-mouse)
;;     (defun track-mouse (e)))
;; (xterm-mouse-mode t)
;; (require 'mouse)
;; (require 'mwheel)
;; (mouse-wheel-mode t)

;; ; which-function-mode
;; (which-function-mode 1)

;; ;; mode-line  color
;; (set-face-foreground 'mode-line "#000000")
;; ;; mode-line background color
;; (set-face-background 'mode-line "LightGray")

