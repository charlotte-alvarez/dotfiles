;; Disable package.el at startup, since we are using Elpaca
(setq package-enable-at-startup nil)

;; Inhibit splash & startup screens
(setq inhibit-splash-screen t
      inhibit-startup-screen t)

;; Disable menubar, toolbar, scrollbar
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
