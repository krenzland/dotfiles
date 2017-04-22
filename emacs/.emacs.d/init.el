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

(add-to-list 'load-path (expand-file-name "src" user-emacs-directory))

;; Sets some sane defaults
(require 'init-settings)
(require 'init-theme)

;; Customize the interface
(require 'init-util)
(require 'init-evil)
(require 'init-ivy)
(require 'init-keybindings)
(require 'init-autocomplete)

(require 'init-projectile)
(require 'init-git)

;; Text-editing
(require 'init-org)
(require 'init-tex)

;; Programming
(require 'init-python)
(require 'init-haskell)
(require 'init-web)
(require 'init-rust)
(require 'init-cpp)

;; Communication
(require 'init-mail)
