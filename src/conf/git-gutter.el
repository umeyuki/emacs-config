;;git-gutter
(require `git-gutter)
 (global-git-gutter-mode +1)
(setq git-gutter:separator-sign "|")
(set-face-foreground 'git-gutter:separator "yellow")
(add-hook 'cperl-mode-hook 'git-gutter-mode)
(add-hook 'js2-mode-hook   'git-gutter-mode)
(add-hook 'php-mode-hook   'git-gutter-mode)
(add-hook 'ruby-mode-hook  'git-gutter-mode)

(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

