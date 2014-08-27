;;(require 'fill-column-indicator)
(require 'highlight-80+)


;;(setq fci-rule-width 1)
;;(setq fci-rule-column 80)
;;(setq fci-rule-color "yellow")
;;(add-hook 'c-mode-hook 'fci-mode)
;;(add-hook 'c++-mode-hook 'fci-mode)
(add-hook 'c-mode-hook 'highlight-80+-mode)
(add-hook 'c++-mode-hook 'highlight-80+-mode)


(provide 'init-fci)
