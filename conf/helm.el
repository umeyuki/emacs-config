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

(require 'helm-files)
(require 'helm-ag)

(global-set-key (kbd "C-l C-g") 'helm-ag)
(global-set-key (kbd "C-l ,") 'helm-ag-pop-stack)
(global-set-key (kbd "C-M-,") 'helm-ag-this-file)


(require 'helm-gtags)
(add-hook 'go-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'python-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'ruby-mode-hook (lambda () (helm-gtags-mode)))
(setq helm-gtags-path-style 'root)
(setq helm-gtags-auto-update t)
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-g") 'helm-gtags-dwim)
             (local-set-key (kbd "M-s") 'helm-gtags-show-stack)
             (local-set-key (kbd "M-p") 'helm-gtags-previous-history)
             (local-set-key (kbd "M-n") 'helm-gtags-next-history)))

;; (require 'helm-config)
;; (require 'helm-gtags)

;; (add-hook 'ruby-mode-hook 'helm-gtags-mode)
;; (add-hook 'java-mode-hook 'helm-gtags-mode)

;; ;; key bindings
;; (add-hook 'helm-gtags-mode-hook
;;           '(lambda ()
;;               (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
;;               (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
;;               (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
;;               (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))
