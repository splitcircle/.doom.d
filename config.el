(load! "+org")
(setq user-full-name "Chris Stillwaggon"
      user-mail-address "chriscallanjr@me.com")
(setq doom-font (font-spec :family "Input Mono" :size 16))

(setq treemacs-position 'right)

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-doc-face :slant italic))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(setq doom-theme 'doom-flatwhite)

(setq display-line-numbers-type 'relative)

(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

(setq +ivy-buffer-preview t)


(setq which-key-idle-delay 0.5)

(map!
  :n "C-h" #'evil-window-left
  :n "C-j" #'evil-window-down
  :n "C-k" #'evil-window-up
  :n "C-l" #'evil-window-right)
