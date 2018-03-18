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

;;;; modules
(add-to-list 'load-path "~/.emacs.d/modules/")
(load-library "prot-general")
(load-library "prot-keybindings")
(load-library "prot-package-configs")

(provide 'init)
;;; init.el ends here
