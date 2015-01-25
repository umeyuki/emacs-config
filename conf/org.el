(setq org-directory (concat (getenv "HOME") "/Dropbox/Write/"))
(setq org-default-notes-file (concat org-directory "capture.org"))

(setq org-agenda-files (list org-directory))
;; (setq org-agenda-files  (file-expand-wildcards (concat org-directory "/*.org")))

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c r") 'org-capture)
(define-key global-map (kbd "C-c C-q") 'org-agenda-todo)
(define-key global-map (kbd "C-c C-n") 'org-todo)



;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ


(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)"  "|" "NEXT(n)" "DONE(d)" "SOMEDAY(s)")))
;; DONEの時刻を記録
(setq org-log-done 'time)
