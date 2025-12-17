(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(set-frame-font "IosevkaTerm Nerd Font 23" nil t)

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(global-set-key (kbd "C-c c") 'compile)

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
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

(use-package magit)

(setq-default
 tab-width 4
 standard-indent 4
 indent-tabs-mode nil)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(load-theme 'gruber-darker)

(use-package eglot
  :commands eglot
  :hook
  ((go-mode
    python-mode
    typescript-mode
    js-mode
    js-ts-mode
    typescript-ts-mode
    web-mode
    svelte-mode
    yaml-mode) . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (add-to-list 'eglot-server-programs
               '((typescript-mode js-mode js-ts-mode typescript-ts-mode web-mode)
                 . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(python-mode . ("pyright-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(svelte-mode . ("svelteserver" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(yaml-mode . ("yaml-language-server" "--stdio")))
  (setq eglot-confirm-server-initiated-edits nil))

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.svelte\\'" . web-mode)
         ("\\.jsx?\\'" . web-mode)
         ("\\.tsx?\\'" . web-mode))
  :hook ((web-mode . (lambda ()
                       (when (string-equal "svelte" (file-name-extension buffer-file-name))
                         (eglot-ensure)))))
  :config
  (setq web-mode-enable-auto-quoting nil))

(use-package svelte-mode
  :mode "\\.svelte\\'"
  :hook (svelte-mode . eglot-ensure))

(use-package multiple-cursors
  :ensure t)

(use-package multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package company
  :bind ("C-c n" . company-complete)
  :config
  (setq company-idle-delay nil))

(require 'company-quickhelp)

(global-company-mode 1)
(company-quickhelp-mode 1)

;; (global-whitespace-mode 0)
;; (setq whitespace-style '(face tabs spaces trailing tab-mark space-mark))

;; (add-hook 'org-mode-hook (lambda () (whitespace-mode -1)))
