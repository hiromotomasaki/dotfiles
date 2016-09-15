;;
;;; auto-complete.elの設定
;;


;; 辞書を引いて文字列の自動補完

;; ===================================================================

;; 【参考】ESS で快適 R ライフ ～設定編～（2012年度版）
;; http://d.hatena.ne.jp/a_bicky/20120415/1334490586

;; ===================================================================

;; ===================================================================

;; 【参考】yasnippet 8.0の導入からスニペットの書き方、
;;                           anything/helm/auto-completeとの連携
;; http://fukuyama.co/yasnippet

;; ===================================================================

(bundle auto-complete)

(use-package auto-complete-config
  :init
  (use-package auto-complete)
  (global-auto-complete-mode t)

  :bind (("M-i" . auto-complete))
  
  :config
  ;; 補完機能の追加
  (add-to-list 'ac-dictionary-directories (expand-file-name "~/emacs.d/v25.1.1/el-get/auto-complete/dict"))
  (ac-config-default)

  ;; デフォルトの情報源を指定する
  (setq-default ac-sources
		'(ac-source-dictionary
		  ;; ac-source-filename
		  ac-mozc
		  ac-source-words-in-same-mode-buffers
		  ))
  
  ;; C-n / C-p で選択できるようにする
  (setq ac-use-menu-map t)

  ;; 適用するメジャーモードを追加
  (dolist (mode '(scss-mode
		  web-mode
		  git-commit-mode
		  gfm-mode
		  twittering-edit-mode
		  shell-mode
		  markdown-mode
		  text-mode
		  octave-mode
		  css-mode
		  eshell-mode
		  nxml-mode
		  python-mode
		  yatex-mode
		  arduino-mode
		  c++-mode
		  graphviz-dot-mode
		  php-mode))
    (add-to-list 'ac-modes mode))

  ;; acが発動するまでの文字数を指定する
  (setq ac-auto-start 2)

  ;; popupメニューが表示されるまでの時間を指定する
  (setq ac-auto-show-menu 0.2)
  
  ;; popupメニューの高さの上限を指定する
  (setq ac-menu-height 20)

  ;; 補完候補をソートする
  (setq ac-use-comphist t)

  ;; =================================================================
  
  ;; 【参考】popupのレイアウトを崩れないようにする
  ;; http://stackoverflow.com/questions/13242165/emacs-auto-complete-popup-menu-broken
  
  ;; =================================================================
  
  (setq popup-use-optimized-column-computation nil)
  
  ;; =================================================================

  ;; 【参考】auto-complete-modeとlinum-modeを共存させる設定
  ;; http://nullbyte.hatenablog.com/entry/2015/07/17/010148

  ;; =================================================================
  
  (ac-linum-workaround)

  ;; =================================================================

  ;; 【参考】Auto Complete でコメントや文字列リテラルでも補完を行う
  ;; http://qiita.com/akisute3@github/items/87514346bf1c008f1ef6

  ;; =================================================================

  (setq ac-disable-faces nil)
  
  )
