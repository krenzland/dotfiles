(use-package magit
  :ensure t
  :commands magit-status
  :bind ("C-x g" . magit-status))

(use-package evil-magit
  :ensure t)
(provide 'init-git)
