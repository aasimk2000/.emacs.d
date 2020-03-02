;;; init-scroll --- Makes scrolling better

(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)
				    ((control))))

(dolist (multiple '("" "double-" "triple-"))
  (dolist (direction '("right" "left"))
    (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">"))
		    'ignore)))

(provide 'init-scroll)
