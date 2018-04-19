;;; init.el --- generic, modular config for a base GNU Emacs

;;; Commentary:
;; NOTE work in progress
;; packages are declared with `use-package'

;; this is a generic config to learn basic Emacs
;; intentionally avoiding EVIL (Vim) mode
;; the idea is to see whether Emacs can offer more

;;; Code:
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("58587075e282dcb38fc873d2f6e0d71e52872f214bc1c632f5b48dc130d6e12a" default)))
 '(package-selected-packages
   (quote
    (which-key wc-mode volatile-highlights visual-regexp uuidgen use-package unfill toc-org smeargle restart-emacs rainbow-delimiters popwin pcre2el orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree mwim multiple-cursors move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter gh-md fuzzy focus flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word dashboard counsel column-enforce-mode auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
