;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropdox/org")
;; set todo
(setq +todo-file "~/Dropbox/org/todo.org")
(setq +prep-file "~/Dropbox/org/prep.org")
(setq +work-file "~/dev/wwd/be/work-notes.org")

;; set agenda path
(setq org-agenda-files (list org-directory))

(setq org-todo-keywords
      (quote (sequence "TODO(t)" "ACTIVE(a)" "BLOCKED(b)" "|" "DONE(d)")))

;; set notes file
(setq org-default-notes-file (expand-file-name "notes.org" org-directory))

(defun +open-todo-file ()
  (interactive)
  "Opens todo file"
  (find-file +todo-file))

(map!
 :leader
 :desc "Open todo file" "O" #'+open-todo-file)

(defun +open-prep-file ()
  (interactive)
  "Opens prep file"
  (find-file +prep-file))

(map!
 :leader
 :desc "Open prep file" "P" #'+open-prep-file)

(defun +open-work-file ()
  (interactive)
  (display-buffer-in-side-window (find-file-noselect +work-file)
                                 '((side . left))))

(map!
 :leader
 :desc "Open work notes" "o w" #'+open-work-file)
