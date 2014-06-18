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
(define-key global-map (kbd "C-M-o") 'helm-occur)
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
(define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)

;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))

;; C-hでバックスペースと同じように文字を削除
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
;; ;;TABで任意補完。選択肢が出てきたらC-nやC-pで上下移動してから決定することも可能
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
