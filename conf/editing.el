(define-key global-map (kbd "C-c m") 'toggle-input-method)


(require 'expand-region)
(require 'multiple-cursors)
(require 'smartrep)
(require 'nginx-mode)
;;(add-to-list 'auto-mode-alist '("nginx\\.conf$" . nginx-mode))
(add-hook 'conf-mode-hook
          (lambda ()
            (when (string-match "nginx" (buffer-file-name))
                            (nginx-mode))))

(define-key global-map (kbd "C-c q") 'quoted-insert)
(global-set-key (kbd "C-l C-e") 'er/expand-region)
(global-set-key (kbd "C-l C-c") 'er/contract-region)
(global-set-key (kbd "C-l C-j") 'mc/edit-lines)

(smartrep-define-key
 global-map "C-l" '(
                    ("n" . 'mc/mark-next-like-this)
                    ("p" . 'mc/mark-previous-like-this)
                    (";" . 'mc/mark-all-like-this)
                    ))

(setq-default tab-width 2 indent-tabs-mode nil)
(setq create-lockfiles nil)
(require 'anzu)
(global-anzu-mode +1)
(custom-set-variables
;; '(anzu-use-migemo t)
 '(anzu-search-threshold 1000)
 '(anzu-minimum-input-length 3)
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000))

(global-set-key (kbd "C-l r") 'anzu-query-replace)
(global-set-key (kbd "C-l R") 'anzu-query-replace-regexp)

;; scss
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;; indent 2
(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)
   )
  )
(add-hook 'scss-mode-hook
          '(lambda() (scss-custom)))

;; open-junk
(require 'open-junk-file)
(setq open-junk-file-format ( concat (getenv "HOME") "/Dropbox/Write/%Y%m%d.md"))
(global-set-key (kbd "C-c j") 'open-junk-file)

(require 'em-glob)
(defvar junk-file-dir "~/Dropbox/Write/")
(defvar junk-file-list
  (reverse (eshell-extended-glob (concat
                                  (file-name-as-directory junk-file-dir)
                                  "*"))))
(defvar helm-c-source-junk-files
  '((name . "Notes")
    (candidates . junk-file-list)
    (type . file)))
(defun helm-open-junk-file ()
  (interactive)
  (helm-other-buffer 'helm-c-source-junk-files "*helm for junk file"))
(global-set-key (kbd "C-c C-j") 'open-junk-file)
(global-set-key (kbd "C-c C-h") 'helm-open-junk-file)

; history like browser
(require 'historyf)
(global-set-key (kbd "C-l C-b") 'historyf-back)
(global-set-key (kbd "C-l C-f") 'historyf-forward)

(require 'all-ext)
; utf08
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;smartparens
;; (require 'smartparens-config)
;; (smartparens-global-mode t)

;; ag(The Silver Searcher)コマンドを以下からインストール:
;;     http://github.com/ggreer/the_silver_searcher#installation
;; ag.elとwgrep-ag.elをlist-packageでMelpaなどからインストールしておく
(require 'ag)
(custom-set-variables
 '(ag-highlight-search t)  ; 検索結果の中の検索語をハイライトする
 '(ag-reuse-window 'nil)   ; 現在のウィンドウを検索結果表示に使う
 '(ag-reuse-buffers 'nil)) ; 現在のバッファを検索結果表示に使う
(require 'wgrep-ag)
(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
;; agの検索結果バッファで"r"で編集モードに。
;; C-x C-sで保存して終了、C-x C-kで保存せずに終了
(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)
;; キーバインドを適当につけておくと便利。"\C-xg"とか
(global-set-key [(super m)] 'ag)
;; ag開いたらagのバッファに移動するには以下をつかう
(defun my/filter (condp lst)
  (delq nil
        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))
(defun my/get-buffer-window-list-regexp (regexp)
  "Return list of windows whose buffer name matches regexp."
  (my/filter #'(lambda (window)
              (string-match regexp
               (buffer-name (window-buffer window))))
          (window-list)))
(global-set-key [(super m)]
                #'(lambda ()
                    (interactive)
                    (call-interactively 'ag)
                    (select-window ; select ag buffer
                     (car (my/get-buffer-window-list-regexp "^\\*ag ")))))

;; create backup file in ~/.emacs.d/backup
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;; create auto-save file in ~/.emacs.d/backup
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup/") t)))


(setq auto-mode-alist (cons '("\\.md" . gfm-mode) auto-mode-alist))

;; remove the unnecessary trailing spaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

; auto reload
(global-auto-revert-mode 1)
