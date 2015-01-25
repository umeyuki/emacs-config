(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq ruby-indent-level tab-width)
             (define-key ruby-mode-map [return] 'ruby-reindent-then-newline-and-indent)
             (setq ruby-deep-indent-paren-style nil)
             ;; (electric-pair-mode nil)
             (electric-indent-mode t)
             (electric-layout-mode t)
             ))

; slim-mode
(require 'slim-mode)

; rspec-mode
(require 'rspec-mode)
(custom-set-variables '(rspec-use-rake-flag nil))
(setq ruby-insert-encoding-magic-comment nil)
