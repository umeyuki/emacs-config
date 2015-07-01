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


;; (require 'helm-gtags)
;; (add-hook 'go-mode-hook (lambda () (helm-gtags-mode)))
;; (add-hook 'ruby-mode-hook (lambda () (helm-gtags-mode)))
;; (add-hook 'gfm-mode-hook (lambda () (helm-gtags-mode)))
;; (add-hook 'js2-mode-hook (lambda () (helm-gtags-mode)))

;; ;; customize
;; (custom-set-variables
;;  '(helm-gtags-path-style 'relative)
;;  '(helm-gtags-ignore-case t)
;;  '(helm-gtags-auto-update t))

;; ;; key bindings
;; (eval-after-load "helm-gtags"
;;   '(progn
;;      (define-key helm-gtags-mode-map (kbd "M-g") 'helm-gtags-dwim)
;;      (define-key helm-gtags-mode-map (kbd "M-f") 'helm-gtags-find-tag)
;;      (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
;;      (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
;;      (define-key helm-gtags-mode-map (kbd "M-p") 'helm-gtags-previous-history)
;;      (define-key helm-gtags-mode-map (kbd "M-n") 'helm-gtags-next-history)
;;      (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))
