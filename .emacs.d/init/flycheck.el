;;
;;; flycheck.elの設定
;;

;; ===================================================================

;; 【参考】Flycheckでモダンなシンタックスチェック
;; http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b

;; ===================================================================

(bundle flycheck)

(use-package flycheck
  :defer t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)

  :config

  ;; =================================================================

  ;; 【参考】flycheck — how to disable warnning while edit emacs lisp scripts?
  ;; http://stackoverflow.com/questions/15552349/flycheck-how-to-disable-warnning-while-edit-emacs-lisp-scripts

  ;; =================================================================

  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

