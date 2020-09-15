(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)


;; for pdflatex
;;(setq exec-path (append exec-path '("/usr/bin")) )

;;; Functions
(eval-and-compile
  (defun emacs-path (path)
    (expand-file-name path user-emacs-directory)))

;;; Environment
(eval-and-compile
  (defconst emacs-environment (getenv "NIX_MYENV_NAME"))

  (setq load-path
        (append
                (delete-dups load-path)
                '("~/.emacs.d/site-lisp")))

  (require 'use-package)

  (if init-file-debug
      (setq use-package-verbose t
            use-package-expand-minimally nil
            use-package-compute-statistics t
            debug-on-error t)
    (setq use-package-verbose nil
          use-package-expand-minimally t)))

;;; Settings
(eval-and-compile
  (load (emacs-path "sane-defaults")))

(eval-and-compile
  (load (emacs-path "setup-org")))

(use-package ivy
  :diminish
  :demand t
  :custom
    (ivy-use-virtual-buffers t)
    (ivy-count-format "(%d/%d) ")
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("M-H"   . ivy-resume))
  :config
    (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :demand t
  :config
    (ivy-rich-mode 1)
    (setq ivy-virtual-abbreviate 'full
        ivy-rich-path-style 'abbrev))

(use-package swiper
  :after ivy
  :bind ("C-M-s" . swiper)
  :bind (:map swiper-map
              ("M-y" . yank)
              ("M-%" . swiper-query-replace)
              ("C-." . swiper-avy)
              ("M-c" . swiper-mc))
  :bind (:map isearch-mode-map
              ("C-o" . swiper-from-isearch)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-ledger
  :ensure t)

(use-package ispell
  :no-require t
  :bind (("C-c i c" . ispell-comments-and-strings)
         ("C-c i d" . ispell-change-dictionary)
         ("C-c i k" . ispell-kill-ispell)
         ("C-c i m" . ispell-message)
         ("C-c i r" . ispell-region)))

(use-package flyspell
  :bind (("C-c i b" . flyspell-buffer)
         ("C-c i f" . flyspell-mode)))

(use-package ledger-mode
  :mode "\\.ledger\\'"
  :load-path "~/src/ledger-mode"
  :commands ledger-mode
  ;:init (setq ledger-binary-path "~/src/ledger/ledger")
  :config
  (add-hook 'ledger-mode-hook
          (lambda ()
            (setq-local tab-always-indent 'complete)
            (setq-local completion-cycle-threshold t)
            (setq-local ledger-complete-in-steps t))))

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x G" . magit-status-with-prefix)))

;;theme
(load-theme 'zenburn t)
;;(load-theme 'nord t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit doom-themes nord-theme ivy-rich helm-flyspell counsel snazzy-theme sunburn-theme zenburn-theme gruvbox-theme dracula-theme flycheck-ledger flycheck use-package org-chef helm elpy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
