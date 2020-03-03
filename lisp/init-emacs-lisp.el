;;; init-emacs-lisp.el --- emacs-lisp config

(setq flycheck-emacs-lisp-load-path 'inherit)

(add-hook 'emacs-lisp-mode-hook 'company-mode)

(provide 'init-emacs-lisp)
