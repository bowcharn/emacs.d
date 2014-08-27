;;;use highlight-parentheses to highlight brackets/braces

(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
 highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(provide 'init-highlight-parentheses)