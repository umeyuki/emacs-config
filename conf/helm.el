;; helmでc-h バックスペース
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)
     ))
(helm-mode 1)

;; find-fileではhelmを使わない
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

;; replace commands
(define-key global-map (kbd "C-x f") 'helm-for-files)
(define-key global-map (kbd "C-x f") 'helm-for-files)
(define-key global-map (kbd "M-y")   'helm-show-kill-ring)
(define-key global-map (kbd "M-x")   'helm-M-x)





