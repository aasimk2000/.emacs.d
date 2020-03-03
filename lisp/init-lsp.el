;;; init-lsp.el --- LSP mode

(straight-use-package 'lsp-mode)
(with-eval-after-load 'lsp-mode
  (setq lsp-log-io t))

(provide 'init-lsp)
