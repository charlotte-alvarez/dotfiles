;;; keybindings.el --- Custom keybindings

(defmacro my/setup-leader-keybindings (definer keymap)
  `(,definer
    :keymaps ,keymap

    "f" '("Find" . (keymap))
    "ff" '("project - file" . project-find-file)
    "fF" '("open file right" . find-file)
    "fl" '("open file right" . find-file-other-window)
    "fb" '("bookmarks" . bookmark-jump)
    "fB" '("set bookmark" . bookmark-set)
    "f C-b" '("list bookmarks" . bookmark-bmenu-list)
    "fr" '("project - regex" . project-find-regexp)
    "ft" '("terminal" . vterm-other-window)
	

    "b" '("Buffer" . (keymap))
    "bb" '("switch" . ido-switch-buffer)
    "bm" '("messages" . view-echo-area-messages)
    "bm" '("scratch" . scratch-buffer)
    "bl" '("open right" . switch-to-buffer-other-window)
    "bq" '("kill buffer" . kill-buffer)

    "w" '("Window" . (keymap))
    "wq" '("delete window" . delete-window)
    "wQ" '("delete other windows" . delete-other-windows)
    "wJ" '("split below" . split-window-below)
    "wL" '("split right" . split-window-right)
    "wl" '("go right" . windmove-right)
    "wj" '("go down" . windmove-down)
    "wk" '("go up" . windmove-up)
    "wh" '("go left" . windmove-left)
    "w <down>" '("shrink" . shrink-window-if-larger-than-buffer)
    "w <up>" '("lengthen" . enlarge-window)
    "w <left>" '("narrow" . shrink-window-horizontally)
    "w <right>" '("widen" . enlarge-window-horizontally)
    "wf" '("File" . (keymap))
    "wfl" '("open right" . find-file-other-window)
    "wb" '("Buffer" . (keymap))
    "wbl" '("open right" . switch-to-buffer-other-window)

    "h" '("Help" . (keymap))
    "hp" '("list packages" . finder-by-keyword)
    "hk" '("describe key" . describe-key)
    "hc" '("describe key briefly" . describe-key-briefly)
    "hf" '("function" . describe-function)
    "hi" '("info" . info)
    "hl" '("last keystrokes" . view-lossage)
    "hn" '("news" . view-emacs-news)
    "ho" '("symbol" . describe-symbol)
    "hP" '("package details" . describe-package)
    "hv" '("variable" . describe-variable)
    "hw" '("command keybind" . where-is)
    "hx" '("command documentation" . describe-command)
    "hF" '("info - command" . Info-goto-emacs-command-node)
    "hK" '("info - key" . Info-goto-emacs-key-command-node)
    "hK" '("info - key" . Info-goto-emacs-key-command-node)
    "hS" '("info - symbol" . info-lookup-symbol)
    "hb" '("keybinds for buffer" . describe-bindings)

    "d" '("Dired" . (keymap))
    "dd" '("project - open dired" . project-find-dir)
    "dD" '("open dired" . dired)

    "e" '("Eglot" . (keymap))
    "ed" '("goto definition" . xref-find-definitions)
    "er" '("show references" . xref-find-references)
    "eR" '("find-and-replace" . xref-find-references-and-replace)

    "p" '("Python" . (keymap))
    "pj" '("goto next problem" . flymake-goto-next-error)
    "pk" '("goto prev problem" . flymake-goto-prev-error)
    "pd" '("documentation" . elpy-doc)

    "P" '("Projects" . (keymap))
    "PP" '("switch" . project-switch-project)
    "Pr" '("remember" . project-remember-projects-under)

    "g" '("Magit" . (keymap))
    "gg" '("status buffer" . magit-status)

    ))

(provide 'keybindings)
;;; keybindings.el ends here
