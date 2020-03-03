;;; init-yasnippet.el --- snippets

(straight-use-package 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))
(with-eval-after-load 'yasnippet
  (yas-reload-all))

(provide 'init-yasnippet)
