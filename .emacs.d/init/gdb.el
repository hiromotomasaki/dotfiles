;;
;;; gdb.elの設定
;;

;; ===================================================================

;; 【参考】EmacsとgdbでVisual Studioライクなデバッグ環境
;; http://www.chokkan.org/blog/archives/575

;; 設定ファイル(gdb.el)
;; https://gist.github.com/chokkan/5693497

;; ===================================================================

(use-package gud
  :defer t
  :commands (gdb-set-clear-breakpoint gud-kill) 

  :init
  (use-package gud)
  (bind-key "<f1>" 'gud-print gud-minor-mode-map)
  (bind-key "<S-f1>" 'gud-watch gud-minor-mode-map)
  (bind-key "<f2>" 'gud-refresh gud-minor-mode-map)
  (bind-key "<f5>" 'gud-cont gud-minor-mode-map)
  (bind-key "<S-f5>" 'gud-kill gud-minor-mode-map)
  (bind-key "<f6>" 'gud-until gud-minor-mode-map)
  (bind-key "<f9>" 'gdb-set-clear-breakpoint gud-minor-mode-map)
  (bind-key "<S-f9>" 'gud-break-main gud-minor-mode-map)
  (bind-key "<f10>" 'gud-next gud-minor-mode-map)
  (bind-key "<f11>" 'gud-step gud-minor-mode-map)
  (bind-key "<C-f10>" 'gud-until gud-minor-mode-map)
  (bind-key "<C-f11>" 'gud-finish gud-minor-mode-map)
  (bind-key "<S-f11>" 'gud-finish gud-minor-mode-map)
    
  :config
  (setq gdb-many-windows t)
  (setq gdb-use-separate-io-buffer t)
  (gud-tooltip-mode t)
  (gud-def gud-break-main "break main" nil "Set breakpoint at main.")
  (setq gud-tooltip-echo-area nil)

  (defun gdb-set-clear-breakpoint ()
    (interactive)
    (if (or (buffer-file-name) (eq major-mode 'gdb-assembler-mode))
	(if (or
	     (let ((start (- (line-beginning-position) 1))
		   (end (+ (line-end-position) 1)))
	       (catch 'breakpoint
		 (dolist (overlay (overlays-in start end))
		   (if (overlay-get overlay 'put-break)
		       (throw 'breakpoint t)))))
	     (eq (car (fringe-bitmaps-at-pos)) 'breakpoint))
	    (gud-remove nil)
	  (gud-break nil))))

  (defun gud-kill ()
    "Kill gdb process."
    (interactive)
    (with-current-buffer gud-comint-buffer (comint-skip-input))
    (kill-process (get-buffer-process gud-comint-buffer))))
