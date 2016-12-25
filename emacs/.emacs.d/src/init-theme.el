(use-package solarized-theme
  :ensure t)
(load-theme 'solarized-light t)

(use-package smart-mode-line
  :ensure t
  :config
  (progn
    (require 'smart-mode-line)
    (smart-mode-line-enable)))

(provide 'init-theme)
