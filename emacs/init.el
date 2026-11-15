;; ******** STARTUP ********  -*- lexical-binding: t; -*-
;; -------- splash screen -------
(setq inhibit-startup-message t) ; Disable startup message

;; Allow lisp scripts to be loaded
(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

;; move autosaves to user-emacs-directory/auto-save
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "auto-save/" user-emacs-directory) t)))

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
  :custom
  (doom-themes-enable bold t)
  (doom-themes enable-italic t)
  :config

  (doom-modeline-mode 1))



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

(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))


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
   '(company cyberpunk-theme doom-modeline doom-themes evil-collection
	     evil-indent-textobject evil-leader evil-org evil-surround
	     general magit solarized-theme vertico)))
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
