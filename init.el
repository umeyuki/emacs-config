(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

; elpa
;(require 'package)

; package.elでelispを入れるdirectoryの設定
;(setq package-user-dir "~/.emacs.d/elpa/")

; MELPAを追加
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;(package-initialize)

; el-get
(let*
    ((user-emacs-directory
      (substring (or load-file-name "~/.emacs.d/init.el") 0 -7))
     (conf-list (list
                 "el-get.el"
                 "package.el"
                 "exec-path.el"
                 "misc.el"
                 "editing.el"
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
                 "dayone.el"
                 "org.el"
                )))
  (dolist (conf conf-list)
    (load (concat user-emacs-directory "conf/" conf))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(ag-reuse-buffers (quote nil))
 '(ag-reuse-window (quote nil))
 '(anzu-deactivate-region t)
 '(anzu-minimum-input-length 3)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(cperl-close-paren-offset -4)
 '(cperl-indent-parens-as-block t)
 '(cperl-indent-subs-specially nil)
 '(custom-safe-themes (quote ("551f0e9d6bfc26370c91a0aead8d6579cdedc70c2453cb5ef87a90de51101691" "af4cfe7f2de40f19e0798d46057aae0bccfbc87a85a2d4100339eaf91a1f202a" "0c5204945ca5cdf119390fe7f0b375e8d921e92076b416f6615bbe1bd5d80c88" "f34690262d1506627de39945e0bc2c7c47ece167edea85851bab380048dc8580" "b42cf9ee9e59c3aec585fff1ce35acf50259d8b59f3047e57df0fa38516aa335" "3a0248176bf115cd53e0f15e30bb338b55e2a09f1f9508794fcd3c623725c8bd" "234249a92c2cf7b61223d9f83e1d9eefcd80fcf6b7a5e9ca03dc9d3f1b122ae2" "f211f8db2328fb031908c9496582e7de2ae8abd5f59a27b4c1218720a7d11803" "8016855a07f289a6b2deb248e192633dca0165f07ee5d51f9ba982ec2c36797d" "0f0adcd1352b15a622afd48fcff8232169aac4b5966841e506f815f81dac44ea" "6c57adb4d3da69cfb559e103e555905c9eec48616104e217502d0a372e63dcea" "2c73700ef9c2c3aacaf4b65a7751b8627b95a1fd8cebed8aa199f2afb089a85f" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(helm-ff-auto-update-initial-value nil)
 '(menu-bar-mode nil)
 '(ns-alternate-modifier (quote alt))
 '(ns-command-modifier (quote meta))
 '(org-agenda-files nil)
 '(rspec-use-rake-when-possible nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
