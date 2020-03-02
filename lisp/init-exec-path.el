;;; init-exec-path.el --- Sets up exec path

(straight-use-package 'exec-path-from-shell)

(when (or (memq window-system '(mac ns x))
          (unless (memq system-type '(ms-dos windows-nt))
            (daemonp)))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
