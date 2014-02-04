(setq dayone-dir (concat (getenv "HOME") "/Dropbox/Apps/Day One/Journal.dayone/entries/"))
(setq dayone-timezone "Asia/Tokyo")

(global-set-key (kbd "C-l C-n") 'dayone-add-note)
(global-set-key (kbd "C-l C-k") 'dayone-add-note-with-tag)

