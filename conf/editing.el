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

(setq-default tab-width 4 indent-tabs-mode nil)
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

(add-hook 'before-save-hook 'delete-trailing-whitespace)

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
(setq open-junk-file-format ( concat (getenv "HOME") "/Dropbox/Write/%Y%m%d-%H%M%S_"))
(global-set-key (kbd "C-c j") 'open-junk-file)

(require 'em-glob)
(defvar junk-file-dir "~/Dropbox/Write/")
(defvar junk-file-list
  (reverse (eshell-extended-glob (concat
                                  (file-name-as-directory junk-file-dir)
                                  "*"))))
(defvar helm-c-source-junk-files
  '((name . "Junk Files")
    (candidates . junk-file-list)
    (type . file)))
(defun helm-open-junk-file ()
  (interactive)
  (helm-other-buffer 'helm-c-source-junk-files "*helm for junk file"))
(global-set-key (kbd "C-c j") 'open-junk-file)
(global-set-key (kbd "C-c h") 'helm-open-junk-file)

;; howm
(autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)
(global-set-key (kbd "C-l C-h") 'howm-menu)
(setq howm-menu-lang 'ja)
(setq howm-directory ( concat (getenv "HOME") "/Dropbox/Write/"))
;; (setq howm-view-use-grep t)
;; (defadvice howm-list-migemo (around use-fake-grep activate)
;;   (let ((howm-view-use-grep nil))
;;     ad-do-it))

;; nginx-mode
(require 'nginx-mode)
;;(add-to-list 'auto-mode-alist '("nginx\\.conf$" . nginx-mode))
(add-hook 'conf-mode-hook
          (lambda ()
            (when (string-match "nginx" (buffer-file-name))
                            (nginx-mode))))

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
(require 'smartparens-config)
(smartparens-global-mode t)
