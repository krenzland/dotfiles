;;; init.el --- Bootstrap for org-babel


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
             '(("melpa" . "https://melpa.org/packages/")
              ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(use-package diminish
  :ensure t)

(setq user-full-name "Lukas Krenz")
(setq user-mail-address "lukas@krenz.land")

(setq tab-width 4
    indent-tabs-mode nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

;; evil
(use-package evil
  :ensure t
  :init
  (progn
    (setq evil-default-cursor t)
    (evil-mode 1)))

(use-package smartparens-config
  :ensure smartparens
  :init
  (smartparens-global-mode))

;; Autocompletion
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

(use-package solarized-theme
  :ensure t)
(load-theme 'solarized-light t)

(use-package smart-mode-line
  :ensure t
  :config
  (progn
    (require 'smart-mode-line)
    (smart-mode-line-enable)))

;; git
(use-package magit
  :ensure t
  :commands magit-status
  :bind ("C-x g" . magit-status))

(use-package projectile
  :ensure t
)

(use-package avy
  :ensure t
  :commands (avy-goto-word-1))

(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
   ("C-#" . ivy-avy))
  :config
  (progn
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  (setq ivy-height 10)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
        ;; allow input not in order
        '((t   . ivy--regex-ignore-order)))))

(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
  ("C-s" . counsel-grep-or-swiper)
  ("C-x C-f" . counsel-find-file)))

(use-package which-key
  :ensure t
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

(winner-mode t)

;; org-mode
(use-package org
  :ensure t
  :config
  (progn 
     (setq org-src-fontify-natively t) ;; syntax highlighting for babel
  ))

(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-parse-self t)
  ;; Here we make auctex aware of latexmk and xelatexmk. We can use
  ;; these instead of calling pdflatex, bibtex, pdflatex, pdflatex (or
  ;; similar). I'll set latexmk as the default as there's really no
  ;; reason to use pdflatex
  (eval-after-load "tex"
    '(add-to-list 'TeX-command-list '("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t :help "Process file with latexmk")))
  (eval-after-load "tex"
    '(add-to-list 'TeX-command-list '("xelatexmk" "latexmk -synctex=1 -shell-escape -xelatex %s" TeX-run-TeX nil t :help "Process file with xelatexmk")))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk"))))

(use-package ivy-bibtex
  :ensure t)

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :ensure t
  :config
  (eval-after-load "company"
    '(add-to-list 'company-backends '(company-anaconda :with company-capf))))

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package web-mode
  :ensure t
  :config
  (progn 
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)))
  )

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

(use-package notmuch
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (flycheck-rust racer rustfmt cargo rust-mode web-mode company-anaconda anaconda-mode ivy-bibtex intero notmuch general avy which-key counsel ivy company-quickhelp company auctex company-auctex smartparens projectile smart-mode-line smart-mode-lie use-package solarized-theme powerline-evil magit helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
