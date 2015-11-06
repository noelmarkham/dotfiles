; -*- mode: Emacs-Lisp;-*-
(global-linum-mode 1)

(set-default-font "Inconsolata 13") ; Requires Inconsolata installed in the OS

; Have a caret rather than a box
(setq-default cursor-type 'bar)

; No startup screen http://www.gnu.org/software/emacs/manual/html_node/emacs/Entering-Emacs.html
(setq inhibit-startup-screen 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(when (not package-archive-contents) (package-refresh-contents))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(unless (package-installed-p 'scala-mode2) (package-refresh-contents) (package-install 'scala-mode2))

(setq ensime-sem-high-faces
  '((implicitConversion . (:underline (:style line :color "light gray")))
    (implicitParams . (:underline (:style line :color "light gray")))))

(smartparens-global-mode t) ; TODO should I be using paredit?
(sp-pair "'" nil :actions :rem)

(global-hl-line-mode)

; Highlight the current cursor line
(set-face-background hl-line-face "cornsilk")

(require 'neotree)
; F8 brings up neotree
;(global-set-key [f8] 'neotree-toggle)

(require 'org)

; F9 brings up this .emacs file
(global-set-key [f9] (lambda () (interactive) (find-file user-init-file)))

(put 'set-goal-column 'disabled nil)

; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

(setq backup-directory-alist `(("." . "~/.emacssaves")))

(setq vc-follow-symlinks t)

(setq column-number-mode t)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

; Expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

; Multiple cursors
(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-more-like-this-extended)

; Helm
(require 'helm)
(helm-mode 1)

; Company
(add-hook 'after-init-hook 'global-company-mode)

; Magit
(global-set-key (kbd "C-x g") 'magit-status)
