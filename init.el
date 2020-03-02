;;; init.el -- My Emacs configuration

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(setq ring-bell-function 'ignore
      frame-resize-pixelwise t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(column-number-mode +1)

(setq scroll-margin 0
      scroll-conservatively 10000
      scroll-preserve-screen-position t
      auto-window-vscroll nil)

(setq inhibit-startup-screen t
      initial-major-mode 'text-mode)

(setq line-spacing 1)
(set-frame-font "Menlo-12" t t)
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 95))

(setq show-paren-delay 0)
(show-paren-mode +1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns x))
	    (exec-path-from-shell-initialize)))

(use-package diminish
  :demand t)

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

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(setq display-line-numbers-type 'relative)

(provide 'init)

