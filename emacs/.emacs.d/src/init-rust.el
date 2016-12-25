(use-package rust-mode
   :ensure t
)
(use-package cargo
   :ensure t
   :config
   (add-hook 'rust-mode-hook 'cargo-minor-mode))
(use-package rustfmt
   :ensure t
)
(use-package racer
   :ensure t
   :config
   (progn
   (setq racer-rust-src-path "~/src/rust/src")
   (add-hook 'rust-mode-hook #'racer-mode)
   (add-hook 'rust-mode-hook #'eldoc-mode)
   (add-hook 'rust-mode-hook #'company-mode)
))
(use-package flycheck-rust
   :ensure t
   :config
   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'init-rust)
