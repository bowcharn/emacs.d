;; use GNU GLOBAL with ggtags( verion for emacs)

(require 'ggtags)
(add-hook 'c-mode-common-hook
	(lambda ()
		(when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
			(ggtags-mode 1))))


(defun gtags-root-dir ()
	"Returns GTAGS root directory or nil if doesn't exist."
	(with-temp-buffer
		(if (zerop (call-process "global" nil t nil "-pr"))
			(buffer-substring (point-min) (1- (point-max)))
			nil)))


(defun gtags-update ()
	"Make GTAGS incremental update"
	(call-process "global" nil nil nil "-u"))

(defun gtags-update-hook ()
	(when (gtags-root-dir)
		(gtags-update)))

(add-hook 'after-save-hook #'gtags-update-hook)

(defun gtags-update-single(filename)  
	"Update Gtags database for changes in a single file"
	(interactive)
	(start-process "update-gtags" "update-gtags" "bash" "-c" (concat "cd " (gtags-root-dir) " ; gtags --single-update " filename )))

(defun gtags-update-current-file()
	(interactive)
	(defvar filename)
	(setq filename (replace-regexp-in-string (gtags-root-dir) "." (buffer-file-name (current-buffer))))
	(gtags-update-single filename)
	(message "Gtags updated for %s" filename))

(defun gtags-update-hook()
	"Update GTAGS file incrementally upon saving a file"
	(when ggtags-mode
		(when (gtags-root-dir)
			(gtags-update-current-file))))

(add-hook 'after-save-hook 'gtags-update-hook)


(provide 'init-ggtags)
