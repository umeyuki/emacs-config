(require 'expand-region)
(require 'multiple-cursors)
(require 'smartrep)

(global-set-key (kbd "C-l C-e") 'er/expand-region)
(global-set-key (kbd "C-l C-c") 'er/contract-region)
(global-set-key (kbd "C-l C-j") 'mc/edit-lines)

(smartrep-define-key
 global-map "C-l" '(
                    ("n" . 'mc/mark-next-like-this)
                    ("p" . 'mc/mark-previous-like-this)
                    (";" . 'mc/mark-all-like-this)
                    ))

;; (when (and (executable-find "cmigemo")
;;            (require 'migemo nil t))
;;   (setq migemo-options '("-q" "--emacs"))

;;   (setq migemo-user-dictionary nil)
;;   (setq migemo-regex-dictionary nil)
;;   (setq migemo-coding-system 'utf-8-unix)
;;   (load-library "migemo")
;;   (migemo-init)
;; )
;; (setq migemo-command "cmigemo")
;; (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

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

;; インデント幅を2にする
;; コンパイルは compass watchで行うので自動コンパイルをオフ
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
(setq open-junk-file-format ( concat (getenv "HOME") "/Dropbox/.junk/%Y/%m/%Y-%m-%d-%H%M%S."))
(global-set-key (kbd "C-c C-j") 'open-junk-file)
