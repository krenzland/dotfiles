(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t))

(use-package smart-mode-line
  :ensure t
  :config
  (require 'smart-mode-line)
  (smart-mode-line-enable))

(provide 'init-theme)
