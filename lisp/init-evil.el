;;; init-evil.el --- Vim keybindings in emacs

(setq evil-want-C-u-scroll t
      evil-want-keybinding nil)

(straight-use-package 'evil)
(add-hook 'after-init-hook 'evil-mode)
(with-eval-after-load 'undo-tree
  (diminish 'undo-tree-mode))


(straight-use-package 'evil-collection)
(evil-collection-init)

(straight-use-package 'evil-commentary)
(evil-commentary-mode +1)
(diminish 'evil-commentary-mode)

(provide 'init-evil)
