(use-package company
  :ensure t
  :diminish (company-mode . "")
  :config
  (add-hook 'after-init-hook #'global-company-mode)
  (define-key company-active-map (kbd "<tab>")
    (lambda () (interactive) (company-complete-common-or-cycle 1)))
  (use-package company-quickhelp
    :ensure t
    :config
    (company-quickhelp-mode 1)))

(provide 'init-autocomplete)
