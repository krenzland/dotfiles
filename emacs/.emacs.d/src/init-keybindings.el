(use-package which-key
  :ensure t
  :diminish (which-key-mode . "")
  :config
  (which-key-mode))

(use-package general
  :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "SPC" '(avy-goto-word-1)))

(use-package hydra
  :ensure t)

(provide 'init-keybindings)
