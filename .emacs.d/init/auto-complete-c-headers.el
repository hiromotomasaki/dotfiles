;; ヘッダーの自動補完
(bundle auto-complete-c-headers)
(use-package auto-complete-c-headers
  :init
  (add-hook 'c++-mode-hook (lambda () 
            '(setq ac-sources (append ac-sources '(ac-source-c-headers)))))
  (add-hook 'c-mode-hook (lambda () 
			   '(setq ac-sources (append ac-sources '(ac-source-c-headers))))))
;; インクルード先の追加部分は時間があるときに後で書く;;

