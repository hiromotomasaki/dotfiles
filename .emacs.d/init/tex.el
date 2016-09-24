;; http://keisanbutsuriya.hateblo.jp/entry/2015/03/13/175219

;; sudo apt-add-repository ppa:texlive-backports/ppa
;; sudo apt install texlive texlive-lang-cjk xdvik-ja dvipsk-ja gv texlive-fonts-recommended texlive-fonts-extra
;; sudo apt install mercurial

(bundle yatex)

;; http://cirkitrwrc.blogspot.jp/2014/07/ubuntu1404ltsemacstex.html
;; .latexmkrcも作ること


;; YaTexの設定
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
        ("\\.ltx$" . yatex-mode)
        ("\\.cls$" . yatex-mode)
        ("\\.sty$" . yatex-mode)
        ("\\.clo$" . yatex-mode)
        ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq tex-command "latexmk -pvc")  ;;保存したら自動で再コンパイル
(setq tex-command "latexmk")
(setq dvi2-command "evince")

;; ;; C-c C-t j 
;; ;; コンパイル 
;; ;; C-c C-t p 
;; ;; プレビュー 
;; ;; C-c C-t d 
;; ;; PDFに変換 


;; ;; C-c = 
;; ;; アウトラインを表示。選んだセクションなどへジャンプできる 
;; ;; C-c [ 
;; ;; bibliographyやbibファイルなどからciteを挿入 
;; ;; C-c ( 
;; ;; ラベルをつける 
;; ;; C-c ) 
;; ;; refで参照する 
;; ;; C-c & 
;; ;; 対応するラベルを参照 

