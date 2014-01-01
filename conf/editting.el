(require 'expand-region)
(require 'multiple-cursors)
(require 'smartrep)

(global-set-key (kbd "C-l C-e") 'er/expand-region)
(global-set-key (kbd "C-l C-c") 'er/contract-region)

(global-set-key (kbd "C-l C-j") 'mc/edit-lines)
(smartrep-define-key
 global-map "C-l" '(("C-n" . 'mc/mark-next-like-this)
                    ("C-p" . 'mc/mark-previous-like-this)
                    (";"   . 'mc/mark-all-like-this)))
