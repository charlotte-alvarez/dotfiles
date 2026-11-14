;; ******** STARTUP ********
;; -------- splash screen -------
(setq inhibit-startup-message t) ; Disable startup message


;; ********* WINDOW **************
;; --------- WINDOW APPEARANCE -----------
(tool-bar-mode -1) ; Disable toolbar
(scroll-bar-mode -1) ; Disable scrollbar
(menu-bar-mode -1) ; Disable menu bar
(setq visible-bell 1) ; Disable the bell


;; ********** EDITOR ************
;; ---------- EDITOR APPEARANCE -----------
(global-display-line-numbers-mode 1) ; Disable line numbers in every buffer
(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono-16"))


;; ---------- EDITOR THEMES ------------
(use-package solarized-theme :ensure t)
(use-package cyberpunk-theme :ensure t)
(load-theme 'solarized-selenized-black t)


;; ---------- EDITOR INTERACTION -----------
(ido-mode t) ; Always display suggestions when in command mode
(setq scroll-margin 20) ; 20 lines starts scrolling
(setq-default tabl-width 4)

;; ------------ EGLOT LSP --------
(use-package eglot
  :ensure t
  :defer t
  :hook (python-mode . eglot-ensure))


;; ---------- WHICH-KEY -----------
(which-key-mode 1)
(setq which-key-idle-delay 0.5)





;; ********* PACKAGES ********
;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)


;; -------- USE-PACKAGE -------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;; --------- EVIL -----------
(use-package evil
  :ensure t
  :init ;; tweak evil config before loading it
  (setq evil-want-keybinding nil) ; This is required for evil-collection
  (setq evil-want-C-u-scroll t) ; Allows C-u to scroll up
  (setq evil-shift-width 4)

  :config ;; tweak evil config after loading it
  (evil-mode 1)

  (use-package evil-surround
    :ensure t
    :config (global-evil-surround-mode)))

(use-package evil-collection
  :after evil
  :ensure t

  :config
  (evil-collection-init))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company cyberpunk-theme evil-collection evil-indent-textobject
	     evil-leader evil-org evil-surround general magit
	     solarized-theme vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ------ COMPANY ---------
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (add-to-list 'company-backends 'company-dabbrev-code) 
  (add-to-list 'company-backends 'company-yasnippet)
  (add-to-list 'company-backends 'company-files)
  )


;; ------ GENERAL ---------
(use-package general
  :ensure t
  :after evil evil-collection

  :config
  (general-create-definer space-leader-definer
    :prefix "SPC")
  (space-leader-definer
    :keymaps 'normal
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
    "dd" '("open dired" . dired)

    "e" '("Eglot" . (keymap))
    "ed" '("goto definition" . xref-find-definitions)
    "er" '("show references" . xref-find-references)
    "eR" '("find-and-replace" . xref-find-references-and-replace)

    "g" '("Magit" . (keymap))
    
    )
  )


;; -------- MAGIT --------
(use-package magit :ensure t)


