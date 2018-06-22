(require 'generic-x)
(require 'cl)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/local-lisp")

(mapc 'load (directory-files "~/.emacs.d/site-start.d" t "\\.el\\'"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zenburn-theme yaml-mode web-mode smex projectile php-mode magit json-mode ido-vertical-mode ido-ubiquitous bs-ext))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
