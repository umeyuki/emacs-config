(when (require 'yasnippet nil t)
  (setq yas-trigger-key "TAB")
  (yas-global-mode 1)
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets/" ;; 作成するスニペットはここに入る
          ))
  
  ;; コメントやリテラルではスニペットを展開しない
  (setq yas-buffer-local-condition
        '(or (not (or (string= "font-lock-comment-face"
                               (get-char-property (point) 'face))
                      (string= "font-lock-string-face"
                               (get-char-property (point) 'face))))
             '(require-snippet-condition . force-in-comment)))

  (when (require 'helm-c-yasnippet nil t)
    (setq helm-c-yas-space-match-any-greedy t) 
    (global-set-key (kbd "C-l y") 'helm-c-yas-complete)
    )
  )
