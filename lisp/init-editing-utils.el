;;; init-editing-utils.el --- Stuff to improve editing

(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'electric-indent-mode)

(setq display-line-numbers-width 3)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-linu-numbers-type 'relative)

(add-hook 'prog-mode-hook 'hl-line-mode)

(add-hook 'after-init-hook 'show-paren-mode)

(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose t
      auto-revert-interval 2
      auto-revert-check-vc-info t)

(setq column-number-mode t)

(setq blink-cursor-interval 0.4)

(provide 'init-editing-utils)
