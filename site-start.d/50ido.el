(ido-mode 1)
(ido-everywhere 1)

(setq ido-enable-flex-matching t)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; ido-ubiquitous
(ido-ubiquitous-mode 1)

;; ido-vertical
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)    ;; C-n/C-pで候補選択する
(setq ido-vertical-show-count t)
