(global-linum-mode 1)
(global-subword-mode 1)
(global-auto-revert-mode 1)
(tool-bar-mode -1)
(global-hl-line-mode)

(set-face-background hl-line-face "cornsilk")

(setq cursor-type 'bar
      inhibit-startup-screen t
      create-lockfiles nil
      make-backup-files nil
      vc-follow-symlinks t
      column-number-mode t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq mac-control-modifier 'control)

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (sp-pair "(" ")" :wrap "C-(")
  (sp-pair "{" "}" :wrap "C-{")
  (sp-local-pair 'scala-mode "(" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'scala-mode "{" nil :post-handlers '(("||\n[i]" "RET") ("| " "SPC"))))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-more-like-this-extended))

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-indexing-method 'alien)
  (global-set-key (kbd "s-s") 'helm-projectile-ag)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map))

(use-package magit
  :ensure t)

(use-package rainbow-delimiters
  :ensure t)

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C-+") 'er/contract-region))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (smartparens-strict-mode t)
	    (show-smartparens-global-mode t)
	    (rainbow-delimiters-mode-enable)))

(add-hook 'scala-mode
	  (lambda ()
	    (show-smartparens-global-mode t)
	    (smartparens-strict-mode t)))
