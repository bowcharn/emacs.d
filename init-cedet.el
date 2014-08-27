(load-file (expand-file-name "~/.emacs.d/plugins/cedet/common/cedet.elc"))
(setq global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(setq global-srecode-minor-mode 1)            ; Enable template insertion menu




(setq semantic-mode 1)

;;; semantic setup
;; (semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)


;;; gcc setup
(require 'semantic-gcc)

;;; smart complitions setup
(require 'semantic-ia)

 (setq semanticdb-project-roots (list (expand-file-name "./")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"
        "/usr/local/c++/4.8/include" "/usr/local/c++/4.8/include/bits" "."))

(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

(global-set-key [f12] 'semantic-ia-fast-jump)

(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)
(setq semantic-idle-completions-mode 1)



(provide 'init-cedet)