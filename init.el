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
                 "exec-path.el"
                 "misc.el"                                  
                 "editting.el"
                 "window.el"
                 "git-gutter.el"
                 "helm.el"
                 "yasnippet.el"
                 "auto-complete.el"
                 "emmet.el"
                 "js.el"
                 "ruby.el"
                 "perl.el"
                 "popwin.el"
                 "pbcopy.el"
                 "quickrun.el"
                 "helm-project.el"
                 "dash.el"
                 "color-theme.el"
                 "server.el"
                )))
  (dolist (conf conf-list)
    (load (concat user-emacs-directory "conf/" conf))))
