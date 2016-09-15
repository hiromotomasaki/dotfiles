;; http://keisanbutsuriya.hateblo.jp/entry/2015/03/13/175219

(bundle yatex)

;; ;;
;; ;; YaTeX
;; ;;
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; (setq auto-mode-alist
;;       (append '(("\\.tex$" . yatex-mode)
;;         ("\\.ltx$" . yatex-mode)
;;         ("\\.cls$" . yatex-mode)
;;         ("\\.sty$" . yatex-mode)
;;         ("\\.clo$" . yatex-mode)
;;         ("\\.bbl$" . yatex-mode)) auto-mode-alist))
;; (setq YaTeX-inhibit-prefix-letter t)
;; (setq YaTeX-kanji-code nil)
;; (setq YaTeX-latex-message-code 'utf-8)
;; (setq YaTeX-use-AMS-LaTeX t)
;; (setq YaTeX-dvi2-command-ext-alist
;;       '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
;; (setq tex-command "platex -synctex=1")
;; ;; (setq tex-command "pdflatex -synctex=1")
;; (setq dvi2-command "xdvi")
;; ;; (when (equal system-type 'darwin)     ;; for Mac only
;; ;;   (setq dvi2-command "/usr/bin/open -a Skim")
;; ;;   (setq tex-pdfview-command "/usr/bin/open -a Skim"))
;; (setq bibtex-command "pbibtex")
;; (setq dviprint-command-format "dvipdfmx")


;; (add-hook 'yatex-mode-hook '(lambda () (auto-fill-mode -1))) ;; 自動で改行しない


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










;; http://cirkitrwrc.blogspot.jp/2014/07/ubuntu1404ltsemacstex.html
;; .latexmkrcも作ること

;;YaTexの設定
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
;;(setq tex-command "latexmk -pvc")  ;;保存したら自動で再コンパイル
(setq tex-command "latexmk")
(setq dvi2-command "evince")



