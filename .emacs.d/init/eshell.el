;;
;;; eshell.elの設定
;;

(use-package eshell
  
  :defer t
  
  :config
  ;; eshellのバナーメッセージを変更する
  (setq eshell-banner-message "Welcome to the Emacs Shell （*>w<）!\n")

  ;; ===================================================================

  ;; 【参考】[Emacs] eshellのプロンプトをかわいくする
  ;; http://hins11.jugem.jp/?eid=52

  ;; ===================================================================

  ;; ===================================================================

  ;; 【参考】zk-phi/dotfiles
  ;; https://github.com/zk-phi/dotfiles/blob/master/emacs/init.el#L4829-L4836

  ;; ===================================================================

  (setq eshell-prompt-regexp   (concat "^" (regexp-opt '("（*>w<）? " "（*'-'）? " "（`;w;）! ")))
	eshell-prompt-function (lambda ()
                                 (concat "\n[" (eshell/pwd) "]\n"
                                         (cond ((= (user-uid) 0) "（*>w<）? ")
                                               ((= eshell-last-command-status 0) "（*'-'）? ")
                                               (t "（`;w;）! ")))))

  ;; ===================================================================

  ;; 【参考】eshellを使ってみよう
  ;; http://nishikawasasaki.hatenablog.com/entry/20110406/1302096718

  ;; ===================================================================

  ;; 補完時に大文字小文字を区別しない
  (setq eshell-cmpl-ignore-case t)
  
  )
