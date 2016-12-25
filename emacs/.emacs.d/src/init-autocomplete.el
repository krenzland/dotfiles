(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-company-mode)
  :config
  (define-key company-active-map (kbd "<tab>")
    (lambda () (interactive) (company-complete-common-or-cycle 1)))
  (use-package company-quickhelp
    :ensure t
    :config
    (company-quickhelp-mode 1)))

(provide 'init-autocomplete)
