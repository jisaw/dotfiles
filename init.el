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


;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)
(tool-bar-mode -1)
(global-linum-mode)

;; global keybindings
(global-unset-key (kbd "C-z"))

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

(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'use-package)

(use-package which-key
  :ensure t
  :config (which-key-mode))


(use-package evil
  :ensure t
  :config (define-key evil-normal-state-map "\C-y" 'yank)
          (define-key evil-insert-state-map "\C-y" 'yank)
          (define-key evil-visual-state-map "\C-y" 'yank)
          (define-key evil-insert-state-map "\C-e" 'end-of-line)
          (define-key evil-normal-state-map "\C-w" 'evil-delete)
          (define-key evil-insert-state-map "\C-w" 'evil-delete)
          (define-key evil-insert-state-map "\C-r" 'search-backward)
          (define-key evil-visual-state-map "\C-w" 'evil-delete)
          (evil-mode 1)
)

(use-package projectile
  :ensure t
  :config (projectile-global-mode))
  
(use-package helm
  :ensure t
  :config (setq projectile-completion-system 'helm))

(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))

(use-package autopair
  :ensure t
  :config (autopair-global-mode))

(use-package material-theme
  :ensure t
  :config (load-theme 'material t))

(use-package scala-mode
  :ensure t
  :interpreter ("scala" . scala-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

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
 '(package-selected-packages
   (quote
    (markdown-mode autopair scala-mode helm-projectile projectile helm evil material-theme which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
