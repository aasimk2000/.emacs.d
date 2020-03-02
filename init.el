;;; init.el -- My Emacs configuration -*- lexical-binding: t -*-

;; Adjust garbage collection thresholds during startup, and thereafter
(setq debug-on-error t)
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;; Bootstrap config
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-straight)
(require 'init-exec-path)

(straight-use-package 'diminish)

(require 'init-themes)
(require 'init-scroll)
(require 'init-gui-frames)

(setq show-paren-delay 0)
(show-paren-mode +1)


(global-auto-revert-mode +1)
(setq auto-revert-interval 2
      auto-revert-check-vc-info t
      global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(use-package evil
  :diminish undo-tree-mode
  :init
  (setq evil-want-C-u-scroll t
	evil-want-keybinding nil)
  :hook (after-init . evil-mode)
  :preface
  (defun ak/save-and-kill-this-buffer ()
    (interactive)
    (save-buffer)
    (kill-this-buffer))
  :config
  (with-eval-after-load 'evil-maps ; avoid conflict with company tooltip selection
    (define-key evil-insert-state-map (kbd "C-n") nil)
    (define-key evil-insert-state-map (kbd "C-p") nil))
  (evil-ex-define-cmd "q" #'kill-this-buffer)
  (evil-ex-define-cmd "wq" #'ak/save-and-kill-this-buffer))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package evil-commentary
  :after evil
  :diminish
  :config (evil-commentary-mode +1))

(add-hook 'prog-mode-hook #'electric-pair-mode)

(use-package general
  :init
  (setq general-override-states '(insert
				  emacs
				  hybrid
				  normal
				  visual
				  motion
				  replace
				  operator))
  :config
  (general-create-definer ak/leader
    :prefix "SPC"))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode +1)
  (setq which-key-idle-delay 0.4))

(ak/leader 'normal 'override
  "." '(find-file :wk "Find file")
  "," '(switch-to-buffer :wk "Switch buffer")
  "SPC" '(execute-extended-command :wk "M-x"))


(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(setq display-line-numbers-type 'relative)

(provide 'init)

