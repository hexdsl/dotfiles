;; NOTE work in progress

;; this is a generic config to learn basic emacs
;; intentionally avoiding EVIL (Vim) mode


;;;; general

;; default theme
(load-theme 'tango-dark)

;; disable gtk ui components
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; show line numbers
(linum-mode 1)

;; default font
(add-to-list 'default-frame-alist '(font . "Iosevka Term-12"))

;; default encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; column length
(setq fill-column 80)
(set-default 'fill-column 80)

;; show empty lines at end of buffer
(set-default 'indicate-empty-lines t)

;; ignore irregular casing for words
(global-subword-mode 1)

;; do not break lines
(setq-default truncate-lines t)

;; one space ends a sentence
(set-default 'sentence-end-double-space nil)

;; show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; delete region if inserting text
(delete-selection-mode 1)

;; seamlessly open compressed files
(auto-compression-mode t)

;; answer with 'y' or 'n' to prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; show keystrokes in progress
(setq echo-keystrokes 0.2)

;; move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; auto refresh buffers
(global-auto-revert-mode 1)

;; silently auto refresh dired
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;;;; key bindings
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(global-set-key (kbd "C-S-k") 'backward-kill-line)

;; equivalent to vim dd
(global-set-key (kbd "M-k") 'kill-whole-line)

;; definition for equivalent to vim yy
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
  (interactive "p")
  (let ((beg (line-beginning-position))
	(end (line-end-position arg)))
    (when mark-active
      (if (> (point) (mark))
	  (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
	(setq end (save-excursion (goto-char (mark)) (line-end-position)))))
    (if (eq last-command 'copy-line)
	(kill-append (buffer-substring beg end) (< end beg))
      (kill-ring-save beg end)))
  (kill-append "\n" nil)
  (beginning-of-line (or (and arg (1+ arg)) 2))
  (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

(global-set-key (kbd "C-c C-k") 'copy-line)

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
