;; 参考 : http://tarao.hatenablog.com/entry/20150221/1424518030
;; 参考(生) : https://github.com/tarao/dotfiles/blob/master/.emacs.d/init.el

;; emacs directory

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(let ((versioned-dir (locate-user-emacs-file (format "v%s" emacs-version))))
  (setq-default el-get-dir (expand-file-name "el-get" versioned-dir)
                package-user-dir (expand-file-name "elpa" versioned-dir)))

;; **************** el-get ****************  ;;
;; bundle (an El-Get wrapper)
(setq-default el-get-emacswiki-base-url
              "http://raw.github.com/emacsmirror/emacswiki.org/master/")
(add-to-list 'load-path (expand-file-name "bundle" el-get-dir))
(unless (require 'bundle nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "http://raw.github.com/tarao/bundle-el/master/bundle-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path (locate-user-emacs-file "recipes"))

;; **************** el-get-lock ****************  ;;
;; lock the pacakge versions
(bundle tarao/el-get-lock
  (el-get-lock)
  (el-get-lock-unlock 'el-get))

(bundle with-eval-after-load-feature)

;; **************** use-package ****************  ;;
;; use-packageを使えるようにする
(bundle jwiegley/use-package)
(bundle myrjola/diminish.el)
(eval-when-compile (require 'use-package))
(require 'diminish)    ;; if you use :diminish
(require 'bind-key)    ;; if you use any :bind variant
(setq use-package-verbose t)
(setq use-package-minimum-reported-time 0.001)

;; **************** init-loader ****************  ;;
;; load init files
(bundle! emacs-jp/init-loader
  ;; load
  (setq-default init-loader-show-log-after-init t
                init-loader-byte-compile t)
  (init-loader-load (locate-user-emacs-file "init-loader"))

  ;; hide compilation results
  (let ((win (get-buffer-window "*Compile-Log*")))
    (when win (delete-window win))))

;; put site-lisp and its subdirectories into load-path
(when (fboundp 'normal-top-level-add-subdirs-to-load-path)
  (let* ((dir (locate-user-emacs-file "site-lisp"))
         (default-directory dir))
    (when (file-directory-p dir)
      (add-to-list 'load-path dir)
      (normal-top-level-add-subdirs-to-load-path))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (auctex mozc-popup mozc nil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#aaaaaa" :background "#1f1f1f"))))
 '(header-line ((((class color) (min-colors 89)) (:background "#3f3f3f" :box nil))))
 '(mode-line ((((class color) (min-colors 89)) (:foreground "#8fb28f" :background "#3f3f3f" :box nil))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:background "#5f5f5f" :box nil))))
 '(region ((((class color) (min-colors 89)) (:background "#8c8ce8")))))

