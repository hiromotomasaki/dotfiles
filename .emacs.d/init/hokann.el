;; 辞書を引いて文字列の自動補完
(bundle auto-complete)
(use-package auto-complete-config
  :init
  (use-package auto-complete)
  (global-auto-complete-mode t)
  :config
  ;; auto-completeが辞書として使うファイルが保存されているパスの登録
  ;; もし自分で辞書を作成したらadd-to-listでそのファイルがおいてあるパスを示す。
  ;; ファイルの例は~/.emacs.d/elisp/auto-complete/dictを参考にする
  (ac-config-default)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/v25.1.1/elisp/auto-complete/dict")

  ;; C-n / C-p で選択できるようにする
  (setq ac-use-menu-map t)

  ;; 適用するメジャーモードを追加
  (dolist (mode '(
		  scss-mode
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
		  auctex-mode
		  arduino-mode
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













;; ;; 辞書を引いて関数の自動補完
(bundle yasnippet)
(use-package yasnippet
 :diminish yas-minor-mode
 :bind (:map yas-minor-mode-map
            ("C-x i i" . yas-insert-snippet)
            ("C-x i n" . yas-new-snippet)
            ("C-x i v" . yas-visit-snippet-file)
            ("C-x i l" . yas-describe-tables)
            ("C-x i g" . yas-reload-all)
            )
 :config
 (setq yas-snippet-dirs
       '(
	 "~/emacs.d/snippets/mysnippets"      ;; 作成したスニペット
	  "~/emacs.d/snippets/site-snippets"   ;; 拾ってきたスニペット
	  yas-installed-snippets-dir ;; package に最初から含まれるスニペット
	  ))
 (yas-global-mode 1)
 (setq yas-prompt-functions '(yas-ido-prompt))
)







;; 参考
;; http://kawanai.jp/emacs.html

(bundle auto-complete-c-headers)

(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directoies '"/usr/lib/gcc/x86_64-linux-gnu/5/include")
  )

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)






















(defun flyspell-correct-word-popup-el ()
  "Pop up a menu of possible corrections for misspelled word before point."
  (interactive)
  ;; use the correct dictionary
  (flyspell-accept-buffer-local-defs)
  (let ((cursor-location (point))
	(word (flyspell-get-word nil)))
    (if (consp word)
	(let ((start (car (cdr word)))
	      (end (car (cdr (cdr word))))
	      (word (car word))
	      poss ispell-filter)
	  ;; now check spelling of word.
	  (ispell-send-string "%\n")	;put in verbose mode
	  (ispell-send-string (concat "^" word "\n"))
	  ;; wait until ispell has processed word
	  (while (progn
		   (accept-process-output ispell-process)
		   (not (string= "" (car ispell-filter)))))
	  ;; Remove leading empty element
	  (setq ispell-filter (cdr ispell-filter))
	  ;; ispell process should return something after word is sent.
	  ;; Tag word as valid (i.e., skip) otherwise
	  (or ispell-filter
	      (setq ispell-filter '(*)))
	  (if (consp ispell-filter)
	      (setq poss (ispell-parse-output (car ispell-filter))))
	  (cond
	   ((or (eq poss t) (stringp poss))
	    ;; don't correct word
	    t)
	   ((null poss)
	    ;; ispell error
	    (error "Ispell: error in Ispell process"))
	   (t
	    ;; The word is incorrect, we have to propose a replacement.
	    (flyspell-do-correct (popup-menu* (car (cddr poss)) :scroll-bar t :margin t)
				 poss word cursor-location start end cursor-location)))
	  (ispell-pdict-save t)))))

;; 修正したい単語の上にカーソルをもっていき, C-M-return を押すことで候補を選択

(add-hook 'flyspell-mode-hook
          (lambda ()
            (define-key flyspell-mode-map (kbd "<C-M-return>") 'flyspell-correct-word-popup-el)
            ))

;; flyspell-mode を自動的に開始させたいファイルを指定 (お好みでアンコメントするなり, 変更するなり)

(add-to-list 'auto-mode-alist '("\\.txt" . flyspell-mode))
(add-to-list 'auto-mode-alist '("\\.tex" . flyspell-mode))
(add-to-list 'auto-mode-alist '("\\.org" . flyspell-mode))
; (add-to-list 'auto-mode-alist '("\\.properties" . flyspell-mode))
; (add-to-list 'auto-mode-alist '("\\.dtd" . flyspell-mode))




