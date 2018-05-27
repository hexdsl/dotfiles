;;; init.el --- generic, modular config for a base GNU Emacs

;;; Commentary:
;; NOTE work in progress
;; packages are declared with `use-package'

;; this is a generic config to learn basic Emacs
;; intentionally avoiding EVIL (Vim) mode
;; the idea is to see whether Emacs can offer more

;;; Code:

;;;; custom
;; NOTE this goes first to avoid prompts at startup
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b7532dc0fc97ae16582677f9a8128e36a0dc77cf4b45978287c28f7813c53cab" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (writegood-mode wc-mode visual-regexp use-package rainbow-delimiters projectile neotree multiple-cursors markdown-mode magit git-gutter focus flycheck expand-region dashboard counsel avy auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; packages
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;;; init file
(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-init.org"))

(provide 'init)
;;; init.el ends here
