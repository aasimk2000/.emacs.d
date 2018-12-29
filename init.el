;;; init.el -- My Emacs configuration

;;; Commentary:

;; Loads Org file and some basic setup

;;; Code:

(let ((gc-cons-threshold most-positive-fixnum))

  ;; Set repositories
  (require 'package)
  (setq-default
   load-prefer-newer t
   package-enamble-at-startup nil)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (package-initialize)

  ;; Install dependencies
  (unless (and (package-installed-p 'delight)
	       (package-installed-p 'use-package))
    (package-refresh-contents)
    (package-install 'delight t)
    (package-install 'use-package t))
  (setq-default
   use-package-always-defer t
   use-package-always-ensure t)

  ;; Use latest Org mode
  (use-package org
    :ensure org-plus-contrib)

  (org-babel-load-file (expand-file-name "bootstrap.org" user-emacs-directory))

  (garbage-collect))

;;; init.el ends here
