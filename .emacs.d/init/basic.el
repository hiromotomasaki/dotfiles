;; hostname
(defconst short-hostname (or (nth 0 (split-string (system-name) "\\."))

                             (system-name))

  "Host part of function `system-name'.")

;; shell
(setq-default explicit-shell-file-name "bash")

(setq shell-file-name "bash"

      shell-command-switch "-c")

;; interactive
(fset 'yes-or-no-p 'y-or-n-p)          ; (yes/no) を (y/n)に(fsetは関数yes-or-no-pを使うところを関数y-or-n-pに変更するということ。setfは関数の定義で使う)

;; 日本語を utf-8 に統一
(set-language-environment "Japanese")
(setq buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; フォントをRitcyに変更する
(set-face-attribute 'default nil
                    :family "Ricty Discord"
                    :height 120)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Ricty Discord" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "Ricty Discord" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "Ricty Discord" "iso10646-1"))

;; Ritcyの手順
;; http://www.rs.tus.ac.jp/yyusa/ricty.html
;; [14:25:21]hiro@hiro-VirtualBox:~$ sudo apt install fontforge
;; [14:26:07]hiro@hiro-VirtualBox:~$ cd Downloads/
;; [15:01:56]hiro@hiro-VirtualBox:Downloads$ ls
;; Inconsolata-Bold.ttf     Ricty-Bold.ttf            migu-1m-20150712      ricty_discord_converter.pe
;; Inconsolata-Regular.ttf  Ricty-Regular.ttf         migu-1m-20150712.zip  ricty_generator.sh
;; Inconsolata.zip          RictyDiscord-Bold.ttf     migu-1m-bold.ttf
;; OFL.txt                  RictyDiscord-Regular.ttf  migu-1m-regular.ttf
;; [15:02:53]hiro@hiro-VirtualBox:Downloads$ mkdir ~/dotfiles/.fonts
;; [15:04:34]hiro@hiro-VirtualBox:Downloads$ cd ~/dotfiles/
;; [15:05:21]hiro@hiro-VirtualBox:dotfiles$ ./setup.sh 
;; [15:05:24]hiro@hiro-VirtualBox:dotfiles$ cd -
;; [15:06:45]hiro@hiro-VirtualBox:Downloads$ cp -f Ricty*.ttf ~/dotfiles/.fonts/
;; [15:06:45]hiro@hiro-VirtualBox:Downloads$ fc-cache -vf


;; 終了時に自動でプロセスをkill
;; (defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
;;   "Prevent annoying \"Active processes exist\" query when you quit Emacs."
;;   (flet ((process-list ())) ad-do-it))
(defadvice save-buffers-kill-terminal (before my-save-buffers-kill-terminal activate)
  (when (process-list)
    (dolist (p (process-list))
      (set-process-query-on-exit-flag p nil))))

