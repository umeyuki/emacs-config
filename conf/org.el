(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c d") 'org-todo)


;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory (concat (getenv "HOME") "/Dropbox/Write/"))
;; ;; org-default-notes-fileのファイル名
;; (setq org-default-notes-file "notes.org")
(setq org-agenda-files (list org-directory)) 

(define-key global-map (kbd "C-c r") 'org-capture)
(define-key global-map (kbd "C-c C-q") 'org-todo)
