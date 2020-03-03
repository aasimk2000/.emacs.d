;;; init-flycheck --- Adds linting

(straight-use-package 'flycheck)

(straight-use-package 'flycheck-color-mode-line)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(provide 'init-flycheck)
