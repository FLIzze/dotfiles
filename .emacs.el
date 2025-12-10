;; ------
;; | UI |
;; ------

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(setq make-backup-files nil)

(setq visible-bell nil)

(set-frame-font "0x Proto Nerd Font 18" nil t)

(setq auto-save-default nil)

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(global-set-key (kbd "C-c r") #'compile)

;; -----------------
;; | Packages / UI |
;; -----------------

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-conents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

(defvar my-consult-map (make-sparse-keymap))
(define-key global-map (kbd "C-g") my-consult-map)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default standard-indent 4)

;; -----------
;; | CONSULT |
;; -----------

(use-package consult
  :config)

(defvar my-search-map (make-sparse-keymap)
  "Keymap for search commands.")

(define-key global-map (kbd "C-,") my-search-map)

(define-key my-search-map (kbd "f") #'consult-find)
(define-key my-search-map (kbd "g") #'consult-ripgrep)
(define-key my-search-map (kbd "d") #'consult-flymake)
(define-key my-search-map (kbd "y") #'consult-yank-pop)
(define-key my-search-map (kbd "w") #'consult-buffer-other-window)

(setq consult-find-args "fd --type f")

;; ----------
;; | MAGGIT |
;; ----------

(defvar my-git-map (make-sparse-keymap))
(define-key global-map (kbd "C-g") my-git-map)

(define-key my-git-map (kbd "s") 'magit-status)
(define-key my-git-map (kbd "a") 'magit-stage)
(define-key my-git-map (kbd "c") 'magit-commit)
(define-key my-git-map (kbd "p") 'magit-push)
(define-key my-git-map (kbd "u") 'magit-pull)
(define-key my-git-map (kbd "d") 'magit-diff)
(define-key my-git-map (kbd "l") 'magit-log)
(define-key my-git-map (kbd "b") 'magit-branch)
(define-key my-git-map (kbd "m") 'magit-merge)
(define-key my-git-map (kbd ".") 'magit-file-dispatch)

(load-theme 'tango-dark)

;; -------
;; | LSP |
;; -------

(use-package eglot
  :ensure t
  :hook ((go-mode python-mode typescript-mode c-mode c++-mode js-mode web-mode) . eglot-ensure))

(use-package go-mode :ensure t)
(use-package typescript-mode :ensure t)
(use-package web-mode :ensure t)

(add-hook 'go-mode-hook (lambda () (setq indent-tabs-mode t)))
(add-hook 'python-mode-hook (lambda () (setq python-indent-offset 4)))
(add-hook 'typescript-mode-hook (lambda () (setq typescript-indent-level 4)))

(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-markup-indent-offset 4)
            (setq web-mode-css-indent-offset 4)
            (setq web-mode-code-indent-offset 4)))

;; (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
;; (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))
;; (add-to-list 'eglot-server-programs '((typescript-mode web-mode) . ("typescript-language-server" "--stdio")))
;; (add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd")))

(defvar my-lsp-map (make-sparse-keymap))
(define-key global-map (kbd "C-.") my-lsp-map)

(define-key my-lsp-map (kbd "d") #'eglot-find-declaration)
(define-key my-lsp-map (kbd "D") #'eglot-find-definition)
(define-key my-lsp-map (kbd "r") #'eglot-find-references)
(define-key my-lsp-map (kbd "a") #'eglot-code-actions)
(define-key my-lsp-map (kbd "R") #'eglot-rename)
(define-key my-lsp-map (kbd "f") #'eglot-format)

(define-key my-lsp-map (kbd "n") #'flymake-goto-next-error)
(define-key my-lsp-map (kbd "p") #'flymake-goto-prev-error)

;; -------
;; | ORG |
;; -------

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
