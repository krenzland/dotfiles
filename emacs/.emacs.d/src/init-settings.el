(setq user-full-name "Lukas Krenz")
(setq user-mail-address "lukas@krenz.land")
(setq tramp-default-method "ssh") ;; Faster than scp

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

;; Avoid cluttering init.el by customization
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Move all backup files to central folder
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))

(provide 'init-settings)
