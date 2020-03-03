;;; init-c.el --- Config for C languages

; (add-hook 'c-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'lsp)

(with-eval-after-load 'lsp-mode
  (setq lsp-clients-clangd-executable "/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clangd"))

(provide 'init-c)
