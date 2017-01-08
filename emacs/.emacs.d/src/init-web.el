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
 
(use-package restclient
  :ensure t
  :commands 'restclient-mode)

(provide 'init-web)
