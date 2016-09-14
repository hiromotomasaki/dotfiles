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

