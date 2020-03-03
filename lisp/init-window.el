;;; init-window.el --- Configures windowing

(ak/leader 'normal 'override
  "w" '(:ignore t :wk "Window"))

(ak/leader 'normal 'override
  "wl" '(windmove-right :wk "Windmove Right")
  "wh" '(windmove-left :wk "Windmove Left")
  "wj" '(windmove-down :wk "Windmove Down")
  "wk" '(windmove-up :wk "Windmove Up"))

(straight-use-package 'ace-window)

(setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n))
(ak/leader 'normal 'override
  "TAB" '(ace-window :wk "Other Window"))

(ak/leader 'normal 'override
  "wd" '(ace-delete-window :wk "Ace-Delete Window")
  "wD" '(delete-window :wk "Delete Current Window")
  "wM" '(ace-swap-window :wk "Swap Window"))

(provide 'init-window)
