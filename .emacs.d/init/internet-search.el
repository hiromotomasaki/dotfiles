(bundle tomoya/search-web.el)

;; http://no-maddojp.hatenablog.com/entry/2015/01/23/235238


(when (require 'search-web)
  (defvar search-web-default-engine_1 "eijiro")
  (defvar search-web-use-default-engine t)

  (defun search-web-switch-use-default-engine ()
    (interactive)
    (setq search-web-use-default-engine (not search-web-use-default-engine)))


  (defun search-web-query-engine ()
    (completing-read "Search Engine: "
                     (make-search-engine-name-list) nil t))

  (defun search-web-set-default-engine ()
    (interactive)
    (let* ((completion-ignore-case t)
           (engine (search-web-query-engine)))
      (setq search-web-default-engine_1 engine)))

  (defun search-web-dwim_1 (&optional engine)
    (interactive)
    (when (not engine)
      (setq-local engine
                  (if search-web-use-default-engine
                    search-web-default-engine_1
                    (search-web-query-engine))))
    (cond
     ((region-active-p)
      (let* ((beg (mark)) (end (point)))
        (search-web engine (buffer-substring-no-properties beg end))))
     (t (search-web engine (substring-no-properties (thing-at-point 'word))))))

  (defun search-web-entry_1 (arg)
    (interactive "p")
    (case arg
      (4 (let ((engine (search-web-query-engine)))
           (search-web-dwim_1 engine)))
      (t (search-web-dwim_1))))

  (global-set-key (kbd "M-s e") 'search-web-entry_1)
  (global-set-key (kbd "M-s s") 'search-web-set-default-engine))

  (defvar search-web-default-engine_2 "google")
  (defun search-web-set-default-engine ()
    (interactive)
    (let* ((completion-ignore-case t)
           (engine (search-web-query-engine)))
      (setq search-web-default-engine_2 engine)))

  (defun search-web-dwim_2 (&optional engine)
    (interactive)
    (when (not engine)
      (setq-local engine
                  (if search-web-use-default-engine
                    search-web-default-engine_2
                    (search-web-query-engine))))
    (cond
     ((region-active-p)
      (let* ((beg (mark)) (end (point)))
        (search-web engine (buffer-substring-no-properties beg end))))
     (t (search-web engine (substring-no-properties (thing-at-point 'word))))))

  (defun search-web-entry_2 (arg)
    (interactive "p")
    (case arg
      (4 (let ((engine (search-web-query-engine)))
           (search-web-dwim_2 engine)))
      (t (search-web-dwim_2))))

  (global-set-key (kbd "M-s g") 'search-web-entry_2)

