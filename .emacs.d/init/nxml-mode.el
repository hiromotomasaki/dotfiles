;;
;;; nxml-mode.elの設定
;;

;; ===================================================================

;; 【参考】Emacs nxml-modeの設定
;; http://yanmoo.blogspot.jp/2011/10/emacs-nxml-mode.html

;; ===================================================================

(use-package nxml-mode
  
  :mode (("\\.xsd\\'" . nxml-mode)
	 ("\\.xml\\'" . nxml-mode))
  
  :config
  (setq nxml-child-indent 2)                  ; タグのインデント幅
  (setq nxml-attribute-indent 4)              ; 属性のインデント幅
  (setq indent-tabs-mode t)
  ;; (setq nxml-bind-meta-tab-to-complete-flag t) 
  
  (setq nxml-slash-auto-complete-flag t)      ; </の入力で閉じタグを補完する
  
  ;; (setq nxml-sexp-element-flag t)             ; C-M-kで下位を含む要素全体をkillする
  ;; (setq nxml-char-ref-display-glyph-flag nil) ; グリフは非表示
  (setq tab-width 4)

  (custom-set-faces
   '(nxml-comment-content-face
     ((t (:foreground "red"))))                            ; コメント
   '(nxml-comment-delimiter-face
     ((t (:foreground "red"))))                            ; ＜!-- --＞
   '(nxml-delimited-data-face
     ((t (:foreground "DarkViolet"))))                     ; 属性値やDTD引数値など
   '(nxml-delimiter-face
     ((t (:foreground "blue"))))                           ; ＜＞ ＜? ?＞ ""
   '(nxml-element-local-name-face
     ((t (:inherit nxml-name-face :foreground "blue"))))   ; 要素名
   '(nxml-name-face
     ((t (:foreground "dark green"))))                     ; 属性名など
   '(nxml-element-colon-face
     ((t (:foreground "LightSteelBlue"))))                 ; :(xsl:paramなど)
   '(nxml-ref-face
     ((t (:foreground "DarkGoldenrod"))))                  ; ＆lt;など
   '(nxml-tag-slash-face
     ((t (:inherit nxml-name-face :foreground "blue")))))  ; /(終了タグ)

  )
