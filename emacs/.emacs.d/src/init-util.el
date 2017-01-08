(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))

(use-package smartparens-config
  :ensure smartparens
  :diminish (smartparens-mode . "")
  :init
  (smartparens-global-mode))

(use-package avy
  :ensure t
  :commands (avy-goto-word-1))

(winner-mode t)

(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'forward))

(use-package saveplace
  :init
  (save-place-mode t))

(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t))

(defun init-open-config ()
  "Opens the config file."
  (interactive)
  (find-file user-init-file))

(provide 'init-util)
