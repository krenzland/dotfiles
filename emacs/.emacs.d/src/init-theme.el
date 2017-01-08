(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (color-theme-sanityinc-tomorrow-day))

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/theme 'light)
  :config
  (smart-mode-line-enable))

(provide 'init-theme)
