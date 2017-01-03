(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
   ("C-#" . ivy-avy))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d)")
  ;; no regexp by default
  ;; (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
        ;; allow input not in order
        '((t   . ivy--regex-ignore-order))))

(use-package ivy-hydra
  :ensure t)

(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
  ("C-s" . counsel-grep-or-swiper)
  ("C-x C-f" . counsel-find-file)
  ("C-c g" . counsel-git)
  ("C-c k" . counsel-git-grep)
  ("C-x l" . counsel-locate)
  
  ))

(use-package smex
  :ensure t)

(provide 'init-ivy)
