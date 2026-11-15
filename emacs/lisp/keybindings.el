;;; keybindings.el --- Custom keybindings

(defmacro my/setup-leader-keybindings (definer keymap)
  `(,definer
    :keymaps ,keymap

    "f" '("Find" . (keymap))
    "ff" '("file" . ido-find-file)
    "fl" '("open right" . find-file-other-window)

    "b" '("Buffer" . (keymap))
    "bb" '("switch" . ido-switch-buffer)
    "bm" '("messages" . view-echo-area-messages)

    "w" '("Window" . (keymap))
    "wq" '("delete window" . delete-window)
    "wQ" '("delete other windows" . delete-other-windows)
    "wJ" '("split below" . split-window-below)
    "wL" '("split right" . split-window-right)
    "wl" '("go right" . windmove-right)
    "wj" '("go down" . windmove-down)
    "wk" '("go up" . windmove-up)
    "wh" '("go left" . windmove-left)

    "h" '("Help" . (keymap))
    "hp" '("list packages" . finder-by-keyword)
    "hk" '("describe key" . describe-key)

    "d" '("Dired" . (keymap))
    "dd" '("open dired" . dired)

    "e" '("Eglot" . (keymap))
    "ed" '("goto definition" . xref-find-definitions)
    "er" '("show references" . xref-find-references)

    "g" '("Magit" . (keymap))
    "gg" '("status buffer" . magit-status)
    ))

(provide 'keybindings)
;;; keybindings.el ends here
