; elpa
(require 'package)

;; package.elでelispを入れるdirectoryの設定
(setq package-user-dir "~/.emacs.d/elpa/")

;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

; el-get
(let*
    ((user-emacs-directory
      (substring (or load-file-name "~/.emacs.d/init.el") 0 -7))
     (conf-list (list
                 "el-get.el"
                 "misc.el"
                 "window.el"
                 "path.el"
                 "git-gutter.el"
                 "helm.el"
                 "yasnippet.el"
                 "auto-complete.el"
                 "emmet-mode.el"
                 "ruby-mode.el"
                 "perl-mode.el"
                 "perl-completion.el"
                 "perl-flymake.el"
                 "popwin.el"
                 "pbcopy.el"
                 "quickrun.el"
                 "helm-project.el"
                 "server.el"
                 "dash.el"
                 "color-theme.el"
                )))
  (dolist (conf conf-list)
    (load (concat user-emacs-directory "conf/" conf))))

