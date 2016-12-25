(use-package smartparens-config
  :ensure smartparens
  :init
  (smartparens-global-mode))

(use-package avy
  :ensure t
  :commands (avy-goto-word-1))
(winner-mode t)

(provide 'init-util)
