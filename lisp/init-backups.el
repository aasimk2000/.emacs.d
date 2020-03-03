;;; init-backups.el --- Backup and autosave config


(let ((backup-directory (expand-file-name "backups/" user-emacs-directory))
      (auto-saves-directory (expand-file-name "autosaves/" user-emacs-directory)))
  ;; Make directory if it doesn't exist
  (dolist (dir (list backup-directory auto-saves-directory))
    (when (not (file-directory-p dir))
      (make-directory dir t)))

  (setq backup-directory-alist `(("." . ,backup-directory))
	auto-save-file-name-transforms `((".*" ,auto-saves-directory t))
        auto-save-list-file-prefix (concat auto-saves-directory ".saves-")
	tramp-backup-directory-alist `((".*" . ,backup-directory))
        tramp-auto-save-directory auto-saves-directory))

(setq backup-by-copying t    ; Don't delink hardlinks                           
      delete-old-versions t  ; Clean up the backups                             
      version-control t      ; Use version numbers on backups,                  
      kept-new-versions 5    ; keep some new versions                           
      kept-old-versions 2)   ; and some old ones, too  

(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose t
      auto-revert-interval 2
      auto-revert-check-vc-info t)

(provide 'init-backups)
