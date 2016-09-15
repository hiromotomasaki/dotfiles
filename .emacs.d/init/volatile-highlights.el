;;
;;; volatile-highlights
;;

;; ===================================================================

;; 操作に視覚的フィードバックを与える
;; https://github.com/k-talo/volatile-highlights.el/blob/master/README-ja.org

;; ===================================================================

(bundle volatile-highlights)

(use-package volatile-highlights
  :defer t
  :config
  (volatile-highlights-mode t))
