(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq ruby-indent-level tab-width)
             (define-key ruby-mode-map [return] 'ruby-reindent-then-newline-and-indent)             
             (setq ruby-deep-indent-paren-style nil)
             (electric-pair-mode nil)
             (electric-indent-mode t)
             (electric-layout-mode t)
             ;; (setq electric-pair-pairs '(
             ;;                             (?\| . ?\|)
             ;;                             ))
             ))

; slim-mode
(require 'slim-mode)
