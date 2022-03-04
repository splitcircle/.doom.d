(setq user-full-name "Juniper Stillwaggon"
      user-mail-address "juniper.stillwaggon@gmail.com")

(setq doom-font (font-spec :family "Comic Mono" :size 16))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-doc-face :slant italic))

(setq treemacs-position 'right)

(setq doom-theme 'doom-monokai-pro)

;; transparency for fun
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))
  ;; (consult-buffer))

(setq +ivy-buffer-preview t)

;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Disable default fringe styling
(setq +vc-gutter-default-style nil)
;; Make sure the margin is visible to begin with
(setq-default left-margin-width 1)
;; Move flycheck to left margin
(setq-default flycheck-indication-mode 'left-margin)

(setq display-line-numbers-type 'relative)

(setq which-key-idle-delay 0.5)

(map!
  :n "C-h" #'evil-window-left
  :n "C-j" #'evil-window-down
  :n "C-k" #'evil-window-up
  :n "C-l" #'evil-window-right)

(setq org-directory "~/Dropdox/org")
(setq +todo-file "~/Dropbox/org/todo.org")
(setq +prep-file "~/Dropbox/org/prep.org")
(setq +work-file "~/dev/wwd/be/work-notes.org")

(setq org-default-notes-file (expand-file-name "notes.org" org-directory))

(setq org-agenda-files (list org-directory))

(setq org-todo-keywords
      (quote (sequence "TODO(t)" "ACTIVE(a)" "BLOCKED(b)" "|" "DONE(d)")))

(defun +open-todo-file ()
  (interactive)
  "Opens todo file"
  (find-file +todo-file))

(defun +open-prep-file ()
  (interactive)
  "Opens prep file"
  (find-file +prep-file))

(defun +open-work-file ()
  (interactive)
  (display-buffer-in-side-window (find-file-noselect +work-file)
                                 '((side . left))))

(map!
 :leader
 :desc "Open todo file" "O" #'+open-todo-file)

(map!
 :leader
 :desc "Open prep file" "P" #'+open-prep-file)

(map!
 :leader
 :desc "Open work notes" "o w" #'+open-work-file)
