(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/color-theme"))

(require 'color-theme)
(color-theme-initialize)
;(setq color-theme-is-global t)


(provide 'init-colortheme)