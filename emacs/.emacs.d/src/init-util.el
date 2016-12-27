(use-package smartparens-config
  :ensure smartparens
  :init
  (smartparens-global-mode))

(use-package avy
  :ensure t
  :commands (avy-goto-word-1))
(winner-mode t)

(defun init-open-config ()
  "Opens the config file."
  (interactive)
  (find-file user-init-file))

(provide 'init-util)
