(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

(display-time-mode 1) 
(setq display-time-24hr-format t)

;; ===== Set the highlight current line minor mode ===== 
;; In every buffer, the line which contains the cursor will be fully
;; highlighted

;;(global-hl-line-mode 1)

(setq column-number-mode t)
(global-linum-mode 1)

(tool-bar-mode 0) 

;; 实现全屏效果，快捷键为F11
(global-set-key [f11] 'my-fullscreen) 
(defun my-fullscreen ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

(setq auto-image-file-mode t)
;;让 Emacs 可以直接打开和显示图片。


(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))


;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

(provide 'init-self)