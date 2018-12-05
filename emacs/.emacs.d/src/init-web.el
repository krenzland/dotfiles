(use-package web-mode
  :ensure t
  :mode
  ("\\.html?\\'" . web-mode)
  ("\\.phtml\\'" . web-mode)
  ("\\.tpl\\.php\\'" . web-mode)
  ("\\.[agj]sp\\'" . web-mode)
  ("\\.as[cp]x\\'" . web-mode)
  ("\\.erb\\'" . web-mode)
  ("\\.mustache\\'" . web-mode)
  ("\\.djhtml\\'" . web-mode))

(use-package emmet-mode
  :ensure t
  :commands (emmet-mode
             emmet-next-edit-point
             emmet-prev-edit-point)
  :config
  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))
 
(use-package restclient
  :ensure t
  :commands 'restclient-mode)

(provide 'init-web)
