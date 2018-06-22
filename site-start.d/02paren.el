;; 対応する括弧関係
(show-paren-mode t)
;; 閉じ括弧の対応ミスマッチ時にビープ音を鳴らす
;; (setq show-paren-ring-bell-on-mismatch t)
;; ハイライトするまでの遅延時間
(setq show-paren-delay 0) ;; default: 0.125
;; show-paren-mode (括弧対応の強調)の背景色
;;(set-face-background 'show-paren-match-face "Moccasin")
;;(set-face-background 'show-paren-mismatch-face  "tomato")
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond 
    ((looking-at "[([{]") (forward-sexp 1) (backward-char))
    ((looking-at "[])}]") (forward-char) (backward-sexp 1))
    (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)

