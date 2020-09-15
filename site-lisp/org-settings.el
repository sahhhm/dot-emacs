;; needed for org-mode
;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;I set up org-mode to generate unique attachment IDs with
;;org-id-method as follows: 
(setq org-id-method (quote uuidgen))
(setq org-read-date-popup-calendar nil)


