;;
(load-theme 'zenburn t) ;; theme

(define-key global-map "\M-t" 'my-concat-time-stamp)
(define-key global-map "\M-f" 'my-forward-to-word)
(define-key global-map "\C-t" 'my-vz-kill-word)
(define-key global-map "\C-ca" 'my-align-to-equals)

;; minibuffer 内は英数モードにする
(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)

;; 個人向けなdefun
(defun my-concat-time-stamp ()
  "concat time stamp"
  (interactive)
  (insert
   (concat (format-time-string "%Y-%m-%d %T" (current-time))))
  )

(defun my-forward-to-word (arg)
  "次の単語の先頭に移動"
  (interactive "p")
  (or (re-search-forward (if (> arg 0) "\\(\\W\\b\\|.$\\)" "\\b\\W") nil t arg)
      (goto-char (if (> arg 0) (point-max) (point-min)))))

;;
;; Vz 風な"ワード"削除
;;
;; オリジナル: http://www.flcl.org/~yoh/vzmode/emacs21/readme_emacs21.html
;;
(defun my-vz-char-type (ch)
  (let ((syntax (char-syntax ch))
    (category-set (char-category-set ch)))
    (if (aref category-set ?j)
    (cond ((= ch ?ー) 6)
                    ;((aref category-set ?\ ) 2)
          ((aref category-set ?H) 4)
          ((aref category-set ?S) 3)
          (t 6))
      (cond ((= syntax ?\ ) 2)
        ((= syntax ?w) 6)
        (t 3)))))

(defun my-vz-kill-word ()
  (interactive)
  (let (word (org (my-vz-char-type (following-char))))
    (while (and (not (eobp))
                (prog1
                    (not (eolp))
                  (setq word (concat
                              word
                              (char-to-string (following-char))))
                  (delete-char 1))
                (not (eolp))
                (= org (my-vz-char-type (following-char)))))))

;; alignの設定
(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))

(defun my-align-to-equals (begin end)
  "Align region to equal signs"
   (interactive "r")
   (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))
