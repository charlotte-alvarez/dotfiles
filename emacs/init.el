;; ******** STARTUP ********  -*- lexical-binding: t; -*-

;; -------- PACKAGE MANAGEMENT ---------
;; ******** PACKAGE MANAGEMENT ********

(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(package-initialize)

;; Refresh package metadata only when necessary
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if missing
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

;; Automatically install packages declared with :ensure t
(setq use-package-always-ensure t)


;; -------- splash screen -------
(setq inhibit-startup-message t) ; Disable startup message

;; Allow lisp scripts to be loaded
(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

;; Store auto-save files in ~/.emacs.d/auto-save/
(let ((auto-save-dir (expand-file-name "auto-save/" user-emacs-directory)))
  (make-directory auto-save-dir t)
  (setq auto-save-file-name-transforms
        `((".*" ,auto-save-dir t))))

;; disable backup files
(setq make-backup-files nil)


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
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-themes-enable bold t)
  (doom-themes enable-italic t))



;; ---------- EDITOR THEMES ------------
(use-package solarized-theme :ensure t)
(use-package cyberpunk-theme :ensure t)
(use-package doom-themes
  :ensure t
  :config
  ;;(load-theme 'doom-molokai t)
  ;;(load-theme 'doom-badger t)
  ;;(load-theme 'doom-dark+ t)
  (load-theme 'doom-1337 t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

;; ---------- EDITOR INTERACTION -----------
(ido-mode t) ; Always display suggestions when in command mode
(setq scroll-margin 20) ; 20 lines starts scrolling
(setq-default tabl-width 4)




;; ------------ LSP --------
(use-package eglot
  :ensure t
  :defer t
  :hook (python-mode . eglot-ensure))


;; ---------- WHICH-KEY -----------
(which-key-mode 1)
(setq which-key-idle-delay 0.5)


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
  (require 'keybindings) ;; keybindings in ./keybindings.el

  (general-create-definer space-leader-definer
    :prefix "SPC")

  (general-create-definer space-leader-definer-local
    :prefix "C-SPC")

  (my/setup-leader-keybindings space-leader-definer 'normal)
  (my/setup-leader-keybindings space-leader-definer-local 'override))


;; -------- MAGIT --------
(use-package magit :ensure t)


;; ------- NERD-ICONS --------
(use-package nerd-icons
  :ensure t
  :config
  (setq nerd-icons-font-family "JetBrainsMono Nerd Font"))


;; ------- ELPY ----------
(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (add-hook 'elpy-mode-hook (lambda ()
			      (add-hook 'before-save-hook
					'elpy-format-code nil t))))


;; ------- LIBVTERM -------
(use-package vterm
  :ensure t
  :config
  (defun my-vterm-exit-hook (buffer event)
    (message "Terminal exited with event: %s" event)
    (delete-window))
  (add-hook 'vterm-exit-functions 'my-vterm-exit-hook))




    (custom-set-variables
     ;; custom-set-variables was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(package-selected-packages
       '(cyberpunk-theme doom-modeline doom-themes elpy evil-collection
			 evil-surround general magit solarized-theme vterm)))
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     )
