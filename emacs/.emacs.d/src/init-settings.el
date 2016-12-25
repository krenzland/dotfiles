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

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(provide 'init-settings)
