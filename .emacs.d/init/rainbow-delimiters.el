;;
;;; rainbow-delimiters.elの設定
;;

;; ===================================================================

;; 【参考】rainbow-delimiters.el の括弧の色を強調する方法 (たぶん) 決定版
;; http://qiita.com/megane42/items/ee71f1ff8652dbf94cf7

;; ===================================================================

(el-get-bundle rainbow-delimiters)

(use-package rainbow-delimiters
  :commands rainbow-delimiters-using-stronger-colors
  
  :init
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)
  
  :config
  ;; 括弧の色を強調する設定
  (require 'cl-lib)
  (require 'color)
  
  (defun rainbow-delimiters-using-stronger-colors ()
    (interactive)
    (cl-loop
     for index from 1 to rainbow-delimiters-max-face-count
     do
     (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
       (cl-callf color-saturate-name (face-foreground face) 30))))
  )
