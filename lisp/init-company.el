;;; init-company.el --- Auto complete

(straight-use-package 'company)
(with-eval-after-load 'company
  (setq company-idle-delay 0.2
	company-selection-wrap-around t)
  (company-tng-configure-default)
  (define-key company-active-map (kbd "RET") 'company-complete-selection))

(provide 'init-company)
