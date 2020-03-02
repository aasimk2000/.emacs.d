;;; init-gui-frames.el --- Fixes GUI

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t
      initial-major-mode 'text-mode)

(setq ring-bell-function 'ignore
      frame-resize-pixelwise t)

(tool-bar-mode -1)
(set-scroll-bar-mode nil)
(tooltip-mode -1)
(column-number-mode +1)

(set-frame-font "Menlo-12" t t)
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 95))

(provide 'init-gui-frames)
