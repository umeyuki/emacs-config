(scroll-bar-mode -1)

;; 大文字・小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

;; exchange alt <-> meta
(custom-set-variables
   '(ns-alternate-modifier 'alt)
   '(ns-command-modifier   'meta))

;; C-lをプレフィックスキーにする
(global-set-key (kbd "C-l") nil)
(global-set-key (kbd "C-l C-l") 'recenter-top-bottom)

(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-o") 'other-window)
(define-key global-map (kbd "C-\\") 'undo)
(define-key global-map (kbd "C-l \\") 'indent-region)

;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; C-mにnewline-and-indentを割り当てる。
;; 先ほどとは異なりglobal-set-keyを利用
(global-set-key (kbd "C-j") 'newline-and-indent)

;; mark-sexp
(define-key global-map (kbd "C-l C-p") 'mark-sexp)

;; (define-key global-map (kbd "C-l s") 'eshell)

;; unique buffer 同じファイル名の時親ディレクトリを表示
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "[^*]+*")

;cua-mode
(cua-mode -1)
(setq cua-enable-cua-keys nil)
(define-key global-map (kbd "C-l c") 'cua-mode)
(define-key cua-global-keymap (kbd "C-@") 'cua-set-rectangle-mark)
(setq cua-enable-cua-keys nil)

;; isearch
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;;undo redo
(when (require 'redo+ nil t)
  (global-set-key (kbd "C-M-\\") 'redo)
  )

;; goto-line
(define-key ctl-x-map "l" 'goto-line)


;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)

;; バックアップしない
(setq make-backup-files nil)

;; 自動セーブしない
(setq auto-save-default nil)

;; C-hでバックスペース
(global-set-key "\C-h" 'delete-backward-char)

;; リージョンをC-hで削除
(delete-selection-mode 1)

;; インデントはスペースで
(setq-default indent-tabss-mode nil)

;; タブ幅は2
(setq-default tab-width 2)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)


;; add +x to saving file
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
