(require 'emmet-mode)
(setq emmet-move-cursor-between-quotes t) ;;
(add-hook 'emmet-mode-hook
          (setq emmet-indentation 2)
          (define-key emmet-mode-keymap (kbd "C-l q") 'emmet-expand-line)
          (define-key emmet-mode-keymap (kbd "C-l C-j") 'emmet-expand-yas)
          )
(add-hook 'sgml-mode-hook 'emmet-mode) ;; マークアップモードで自動的に emmet-mode をたちあげる
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil))
