(bundle undo-tree)

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (global-set-key (kbd "M-/") 'undo-tree-redo)
  )

  ;; C-x u でundo-tree
  ;; M-/ でredo
  ;; undo-treeのバッファでqで終了. dで差分表示

