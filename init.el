; el-get
(let*
    ((user-emacs-directory
      (substring (or load-file-name "~/.emacs.d/init.el") 0 -7))
     (conf-list (list
                 "el-get.el"
                 "pbcopy.el"
                )))
  (dolist (conf conf-list)
    (load (concat user-emacs-directory "conf/" conf))))
