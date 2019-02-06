;; global variables
(setq
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
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
(require 'bind-key)

(use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package org
  :ensure t
  :config
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t
        org-agenda-files '("~/org"))
  (setq org-agenda-custom-commands
        '(("a" "Simple agenda view"
           ((agenda "")
            (todo "" ((org-agenda-todo-ignore-scheduled 'all)))))))
  )


;;(use-package powerline
;; :ensure t
;; :config (powerline-default-theme))

(use-package all-the-icons
  :ensure t)

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-city-lights t)
  (doom-themes-visual-bell-config))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))


(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package go-mode
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package json-reformat
  :ensure t)

(use-package aggressive-indent
  :ensure t
  :config (global-aggressive-indent-mode
           (add-to-list 'aggressive-indent-excluded-modes 'html-mode)))

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package projectile
  :demand 
  :ensure t
  :init (setq projectile-use-git-grep t)
  :config (projectile-global-mode  
           (setq projectile-indexing-method 'alien))
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package helm
  :ensure t
  :config (setq projectile-completion-system 'helm)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "M-y") #'helm-show-kill-ring)
  (global-set-key (kbd "C-x C-b") #'helm-mini)
  (defun er-switch-to-previous-buffer ()
    "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
    (interactive)
    (switch-to-buffer (other-buffer (current-buffer) 1)))
  (global-set-key (kbd "C-x b") 'er-switch-to-previous-buffer)
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t))

(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq projectile-switch-project-action 'magit-status))

(use-package undo-tree
  :config (global-undo-tree-mode))

(use-package smartparens
  :ensure t
  :config (require 'smartparens-config
                   smartparens-strict-mode
                   smartparens-global-mode))

(use-package smartparens
  :commands
  smartparens-strict-mode
  smartparens-mode
  sp-restrict-to-pairs-interactive
  sp-local-pair
  :init
  (setq sp-interactive-dwim t)
  :config
  (smartparens-global-mode t)
  (require 'smartparens-config)
  
  ;; WORKAROUND https://github.com/Fuco1/smartparens/issues/543
  (bind-key "C-<left>" nil smartparens-mode-map)
  (bind-key "C-<right>" nil smartparens-mode-map)

  (bind-key "s-<delete>" 'sp-kill-sexp smartparens-mode-map)
  (bind-key "s-<backspace>" 'sp-backward-kill-sexp smartparens-mode-map))


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

(use-package highlight-symbol
  :commands highlight-symbol
  :init (bind-key* "C-;" 'highlight-symbol))

(use-package popup-imenu
  :commands popup-imenu
  :bind ("M-i" . popup-imenu))

(use-package smex
  :ensure t
  :config (smex-initialize)
  ;; (global-set-key (kbd "M-x") 'smex)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "a5956ec25b719bf325e847864e16578c61d8af3e8a3d95f60f9040d02497e408" "ec5f761d75345d1cf96d744c50cf7c928959f075acf3f2631742d5c9fe2153ad" "62c81ae32320ceff5228edceeaa6895c029cc8f43c8c98a023f91b5b339d633f" "f27c3fcfb19bf38892bc6e72d0046af7a1ded81f54435f9d4d09b3bff9c52fc1" "b46ee2c193e350d07529fcd50948ca54ad3b38446dcbd9b28d0378792db5c088" default)))
 '(package-selected-packages
   (quote
    (neotree doom-themes all-the-icons-dired doom-modeline darktooth darktooth-theme gruvbox-theme dracula-theme ample-theme powerline cider clojure-mode-extra-font-locking clojure-mode paredit smex popup-imenu highlight-symbol ido-completing-read+ markdown-mode ensime scala-mode auto-complete sbt-mode magit helm-projectile projectile which-key use-package undo-tree smartparens rainbow-mode rainbow-delimiters json-mode helm groovy-mode go-mode expand-region aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
