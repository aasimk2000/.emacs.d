;;; init-general.el --- Initializes general and which key

(straight-use-package 'general)
(setq general-override-states '(insert
				emacs
				hybrid
				normal
				visual
				motion
				replace
				operator))
(general-create-definer ak/leader
  :prefix "SPC")

(straight-use-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(setq which-key-idle-delay 0.4)
(diminish 'which-key-mode)

(ak/leader 'normal 'override
  "." '(find-file :wk "Find file")
  "," '(switch-to-buffer :wk "Switch buffer")
  "SPC" '(execute-extended-command :wk "M-x"))

(provide 'init-general)
