;; diredがちゃんと動くようにする
(setenv "TMPDIR" "/tmp")
(setenv "LC_TIME" "C")
(setenv "LC_ALL" "ja_JP.UTF-8")
(setenv "LANG" "C")

;; .#のロックファイルを作らない
(setq auto-save-default nil)

;; 言語を日本語にする
(set-language-environment 'Japanese)

;; 極力UTF-8とする
(prefer-coding-system 'utf-8)

;; 現在行のハイライト
(global-hl-line-mode t)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; カーソルの点滅
(blink-cursor-mode t)

;; 行番号表示
(line-number-mode 1)

;; カラム表示
(column-number-mode 1)

;; ツールバー非表示
(tool-bar-mode 0)

;; bellを消す
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; バッファの最後に空行を追加しない
(setq next-line-add-newlines nil)

;; リージョンをハイライトする
(transient-mark-mode 1)

;; meta-g で goto-line にする
(global-set-key "\M-g" 'goto-line)

;; C-hをバックスペースとする
(global-set-key "\C-h" 'delete-backward-char)

;; C-x C-b
(define-key ctl-x-map "\C-b" 'buffer-menu)

;; 書き換えられたら読みなおす
(global-auto-revert-mode 1)

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; スクロールバー非表示
(set-scroll-bar-mode nil)

;; diredの設定
;; オリジナル: http://keens.github.io/blog/2013/10/04/emacs-dired/
(setq dired-listing-switches (purecopy "-Fahl"))
(setq dired-dwim-target t)
(add-hook 'dired-load-hook (lambda ()
                  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))

;; grepの設定
(require 'grep)
(grep-apply-setting 'grep-command "grep -r -nH -e *")
