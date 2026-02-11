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
    indent-tabs-mode nil)

(defun my-c-mode-hook ()
    (setq c-basic-offset 4)
    (setq indent-tabs-mode nil))

(add-hook 'c-mode-hook 'my-c-mode-hook)

(setq python-indent-offset 4)
(setq lisp-indent-offset 4)
(setq emacs-lisp-indent-offset 4)

(use-package org-bullets
    :hook (org-mode . org-bullets-mode))

(use-package gruber-darker-theme
    :config
    (load-theme 'gruber-darker t))

(use-package multiple-cursors
    :ensure t)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c c") 'compile)

(require 'ob-mermaid)
(use-package ox-reveal
  :vc (:url "https://github.com/yjwen/org-reveal.git"
       :rev :newest)
  :after org)

(setq org-babel-load-languages
      '((emacs-lisp . t)
           (mermaid . t)
    (shell . t)))

(use-package exec-path-from-shell
  :ensure t
  :config
    (exec-path-from-shell-initialize))

(use-package dumb-jump
  :ensure t
  :config)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
