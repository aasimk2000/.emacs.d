;;; init.el -- My Emacs configuration

;; Setup Packages
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t))

(setq ring-bell-function 'ignore
      frame-resize-pixelwise t)

(tool-bar-mode -1)
(column-number-mode +1)

(setq scroll-margin 0
      scroll-conservatively 10000
      scroll-preserve-screen-position t
      auto-window-vscroll nil)

(setq inhibit-startup-screen t
      initial-major-mode 'text-mode)

(setq line-spacing 1)
(set-frame-font "Menlo-12" t t)

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
				  operator
				  replace))
  :config
  (general-create-definer ak/leader
    :prefix "SPC")
  (ak/leader 'normal 'override
    "SPC" 'execute-extended-command))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode +1)
  (setq which-key-idle-delay 0.4))

(ak/leader 'normal 'override
  "." '(find-file :wk "Find file")
  "," '(switch-to-buffer :wk "Switch buffer"))

(provide 'init)
