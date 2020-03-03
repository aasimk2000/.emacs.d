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
(require 'init-evil)
(require 'init-general)

(require 'init-editing-utils)
(require 'init-flycheck)
(require 'init-company)
(require 'init-yasnippet)

(require 'init-window)

(require 'init-lsp)

(require 'init-emacs-lisp)
(require 'init-latex)
(require 'init-c)

(provide 'init)

