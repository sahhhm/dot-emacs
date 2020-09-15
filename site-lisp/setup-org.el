(eval-and-compile
  (require 'cl-lib)
  (require 'use-package)
  (setq use-package-verbose nil)
  (setq use-package-expand-minimally t)
  (load "org-settings"))

(require 'org)
(require 'org-agenda)

(setq org-agenda-files (quote ("~/org")))

;;;_ . keybindings
(bind-keys :map org-mode-map
           ("C-c c" . org-capture))


;; org-chef (https://github.com/Chobbes/org-chef)
(use-package org-chef :ensure t)
(setq org-chef-prefer-json-ld t)
(setq org-capture-templates
      '(("c" "Cookbook" entry (file "~/org/cookbook.org")
         "%(org-chef-get-recipe-from-url)"
         :empty-lines 1)
        ("m" "Manual Cookbook" entry (file "~/org/cookbook.org")
         "* %^{Recipe title: }\n  :PROPERTIES:\n  :source-url:\n  :servings:\n  :prep-time:\n  :cook-time:\n  :ready-in:\n  :END:\n** Ingredients\n   %?\n** Directions\n\n")))


;; (defun bh/switch-to-scratch ()
;;   (interactive)
;;   (switch-to-buffer "*scratch*"))

;; ; tag inheritance (see: http://orgmode.org/worg/agenda-optimization.html)
;; (setq org-tags-exclude-from-inheritance '("SIGNOFF"))
;; ;(setq org-agenda-use-tag-inheritance nil)


;; ;;; start Org Habit Settings

;; (setq org-habit-preceding-days 21
;;       org-habit-following-days 14
;;       org-habit-graph-column 40)

;; ;If non-nil, only show habits on today's agenda, and not for future days.
;; ;Note that even when shown for future days, the graph is always
;; ;relative to the current effective date.
;; (setq org-habit-show-habits-only-for-today nil)

;; ;If non-nil, will show the consistency graph of all habits on
;; ;today's agenda, even if they are not scheduled.
;; (setq org-habit-show-all-today t)

;; ;;; end Org Habit Settings

;; ; Enable habit tracking (and a bunch of other modules)
;; (setq org-modules (quote (org-bbdb
;;                           org-bibtex
;;                           org-crypt
;;                           org-gnus
;;                           org-id
;;                           org-info
;;                           org-jsinfo
;;                           org-habit
;;                           org-inlinetask
;;                           org-irc
;;                           org-mew
;;                           org-mhe
;;                           org-protocol
;;                           org-rmail
;;                           org-vm
;;                           org-wl
;;                           org-w3m)))

;; ;;
;; (setq org-agenda-span 'day)
;; (setq org-agenda-files (quote ("~/org")))
;; (setq org-todo-keywords
;;       (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
;;               (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|"
;; 			"CANCELLED(c@/!)" "PHONE" "MEETING"))))


;; (setq org-todo-keyword-faces
;;       (quote (("TODO" :foreground "red" :weight bold)
;;               ("NEXT" :foreground "blue" :weight bold)
;;               ("DONE" :foreground "forest green" :weight bold)
;;               ("WAITING" :foreground "orange" :weight bold)
;;               ("HOLD" :foreground "magenta" :weight bold)
;;               ("CANCELLED" :foreground "forest green" :weight bold)
;;               ("MEETING" :foreground "forest green" :weight bold)
;;               ("PHONE" :foreground "forest green" :weight bold))))

;; (setq org-use-fast-todo-selection t)

;; (setq org-todo-state-tags-triggers
;;       (quote (("CANCELLED" ("CANCELLED" . t))
;;               ("WAITING" ("WAITING" . t))
;;               ("HOLD" ("WAITING" . t) ("HOLD" . t))
;;               (done ("WAITING") ("HOLD"))
;;               ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
;;               ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
;;               ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; ;;SETUP FOR CAPTURE
;; (setq org-directory "~/org")
;; (setq org-default-notes-file "~/org/refile.org")

;; ;; I use C-c c to start capture mode
;; ;;(global-set-key (kbd "C-c c") 'org-capture)
;; (define-key global-map "\C-cc" 'org-capture)

;; ;; Capture templates for: TODO tasks, Notes, appointments, phone
;; ;; calls, meetings, and org-protocol
;; (setq org-capture-templates
;;       (quote (("t" "todo" entry (file "~/org/refile.org")
;;                "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
;;               ("n" "note" entry (file "~/org/refile.org")
;;                "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
;;               ("j" "Journal" entry (file+datetree "~/org/diary.org")
;;                "* %?\n%U\n" :clock-in t :clock-resume t)
;;               ("m" "Meeting" entry (file "~/org/refile.org")
;;                "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
;;               ("p" "Phone call" entry (file "~/org/refile.org")
;;                "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
;;               ("w" "org-protocol" entry (file "~/org/refile.org")
;;                "* TODO Review %c\n%U\n" :immediate-finish t)
;;               ("h" "Habit" entry (file "~/org/refile.org")
;;                "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))) 

;; ; Targets include this file and any file contributing to the agenda -
;; ; up to 9 levels deep
;; (setq org-refile-targets (quote ((nil :maxlevel . 9)
;;                                  (org-agenda-files :maxlevel . 9))))

;; ; Targets complete directly with IDO
;; (setq org-outline-path-complete-in-steps nil)

;; ; Allow refile to create parent tasks with confirmation
;; (setq org-refile-allow-creating-parent-nodes (quote confirm))

;; ; Use IDO for both buffer and file completion and ido-everywhere to t
;; (setq org-completion-use-ido t)
;; ;(setq ido-everywhere t)
;; ;(setq ido-max-directory-size 100000)
;; ;(ido-mode (quote both))
;; ; Use the current window when visiting files and buffers with ido
;; ;(setq ido-default-file-method 'selected-window)
;; ;(setq ido-default-buffer-method 'selected-window)
;; ; Use the current window for indirect buffer display
;; (setq org-indirect-buffer-display 'current-window)

;; ;;;; Refile settings
;; ; Exclude DONE state tasks from refile targets
;; (defun bh/verify-refile-target ()
;;   "Exclude todo keywords with a done state from refile targets"
;;   (not (member (nth 2 (org-heading-components)) org-done-keywords)))

;; (setq org-refile-target-verify-function 'bh/verify-refile-target)

;; (setq org-agenda-custom-commands
;;       (quote (("N" "Notes" tags "NOTE"
;;                ((org-agenda-overriding-header "Notes")
;;                 (org-tags-match-list-sublevels t)))
;;               ("h" "Habits" tags-todo "STYLE=\"habit\""
;;                ((org-agenda-overriding-header "Habits")
;;                 (org-agenda-sorting-strategy
;;                  '(todo-state-down effort-up category-keep))))
;;               (" " "Agenda"
;;                ((agenda "" nil)
;;                 (tags "REFILE"
;;                       ((org-agenda-overriding-header "Tasks to Refile")
;;                        (org-tags-match-list-sublevels nil)))
;;                 (tags-todo "-CANCELLED/!"
;;                            ((org-agenda-overriding-header "Stuck Projects")
;;                             (org-agenda-skip-function 'bh/skip-non-stuck-projects)
;;                             (org-agenda-sorting-strategy
;;                              '(priority-down category-keep))))
;;                 (tags-todo "-HOLD-CANCELLED/!"
;;                            ((org-agenda-overriding-header "Projects")
;;                             (org-agenda-skip-function 'bh/skip-non-projects)
;;                             (org-agenda-sorting-strategy
;;                              '(priority-down category-keep))))
;;                 (tags-todo "-CANCELLED/!NEXT"
;;                            ((org-agenda-overriding-header "Project Next Tasks")
;;                             (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
;;                             (org-tags-match-list-sublevels t)
;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-sorting-strategy
;;                              '(priority-down todo-state-down effort-up category-keep))))
;;                 (tags-todo "-REFILE-CANCELLED-WAITING/!"
;;                            ((org-agenda-overriding-header (if (marker-buffer org-agenda-restrict-begin) "Project Subtasks" "Standalone Tasks"))
;;                             (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-sorting-strategy
;;                              '(category-keep))))
;;                 (tags-todo "-CANCELLED+WAITING/!"
;;                            ((org-agenda-overriding-header "Waiting and Postponed Tasks")
;;                             (org-agenda-skip-function 'bh/skip-stuck-projects)
;;                             (org-tags-match-list-sublevels nil)
;;                             (org-agenda-todo-ignore-scheduled 'future)
;;                             (org-agenda-todo-ignore-deadlines 'future)))
;;                nil)))))
;; ;;Projects are 'stuck' if they have no subtask with a NEXT todo keyword task defined. 
;; ;;I disable the default org-mode stuck projects agenda view with the following setting. 
;; (setq org-stuck-projects (quote ("" nil nil "")))

;; (defun bh/find-project-task ()
;;   "Move point to the parent (project) task if any"
;;   (save-restriction
;;     (widen)
;;     (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
;;       (while (org-up-heading-safe)
;;         (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
;;           (setq parent-task (point))))
;;       (goto-char parent-task)
;;       parent-task)))

;; (defun bh/is-project-p ()
;;   "Any task with a todo keyword subtask"
;;   (save-restriction
;;     (widen)
;;     (let ((has-subtask)
;;           (subtree-end (save-excursion (org-end-of-subtree t)))
;;           (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
;;       (save-excursion
;;         (forward-line 1)
;;         (while (and (not has-subtask)
;;                     (< (point) subtree-end)
;;                     (re-search-forward "^\*+ " subtree-end t))
;;           (when (member (org-get-todo-state) org-todo-keywords-1)
;;             (setq has-subtask t))))
;;       (and is-a-task has-subtask))))

;; (defun bh/is-project-subtree-p ()
;;   "Any task with a todo keyword that is in a project subtree.
;; Callers of this function already widen the buffer view."
;;   (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
;;                               (point))))
;;     (save-excursion
;;       (bh/find-project-task)
;;       (if (equal (point) task)
;;           nil
;;         t))))

;; (defun bh/is-task-p ()
;;   "Any task with a todo keyword and no subtask"
;;   (save-restriction
;;     (widen)
;;     (let ((has-subtask)
;;           (subtree-end (save-excursion (org-end-of-subtree t)))
;;           (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
;;       (save-excursion
;;         (forward-line 1)
;;         (while (and (not has-subtask)
;;                     (< (point) subtree-end)
;;                     (re-search-forward "^\*+ " subtree-end t))
;;           (when (member (org-get-todo-state) org-todo-keywords-1)
;;             (setq has-subtask t))))
;;       (and is-a-task (not has-subtask)))))

;; (defun bh/is-subproject-p ()
;;   "Any task which is a subtask of another project"
;;   (let ((is-subproject)
;;         (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
;;     (save-excursion
;;       (while (and (not is-subproject) (org-up-heading-safe))
;;         (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
;;           (setq is-subproject t))))
;;     (and is-a-task is-subproject)))

;; (defun bh/list-sublevels-for-projects-indented ()
;;   "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
;;   This is normally used by skipping functions where this variable is already local to the agenda."
;;   (if (marker-buffer org-agenda-restrict-begin)
;;       (setq org-tags-match-list-sublevels 'indented)
;;     (setq org-tags-match-list-sublevels nil))
;;   nil)

;; (defun bh/list-sublevels-for-projects ()
;;   "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
;;   This is normally used by skipping functions where this variable is already local to the agenda."
;;   (if (marker-buffer org-agenda-restrict-begin)
;;       (setq org-tags-match-list-sublevels t)
;;     (setq org-tags-match-list-sublevels nil))
;;   nil)

;; (defvar bh/hide-scheduled-and-waiting-next-tasks t)

;; (defun bh/toggle-next-task-display ()
;;   (interactive)
;;   (setq bh/hide-scheduled-and-waiting-next-tasks (not bh/hide-scheduled-and-waiting-next-tasks))
;;   (when  (equal major-mode 'org-agenda-mode)
;;     (org-agenda-redo))
;;   (message "%s WAITING and SCHEDULED NEXT Tasks" (if bh/hide-scheduled-and-waiting-next-tasks "Hide" "Show")))

;; (defun bh/skip-stuck-projects ()
;;   "Skip trees that are not stuck projects"
;;   (save-restriction
;;     (widen)
;;     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;;       (if (bh/is-project-p)
;;           (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;;                  (has-next ))
;;             (save-excursion
;;               (forward-line 1)
;;               (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
;;                 (unless (member "WAITING" (org-get-tags-at))
;;                   (setq has-next t))))
;;             (if has-next
;;                 nil
;;               next-headline)) ; a stuck project, has subtasks but no next task
;;         nil))))

;; (defun bh/skip-non-stuck-projects ()
;;   "Skip trees that are not stuck projects"
;;   (bh/list-sublevels-for-projects-indented)
;;   (save-restriction
;;     (widen)
;;     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;;       (if (bh/is-project-p)
;;           (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;;                  (has-next ))
;;             (save-excursion
;;               (forward-line 1)
;;               (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
;;                 (unless (member "WAITING" (org-get-tags-at))
;;                   (setq has-next t))))
;;             (if has-next
;;                 next-headline
;;               nil)) ; a stuck project, has subtasks but no next task
;;         next-headline))))

;; (defun bh/skip-non-projects ()
;;   "Skip trees that are not projects"
;;   (bh/list-sublevels-for-projects-indented)
;;   (if (save-excursion (bh/skip-non-stuck-projects))
;;       (save-restriction
;;         (widen)
;;         (let ((subtree-end (save-excursion (org-end-of-subtree t))))
;;           (cond
;;            ((and (bh/is-project-p)
;;                  (marker-buffer org-agenda-restrict-begin))
;;             nil)
;;            ((and (bh/is-project-p)
;;                  (not (marker-buffer org-agenda-restrict-begin))
;;                  (not (bh/is-project-subtree-p)))
;;             nil)
;;            (t
;;             subtree-end))))
;;     (save-excursion (org-end-of-subtree t))))

;; (defun bh/skip-project-trees-and-habits ()
;;   "Skip trees that are projects"
;;   (save-restriction
;;     (widen)
;;     (let ((subtree-end (save-excursion (org-end-of-subtree t))))
;;       (cond
;;        ((bh/is-project-p)
;;         subtree-end)
;;        ((org-is-habit-p)
;;         subtree-end)
;;        (t
;;         nil)))))

;; (defun bh/skip-projects-and-habits-and-single-tasks ()
;;   "Skip trees that are projects, tasks that are habits, single non-project tasks"
;;   (save-restriction
;;     (widen)
;;     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;;       (cond
;;        ((org-is-habit-p)
;;         next-headline)
;;        ((and bh/hide-scheduled-and-waiting-next-tasks
;;              (member "WAITING" (org-get-tags-at)))
;;         next-headline)
;;        ((bh/is-project-p)
;;         next-headline)
;;        ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
;;         next-headline)
;;        (t
;;         nil)))))

;; (defun bh/skip-project-tasks-maybe ()
;;   "Show tasks related to the current restriction.
;; When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
;; When not restricted, skip project and sub-project tasks, habits, and project related tasks."
;;   (save-restriction
;;     (widen)
;;     (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;;            (next-headline (save-excursion (or (outline-next-heading) (point-max))))
;;            (limit-to-project (marker-buffer org-agenda-restrict-begin)))
;;       (cond
;;        ((bh/is-project-p)
;;         next-headline)
;;        ((org-is-habit-p)
;;         subtree-end)
;;        ((and (not limit-to-project)
;;              (bh/is-project-subtree-p))
;;         subtree-end)
;;        ((and limit-to-project
;;              (bh/is-project-subtree-p)
;;              (member (org-get-todo-state) (list "NEXT")))
;;         subtree-end)
;;        (t
;;         nil)))))

;; (defun bh/skip-projects-and-habits ()
;;   "Skip trees that are projects and tasks that are habits"
;;   (save-restriction
;;     (widen)
;;     (let ((subtree-end (save-excursion (org-end-of-subtree t))))
;;       (cond
;;        ((bh/is-project-p)
;;         subtree-end)
;;        ((org-is-habit-p)
;;         subtree-end)
;;        (t
;;         nil)))))

;; (defun bh/skip-non-subprojects ()
;;   "Skip trees that are not projects"
;;   (let ((next-headline (save-excursion (outline-next-heading))))
;;     (if (bh/is-subproject-p)
;;         nil
;;       next-headline)))
;; ;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; ;; '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
;; ;; '(custom-enabled-themes (quote (tsdh-dark)))
;; ;; '(custom-safe-themes (quote ("6cc5d2ee4a5188e0717f00291b5c7ecc77daad2b1a5c57829d044f68c1af0988" default))))
;; ;;(custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; ;; )

;; (global-set-key (kbd "<f5>") 'bh/org-todo)

;; (defun bh/org-todo (arg)
;;   (interactive "p")
;;   (if (equal arg 4)
;;       (save-restriction
;;         (bh/narrow-to-org-subtree)
;;         (org-show-todo-tree nil))
;;     (bh/narrow-to-org-subtree)
;;     (org-show-todo-tree nil)))

;; (global-set-key (kbd "<S-f5>") 'bh/widen)

;; (defun bh/widen ()
;;   (interactive)
;;   (if (equal major-mode 'org-agenda-mode)
;;       (progn
;;         (org-agenda-remove-restriction-lock)
;;         (when org-agenda-sticky
;;           (org-agenda-redo)))
;;     (widen)))

;; (add-hook 'org-agenda-mode-hook
;;           '(lambda () (org-defkey org-agenda-mode-map "W" (lambda () (interactive) (setq bh/hide-scheduled-and-waiting-next-tasks t) (bh/widen))))
;;           'append)

;; (defun bh/restrict-to-file-or-follow (arg)
;;   "Set agenda restriction to 'file or with argument invoke follow mode.
;; I don't use follow mode very often but I restrict to file all the time
;; so change the default 'F' binding in the agenda to allow both"
;;   (interactive "p")
;;   (if (equal arg 4)
;;       (org-agenda-follow-mode)
;;     (widen)
;;     (bh/set-agenda-restriction-lock 4)
;;     (org-agenda-redo)
;;     (beginning-of-buffer)))

;; (add-hook 'org-agenda-mode-hook
;;           '(lambda () (org-defkey org-agenda-mode-map "F" 'bh/restrict-to-file-or-follow))
;;           'append)

;; (defun bh/narrow-to-org-subtree ()
;;   (widen)
;;   (org-narrow-to-subtree)
;;   (save-restriction
;;     (org-agenda-set-restriction-lock)))

;; (defun bh/narrow-to-subtree ()
;;   (interactive)
;;   (if (equal major-mode 'org-agenda-mode)
;;       (progn
;;         (org-with-point-at (org-get-at-bol 'org-hd-marker)
;;           (bh/narrow-to-org-subtree))
;;         (when org-agenda-sticky
;;           (org-agenda-redo)))
;;     (bh/narrow-to-org-subtree)))

;; (add-hook 'org-agenda-mode-hook
;;           '(lambda () (org-defkey org-agenda-mode-map "N" 'bh/narrow-to-subtree))
;;           'append)

;; (defun bh/narrow-up-one-org-level ()
;;   (widen)
;;   (save-excursion
;;     (outline-up-heading 1 'invisible-ok)
;;     (bh/narrow-to-org-subtree)))

;; (defun bh/get-pom-from-agenda-restriction-or-point ()
;;   (or (org-get-at-bol 'org-hd-marker)
;;       (and (marker-position org-agenda-restrict-begin) org-agenda-restrict-begin)
;;       (and (equal major-mode 'org-mode) (point))
;;       org-clock-marker))

;; (defun bh/narrow-up-one-level ()
;;   (interactive)
;;   (if (equal major-mode 'org-agenda-mode)
;;       (org-with-point-at (bh/get-pom-from-agenda-restriction-or-point)
;;         (bh/narrow-up-one-org-level))
;;     (bh/narrow-up-one-org-level)))

;; (add-hook 'org-agenda-mode-hook
;;           '(lambda () (org-defkey org-agenda-mode-map "U" 'bh/narrow-up-one-level))
;;           'append)

;; (defun bh/narrow-to-org-project ()
;;   (widen)
;;   (save-excursion
;;     (bh/find-project-task)
;;     (bh/narrow-to-org-subtree)))

;; (defun bh/narrow-to-project ()
;;   (interactive)
;;   (if (equal major-mode 'org-agenda-mode)
;;       (progn
;;         (org-with-point-at (bh/get-pom-from-agenda-restriction-or-point)
;;           (bh/narrow-to-org-project)
;;           (save-excursion
;;             (bh/find-project-task)
;;             (org-agenda-set-restriction-lock)))
;;         (org-agenda-redo)
;;         (beginning-of-buffer))
;;     (bh/narrow-to-org-project)
;;     (save-restriction
;;       (org-agenda-set-restriction-lock))))

;; (add-hook 'org-agenda-mode-hook
;;           '(lambda () (org-defkey org-agenda-mode-map "P" 'bh/narrow-to-project))
;;           'append)

;; (defvar bh/project-list nil)

;; (defun bh/view-next-project ()
;;   (interactive)
;;   (let (num-project-left current-project)
;;     (unless (marker-position org-agenda-restrict-begin)
;;       (goto-char (point-min))
;;       ; Clear all of the existing markers on the list
;;       (while bh/project-list
;;         (set-marker (pop bh/project-list) nil))
;;       (re-search-forward "Tasks to Refile")
;;       (forward-visible-line 1))

;;     ; Build a new project marker list
;;     (unless bh/project-list
;;       (while (< (point) (point-max))
;;         (while (and (< (point) (point-max))
;;                     (or (not (org-get-at-bol 'org-hd-marker))
;;                         (org-with-point-at (org-get-at-bol 'org-hd-marker)
;;                           (or (not (bh/is-project-p))
;;                               (bh/is-project-subtree-p)))))
;;           (forward-visible-line 1))
;;         (when (< (point) (point-max))
;;           (add-to-list 'bh/project-list (copy-marker (org-get-at-bol 'org-hd-marker)) 'append))
;;         (forward-visible-line 1)))

;;     ; Pop off the first marker on the list and display
;;     (setq current-project (pop bh/project-list))
;;     (when current-project
;;       (org-with-point-at current-project
;;         (setq bh/hide-scheduled-and-waiting-next-tasks nil)
;;         (bh/narrow-to-project))
;;       ; Remove the marker
;;       (setq current-project nil)
;;       (org-agenda-redo)
;;       (beginning-of-buffer)
;;       (setq num-projects-left (length bh/project-list))
;;       (if (> num-projects-left 0)
;;           (message "%s projects left to view" num-projects-left)
;;         (beginning-of-buffer)
;;         (setq bh/hide-scheduled-and-waiting-next-tasks t)
;;         (error "All projects viewed.")))))

;; (add-hook 'org-agenda-mode-hook
;;           '(lambda () (org-defkey org-agenda-mode-map "V" 'bh/view-next-project))
;;           'append)

;; ;; NEXT keywords are for tasks and not projects. I've added a function
;; ;; to the todo state change hook and clock in hook so that any parent
;; ;; tasks marked NEXT automagically change from NEXT to TODO since they
;; ;; are now projects and not tasks. 
;; (defun bh/mark-next-parent-tasks-todo ()
;;   "Visit each parent task and change NEXT states to TODO"
;;   (let ((mystate (or (and (fboundp 'org-state)
;;                           state)
;;                      (nth 2 (org-heading-components)))))
;;     (when mystate
;;       (save-excursion
;;         (while (org-up-heading-safe)
;;           (when (member (nth 2 (org-heading-components)) (list "NEXT"))
;;             (org-todo "TODO")))))))

;; (add-hook 'org-after-todo-state-change-hook 'bh/mark-next-parent-tasks-todo 'append)
;; (add-hook 'org-clock-in-hook 'bh/mark-next-parent-tasks-todo 'append)


;; (setq org-use-speed-commands t)
;; (setq org-speed-commands-user (quote (("0" . ignore)
;;                                       ("1" . ignore)
;;                                       ("2" . ignore)
;;                                       ("3" . ignore)
;;                                       ("4" . ignore)
;;                                       ("5" . ignore)
;;                                       ("6" . ignore)
;;                                       ("7" . ignore)
;;                                       ("8" . ignore)
;;                                       ("9" . ignore)

;;                                       ("a" . ignore)
;;                                       ("d" . ignore)
;;                                       ("h" . bh/hide-other)
;;                                       ("i" progn
;;                                        (forward-char 1)
;;                                        (call-interactively 'org-insert-heading-respect-content))
;;                                       ("k" . org-kill-note-or-show-branches)
;;                                       ("l" . ignore)
;;                                       ("m" . ignore)
;;                                       ("q" . bh/show-org-agenda)
;;                                       ("r" . ignore)
;;                                       ("s" . org-save-all-org-buffers)
;;                                       ("w" . org-refile)
;;                                       ("x" . ignore)
;;                                       ("y" . ignore)
;;                                       ("z" . org-add-note)

;;                                       ("A" . ignore)
;;                                       ("B" . ignore)
;;                                       ("E" . ignore)
;;                                       ("F" . bh/restrict-to-file-or-follow)
;;                                       ("G" . ignore)
;;                                       ("H" . ignore)
;;                                       ("J" . org-clock-goto)
;;                                       ("K" . ignore)
;;                                       ("L" . ignore)
;;                                       ("M" . ignore)
;;                                       ("N" . bh/narrow-to-org-subtree)
;;                                       ("P" . bh/narrow-to-org-project)
;;                                       ("Q" . ignore)
;;                                       ("R" . ignore)
;;                                       ("S" . ignore)
;;                                       ("T" . bh/org-todo)
;;                                       ("U" . bh/narrow-up-one-org-level)
;;                                       ("V" . ignore)
;;                                       ("W" . bh/widen)
;;                                       ("X" . ignore)
;;                                       ("Y" . ignore)
;;                                       ("Z" . ignore))))

;; (defun bh/show-org-agenda ()
;;   (interactive)
;;   (if org-agenda-sticky
;;       (switch-to-buffer "*Org Agenda( )*")
;;     (switch-to-buffer "*Org Agenda*"))
;;   (delete-other-windows))

;; ;;export tables to csv by default
;; (setq org-table-export-default-format "orgtbl-to-csv")

;; ;;notes
;; (setq org-reverse-note-order t)

;; ; Tags with fast selection keys
;; (setq org-tag-alist (quote ((:startgroup)
;;                             ("@torelease" . ?t)
;;                             ("@released" . ?r)
;;                             ("@norelease" . ?n)
;;                             (:endgroup)
;;                             ("FLAGGED" . ??))))

;; ; Allow setting single tags without the menu
;; (setq org-fast-tag-selection-single-key (quote expert))

;; ; For tag searches ignore tasks with scheduled and deadline dates
;; ;(setq org-agenda-tags-todo-honor-ignore-options t)

;; ;; Agenda log mode items to display (closed and state changes by default)
;; (setq org-agenda-log-mode-items (quote (closed state)))


;; ;;;;;;; CLCOCKING
;; ;;
;; ;; Resume clocking task when emacs is restarted
;; (org-clock-persistence-insinuate)
;; ;;
;; ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
;; (setq org-clock-history-length 23)
;; ;; Resume clocking task on clock-in if the clock is open
;; (setq org-clock-in-resume t)
;; ;; Change tasks to NEXT when clocking in
;; (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
;; ;; Separate drawers for clocking and logs
;; (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; ;; Save clock data and state changes and notes in the LOGBOOK drawer
;; (setq org-clock-into-drawer t)
;; ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
;; (setq org-clock-out-remove-zero-time-clocks t)
;; ;; Clock out when moving task to a done state
;; (setq org-clock-out-when-done t)
;; ;; Save the running clock and all clock history when exiting Emacs, load it on startup
;; (setq org-clock-persist t)
;; ;; Do not prompt to resume an active clock
;; (setq org-clock-persist-query-resume nil)
;; ;; Enable auto clock resolution for finding open clocks
;; (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; ;; Include current clocking task in clock reports
;; (setq org-clock-report-include-clocking-task t)

;; (setq bh/keep-clock-running nil)

;; (defun bh/clock-in-to-next (kw)
;;   "Switch a task from TODO to NEXT when clocking in.
;; Skips capture tasks, projects, and subprojects.
;; Switch projects and subprojects from NEXT back to TODO"
;;   (when (not (and (boundp 'org-capture-mode) org-capture-mode))
;;     (cond
;;      ((and (member (org-get-todo-state) (list "TODO"))
;;            (bh/is-task-p))
;;       "NEXT")
;;      ((and (member (org-get-todo-state) (list "NEXT"))
;;            (bh/is-project-p))
;;       "TODO"))))

;; (defun bh/find-project-task ()
;;   "Move point to the parent (project) task if any"
;;   (save-restriction
;;     (widen)
;;     (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
;;       (while (org-up-heading-safe)
;;         (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
;;           (setq parent-task (point))))
;;       (goto-char parent-task)
;;       parent-task)))

;; (defun bh/punch-in (arg)
;;   "Start continuous clocking and set the default task to the
;; selected task.  If no task is selected set the Organization task
;; as the default task."
;;   (interactive "p")
;;   (setq bh/keep-clock-running t)
;;   (if (equal major-mode 'org-agenda-mode)
;;       ;;
;;       ;; We're in the agenda
;;       ;;
;;       (let* ((marker (org-get-at-bol 'org-hd-marker))
;;              (tags (org-with-point-at marker (org-get-tags-at))))
;;         (if (and (eq arg 4) tags)
;;             (org-agenda-clock-in '(16))
;;           (bh/clock-in-organization-task-as-default)))
;;     ;;
;;     ;; We are not in the agenda
;;     ;;
;;     (save-restriction
;;       (widen)
;;       ; Find the tags on the current task
;;       (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
;;           (org-clock-in '(16))
;;         (bh/clock-in-organization-task-as-default)))))

;; (defun bh/punch-out ()
;;   (interactive)
;;   (setq bh/keep-clock-running nil)
;;   (when (org-clock-is-active)
;;     (org-clock-out))
;;   (org-agenda-remove-restriction-lock))

;; (defun bh/clock-in-default-task ()
;;   (save-excursion
;;     (org-with-point-at org-clock-default-task
;;       (org-clock-in))))

;; (defun bh/clock-in-parent-task ()
;;   "Move point to the parent (project) task if any and clock in"
;;   (let ((parent-task))
;;     (save-excursion
;;       (save-restriction
;;         (widen)
;;         (while (and (not parent-task) (org-up-heading-safe))
;;           (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
;;             (setq parent-task (point))))
;;         (if parent-task
;;             (org-with-point-at parent-task
;;               (org-clock-in))
;;           (when bh/keep-clock-running
;;             (bh/clock-in-default-task)))))))

;; (defvar bh/organization-task-id "default-org-clock")

;; (defun bh/clock-in-organization-task-as-default ()
;;   (interactive)
;;   (org-with-point-at (org-id-find bh/organization-task-id 'marker)
;;     (org-clock-in '(16))))

;; (defun bh/clock-out-maybe ()
;;   (when (and bh/keep-clock-running
;;              (not org-clock-clocking-in)
;;              (marker-buffer org-clock-default-task)
;;              (not org-clock-resolving-clocks-due-to-idleness))
;;     (bh/clock-in-parent-task)))

;; (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)

;; ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
;; (setq org-clock-out-remove-zero-time-clocks t)

;; ;; Agenda clock report parameters
;; (setq org-agenda-clockreport-parameter-plist
;;       (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))

;; ; Set default column view headings: Task Effort Clock_Summary
;; (setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

;; ; global Effort estimate values
;; ; global STYLE property values for completion
;; (setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
;;                                     ("STYLE_ALL" . "habit"))))


;; (setq org-agenda-include-diary nil)
;; (setq org-agenda-diary-file "~/org/diary.org")

;; ;;;;;; agenda tweaks
;; ;; Show all future entries for repeating tasks
;; (setq org-agenda-repeating-timestamp-show-all t)

;; ;; Show all agenda dates - even if they are empty
;; (setq org-agenda-show-all-dates t)

;; ;; Sorting order for tasks on the agenda
;; (setq org-agenda-sorting-strategy
;;       (quote ((agenda habit-down time-up user-defined-up effort-up category-keep)
;;               (todo category-up effort-up)
;;               (tags category-up effort-up)
;;               (search category-up))))

;; ;; Start the weekly agenda on Monday
;; (setq org-agenda-start-on-weekday 1)

;; ;; Enable display of the time grid so we can see the marker for the current time
;; (setq org-agenda-time-grid (quote ((daily today remove-match)
;;                                    #("----------------" 0 16 (org-heading t))
;;                                    (0900 1100 1300 1500 1700))))

;; ;; Display tags farther right
;; (setq org-agenda-tags-column -102)

;; ;;
;; ;; Agenda sorting functions
;; ;;
;; (setq org-agenda-cmp-user-defined 'bh/agenda-sort)

;; (defun bh/agenda-sort (a b)
;;   "Sorting strategy for agenda items.
;; Late deadlines first, then scheduled, then non-late deadlines"
;;   (let (result num-a num-b)
;;     (cond
;;      ; time specific items are already sorted first by org-agenda-sorting-strategy

;;      ; non-deadline and non-scheduled items next
;;      ((bh/agenda-sort-test 'bh/is-not-scheduled-or-deadline a b))

;;      ; deadlines for today next
;;      ((bh/agenda-sort-test 'bh/is-due-deadline a b))

;;      ; late deadlines next
;;      ((bh/agenda-sort-test-num 'bh/is-late-deadline '> a b))

;;      ; scheduled items for today next
;;      ((bh/agenda-sort-test 'bh/is-scheduled-today a b))

;;      ; late scheduled items next
;;      ((bh/agenda-sort-test-num 'bh/is-scheduled-late '> a b))

;;      ; pending deadlines last
;;      ((bh/agenda-sort-test-num 'bh/is-pending-deadline '< a b))

;;      ; finally default to unsorted
;;      (t (setq result nil)))
;;     result))

;; (defmacro bh/agenda-sort-test (fn a b)
;;   "Test for agenda sort"
;;   `(cond
;;     ; if both match leave them unsorted
;;     ((and (apply ,fn (list ,a))
;;           (apply ,fn (list ,b)))
;;      (setq result nil))
;;     ; if a matches put a first
;;     ((apply ,fn (list ,a))
;;      (setq result -1))
;;     ; otherwise if b matches put b first
;;     ((apply ,fn (list ,b))
;;      (setq result 1))
;;     ; if none match leave them unsorted
;;     (t nil)))

;; (defmacro bh/agenda-sort-test-num (fn compfn a b)
;;   `(cond
;;     ((apply ,fn (list ,a))
;;      (setq num-a (string-to-number (match-string 1 ,a)))
;;      (if (apply ,fn (list ,b))
;;          (progn
;;            (setq num-b (string-to-number (match-string 1 ,b)))
;;            (setq result (if (apply ,compfn (list num-a num-b))
;;                             -1
;;                           1)))
;;        (setq result -1)))
;;     ((apply ,fn (list ,b))
;;      (setq result 1))
;;     (t nil)))

;; (defun bh/is-not-scheduled-or-deadline (date-str)
;;   (and (not (bh/is-deadline date-str))
;;        (not (bh/is-scheduled date-str))))

;; (defun bh/is-due-deadline (date-str)
;;   (string-match "Deadline:" date-str))

;; (defun bh/is-late-deadline (date-str)
;;   (string-match "\\([0-9]*\\) d\. ago:" date-str))

;; (defun bh/is-pending-deadline (date-str)
;;   (string-match "In \\([^-]*\\)d\.:" date-str))

;; (defun bh/is-deadline (date-str)
;;   (or (bh/is-due-deadline date-str)
;;       (bh/is-late-deadline date-str)
;;       (bh/is-pending-deadline date-str)))

;; (defun bh/is-scheduled (date-str)
;;   (or (bh/is-scheduled-today date-str)
;;       (bh/is-scheduled-late date-str)))

;; (defun bh/is-scheduled-today (date-str)
;;   (string-match "Scheduled:" date-str))

;; (defun bh/is-scheduled-late (date-str)
;;   (string-match "Sched\.\\(.*\\)x:" date-str))

;; ;; Use sticky agenda's so they persist
;; (setq org-agenda-sticky nil)


;; ;; hides blank lines between headings which keeps folded view nice and
;; ;; compact
;; (setq org-cycle-separator-lines 0)

;; ;;
;; (setq org-blank-before-new-entry (quote ((heading)
;;                                          (plain-list-item . auto))))



;; (defvar bh/insert-inactive-timestamp t)

;; (defun bh/toggle-insert-inactive-timestamp ()
;;   (interactive)
;;   (setq bh/insert-inactive-timestamp (not bh/insert-inactive-timestamp))
;;   (message "Heading timestamps are %s" (if bh/insert-inactive-timestamp "ON" "OFF")))

;; (defun bh/insert-inactive-timestamp ()
;;   (interactive)
;;   (org-insert-time-stamp nil t t nil nil nil))

;; (defun bh/insert-inactive-timestamp ()
;;   (interactive)
;;   (org-insert-time-stamp nil t t nil nil nil))

;; (defun bh/insert-heading-inactive-timestamp ()
;;   (save-excursion
;;     (when bh/insert-inactive-timestamp
;;       (org-return)
;;       (org-cycle)
;;       (bh/insert-inactive-timestamp))))

;; (add-hook 'org-insert-heading-hook
;; 	  'bh/insert-heading-inactive-timestamp 'append)

;; ; Overwrite the current window with the agenda
;; (setq org-agenda-window-setup 'current-window)

;; ;; startup in folded view
;; (setq org-startup-folded t)

;; ;;utf-8 default
;; (setq org-export-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (set-charset-priority 'unicode)
;; (setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; ;; discrete minute intervals for rounding
;; (setq org-time-stamp-rounding-minutes (quote (1 1)))

;; ;; org-indent-mode on by default
;; (setq org-startup-indented t)


;; ;;note order
;; (setq org-reverse-note-order nil)
;; |#

 (provide 'setup-org)
