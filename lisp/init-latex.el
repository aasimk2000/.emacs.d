;;; init-latex.el --- latex config

(straight-use-package 'auctex)

(add-hook 'LaTeX-mode-hook #'yas-minor-mode)
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t
		  indent-line-function 'tab-to-tab-stop
		  tab-width 4
		  electric-indent-mode nil)))

(provide 'init-latex)
