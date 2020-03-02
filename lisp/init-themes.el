;;; init-themes.el --- Set up themes

(straight-use-package 'doom-themes)

;; Don't prompt to confirm theme safety. This avoids problems with
;; first-time startup on Emacs > 26.3.
(setq custom-safe-themes t)

(setq-default custom-enabled-themes '(doom-one-light))

(defun ak/reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'ak/reapply-themes)

;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light-theme ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(doom-one-light))
  (ak/reapply-themes))

(defun dark-theme ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(doom-one))
  (ak/reapply-themes))

(with-eval-after-load 'doom-themes
  (setq dooom-themes-enable-bold t
	doom-themes-enable-italic t))

(doom-themes-visual-bell-config)
(doom-themes-org-config)

(provide 'init-themes)
