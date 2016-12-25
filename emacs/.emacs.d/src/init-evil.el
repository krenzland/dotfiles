(use-package evil
  :ensure t
  :config
  (progn
    (setq evil-default-cursor t)
    (evil-mode 1)))

(use-package evil-escape
  :ensure t
  :init
    (setq-default evil-escape-key-sequence "fd")
  :config
    (evil-escape-mode))

(provide 'init-evil)
