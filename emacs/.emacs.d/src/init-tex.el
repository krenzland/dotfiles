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
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
  (add-hook 'LaTeX-mode-hook (lambda () (reftex-mode))))
  (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))


(use-package company-auctex
  :ensure t
  :config
  (company-auctex-init))

(use-package ivy-bibtex
  :ensure t)

(provide 'init-tex)
