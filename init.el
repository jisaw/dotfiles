;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 initial-buffer-choice "~/.emacs.d/org/work.org"
 org-agenda-files (list "~/.emacs.d/org/work.org"
                        "~/.emacs.d/org/home.org")
 sentence-end-double-space nil)

(setq debug-on-error t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; Always load newest byte code
(setq load-prefer-newer t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 8
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)  
(global-linum-mode)

;; global keybindings
(global-unset-key (kbd "C-z"))

(eval-after-load "shell"
  '(define-key shell-mode-map (kbd "TAB") #'company-complete))
(add-hook 'shell-mode-hook #'company-mode)

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package json-mode
  :ensure t)

(use-package json-reformat
  :ensure t)

(use-package dirtree
  :ensure t)

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

(use-package which-key
  :ensure t
  :config (which-key-mode))


;;(use-package evil
;;  :ensure t
;;  :config (define-key evil-normal-state-map "\C-y" 'yank)
;;          (define-key evil-insert-state-map "\C-y" 'yank)
;;          (define-key evil-visual-state-map "\C-y" 'yank)
;;          (define-key evil-insert-state-map "\C-e" 'end-of-line)
;;          (define-key evil-normal-state-map "\C-w" 'evil-delete)
;;          (define-key evil-insert-state-map "\C-w" 'evil-delete)
;;          (define-key evil-insert-state-map "\C-r" 'search-backward)
;;          (define-key evil-visual-state-map "\C-w" 'evil-delete)
;;          (evil-mode 1)
;;)

(use-package projectile
  :ensure t
  :config (projectile-global-mode
           (setq projectile-indexing-method 'alien)))

(use-package helm
  :ensure t
  :config (setq projectile-completion-system 'helm)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "M-y") #'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") #'helm-mini)
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t))

(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))

(use-package magit
  :ensure t
  :config (global-set-key (kbd "C-x g") 'magit-status)
  )

(use-package autopair
  :ensure t
  :config (autopair-global-mode))

;;(use-package material-theme
;;  :ensure t
;;  :config (load-theme 'material t))

(use-package powerline
  :ensure t
  :config (powerline-default-theme))

(use-package ample-theme
  :ensure t
  :config (load-theme 'ample-flat t t))

(use-package groovy-mode
  :ensure t
  :interpreter ("groovy" . groovy-mode))

;; Scala

(use-package sbt-mode
  :commands sbt-start sbt-command
  :pin melpa-stable
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package auto-complete
  :ensure t
  :config (ac-config-default))

(use-package scala-mode
  :ensure t
  :pin melpa-stable
  :interpreter ("scala" . scala-mode))

(use-package ensime
  :ensure t
  :pin melpa-stable)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

(use-package ido
  :ensure t
  :config (ido-mode 1)
  (ido-everywhere 1))

(use-package ido-completing-read+
  :ensure t
  :config (ido-ubiquitous-mode 1))

(use-package smex
  :ensure t
  :config (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;; Clojure
(use-package paredit
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package clojure-mode-extra-font-locking
  :ensure t)

(use-package cider
  :ensure t)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(org-agenda-files
   (quote
    ("~/.emacs.d/org/work.org" "~/.emacs.d/org/home.org")))
 '(package-selected-packages
   (quote
    (bash-completion dirtree json-mode powerline ample-theme omnisharp groovy-mode ## ensime xref-js2 js2-refactor js2-mode aainbow-mode rainbow-delimiters markdown-mode autopair scala-mode helm-projectile projectile helm evil material-theme which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
