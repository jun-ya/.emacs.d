;;
;; オリジナル: http://qiita.com/itiut@github/items/4d74da2412a29ef59c3a
;;
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         ; empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         ; tab-mark       ; タブ文字
                         ))

;; 空白文字の表示ルール
;;  半角空白を不可視にしているのであまりいじらないほうが良さそう
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\uff3f])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
; (setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)

;; zenburn-theme background: #3f3f3f
(defvar my/zenburn-bg-color "#3f3f3f")
(defvar my/bg-color "#464646")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "#8f8f8f"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/zenburn-bg-color
                    :foreground "#476097"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "#476097"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)
