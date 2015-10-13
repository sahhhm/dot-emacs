;;ledger
;;(load "ledger")

;; for pdflatex
(setq exec-path (append exec-path '("/usr/bin")) )

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))


;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

(require 'sane-defaults)

;; Setup extensions
(require 'setup-ido)
(require 'setup-ledger)
(require 'setup-org)
;;(eval-after-load 'ido '(require 'setup-ido))


(require 'mode-mappings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ledger-reports (quote (("value" "ledger ") ("balance" "ledger ") ("bal" "ledger -f %(ledger-file) bal") ("reg" "ledger -f %(ledger-file) reg") ("payee" "ledger -f %(ledger-file) reg @%(payee)") ("account" "ledger -f %(ledger-file) reg %(account)")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t) 
  ))

