(global-linum-mode 1)

; (set-default-font "Inconsolata 16")

; Have a caret rather than a box
(setq-default cursor-type 'bar)

; No startup screen http://www.gnu.org/software/emacs/manual/html_node/emacs/Entering-Emacs.html
(setq inhibit-startup-screen t
      initial-scratch-message nil
      create-lockfiles nil
      make-backup-files nil)

(global-subword-mode 1)
(global-auto-revert-mode 1)
(tool-bar-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(when (not package-archive-contents) (package-refresh-contents))

(smartparens-global-mode t)
(show-smartparens-global-mode t)

(sp-pair "'" nil :actions :rem)
(sp-pair "(" ")" :wrap "C-(")
(sp-pair "{" "}" :wrap "C-{")
(sp-local-pair 'scala-mode "(" nil :post-handlers '(("||\n[i]" "RET")))
(sp-local-pair 'scala-mode "{" nil :post-handlers '(("||\n[i]" "RET") ("| " "SPC")))

(global-hl-line-mode)

; Highlight the current cursor line
(set-face-background hl-line-face "cornsilk")

; F9 brings up this .emacs file
(global-set-key [f9] (lambda () (interactive) (find-file user-init-file)))

; F2 brings up my todo list
(global-set-key [f2] (lambda () (interactive) (find-file "/Users/noel/dev/noel/todo/todo.org")))

(put 'set-goal-column 'disabled nil)

; Allow hash to be entered
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

(setq backup-directory-alist '(("." . "~/.emacssaves")))
(setq make-backup-files nil)

(setq vc-follow-symlinks t)
(setq column-number-mode t)

; Expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

; Multiple cursors
(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

; Helm - http://tuhdo.github.io/helm-intro.html
(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

; Company
(add-hook 'after-init-hook 'global-company-mode)

; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-unset-key (kbd "s-g"))
(global-set-key (kbd "s-g") 'magit-status)

(setq git-commit-style-convention-checks nil)

; Diff HL
(require 'diff-hl)
(add-hook 'after-init-hook 'global-diff-hl-mode)

; Rainbow delimiters
; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

; Added by Magit
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-stylish-on-save t)
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(magit-pull-arguments (quote ("--rebase")))
 '(package-selected-packages
   (quote
    (helm-company purescript-mode company magit haskell-mode helm-ag yasnippet use-package smartparens multiple-cursors helm-projectile expand-region diff-hl))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(projectile-global-mode)
(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)
;(setq projectile-enable-caching t)
(global-set-key (kbd "s-s") 'helm-projectile-ag)
(add-to-list 'projectile-globally-ignored-directories ".ensime_cache")
(add-to-list 'projectile-globally-ignored-directories "project/target")
(add-to-list 'projectile-globally-ignored-directories "project/project/target")
(add-to-list 'projectile-globally-ignored-directories "target")
(add-to-list 'projectile-globally-ignored-directories ".sass-cache")
(add-to-list 'projectile-globally-ignored-files ".ensime")
;(setq projectile-globally-ignored-file-suffixes ".class") ; this does not seem to work
(add-to-list 'projectile-globally-ignored-file-suffixes ".hi")
(add-to-list 'projectile-globally-ignored-file-suffixes ".o")

(global-set-key (kbd "M-.") 'helm-etags-select)

; Scroll without moving cursor
(global-set-key (kbd "M-<down>") "\C-u1\C-v")
(global-set-key (kbd "M-<up>") "\C-u1\M-v")

; Show full file path
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(global-set-key [f12] 'show-file-name)

(global-unset-key (kbd "s-t")) ; stop the annoying font popup whenever I think I'm in Chrome and trying to open a new tab

(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-0") 'delete-window)

(global-unset-key (kbd "s-l"))
(global-set-key (kbd "s-l") 'sbt-send-region)

(global-unset-key (kbd "s-o"))
(global-set-key (kbd "s-o") 'other-window)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

; Overwrite highlighted section
(delete-selection-mode 1)

; Haskell mode indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)



(setq haskell-hoogle-url "https://www.stackage.org/lts-8.15/hoogle?q=%s")
(global-set-key [f5] 'hoogle)

; yasnippet
(yas-global-mode 1)

;; (setq yas-snippet-dirs
;;       '("~/dev/noel/dotfiles/snippets"))

; comment or uncomment region
(global-set-key (kbd "s-;") 'comment-or-uncomment-region)

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq mac-control-modifier 'control)

(setq css-indent-offset 2)
