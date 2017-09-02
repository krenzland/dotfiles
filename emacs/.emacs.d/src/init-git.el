(use-package magit
  :ensure t
  :commands magit-status
  :bind ("C-x g" . magit-status))

(setq magit-completing-read-function 'ivy-completing-read)

(use-package evil-magit
  :ensure t)

(provide 'init-git)
