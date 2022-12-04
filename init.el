;; Install Melpa package manager
(require 'package)
(require 'use-package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Don't show the splash screen
(setq inhibit-startup-message t ; Don't show the splash screen
      visible-bell t)           ; Flash when the bell rings

;; Turn off some unneeded UI elements
;; (menu-bar-mode -1) ; Leave this one if you're a beginner
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;; Set font size
(set-frame-font "Monospace 20" nil t)

;; evil mode - Vim bindings
(require 'evil)
(evil-mode 1)
;; doom themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-vibrant t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Neotree config
(require 'neotree)
(global-set-key [?\C-t] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; LSP - Language Server
(setq lsp-keymap-prefix "s-l")
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)
;; Customize completion-at-point
(setq tab-always-indent nil)

;; Set tab width
(setq-default tab-width 1)
;; turn off electric indentation mode ;; new line + auto indent
(electric-indent-mode t)
;; tell emacs to never use tab characters for indentation
(setq indent-tabs-mode t)
(setq indent-line-function 'insert-tab)
(setq js-indent-level 2)

;; web-mode for js / jsx syntax highlighting
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
;; prettier js for auto save formatting
(defun web-mode-init-prettier-hook ()
  (add-node-modules-path)
  (prettier-js-mode))

(add-hook 'web-mode-hook  'web-mode-init-prettier-hook)

;; fzf key-binding
(global-set-key [?\s-p] 'fzf)

;; powerline bottom bar theme
;;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline-master")
;;(require 'powerline)
;;(require 'cl)
;;(setq powerline-arrow-shape 'arrow)   ;; the default
;;(custom-set-faces
;; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
;;(setq powerline-color1 "grey22")
;;(setq powerline-color2 "grey40")

;; prevent ~ and # files from being created
(setq make-backup-files nil)
(setq create-lockfiles nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
			'("37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf" default))
 '(package-selected-packages
			'(fzf add-node-modules-path prettier-js web-mode vterm company lsp-mode all-the-icons neotree doom-themes evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
