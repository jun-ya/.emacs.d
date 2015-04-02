;; php-mode

(add-hook 'php-mode-hook
          '(lambda ()
             (require 'php-align)
             (php-align-setup)
             (defun ywb-php-lineup-arglist-intro (langelem)
               (save-excursion
                 (setq-default indent-tabs-mode nil)
                 (goto-char (cdr langelem))
                 (vector (+ (current-column) c-basic-offset))
                 (setq-default indent-tabs-mode t)))
             (defun ywb-php-lineup-arglist-close (langelem)
               (save-excursion
                 (setq-default indent-tabs-mode nil)
                 (goto-char (cdr langelem))
                 (vector (current-column))
                 (setq-default indent-tabs-mode t)))
             (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
             (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)
             (define-key c-mode-base-map "\C-ca" 'align-current)
             (setq tab-width 4
                   c-basic-offset 4
                   c-hanging-comment-ender-p nil
                   indent-tabs-mode t)))
