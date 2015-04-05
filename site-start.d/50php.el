;; php-mode

(add-hook 'php-mode-hook
          '(lambda ()
             ;;n(require 'php-align)
             ;;(php-align-setup)
             (defun ywb-php-lineup-arglist-intro (langelem)
               (save-excursion
                 (goto-char (cdr langelem))
                 (vector (+ (current-column) c-basic-offset))))
             (defun ywb-php-lineup-arglist-close (langelem)
               (save-excursion
                 (goto-char (cdr langelem))
                 (vector (current-column))))
             (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
             (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)
             (setq tab-width 4
                   c-basic-offset 4
                   c-hanging-comment-ender-p nil
                   indent-tabs-mode t)))
