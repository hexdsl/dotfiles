;;; keybindings.el --- my module with custom key bindings

;;; Commentary:
;; this file is called from init.el
;; it contains keybindings for packages and custom actions

;;; Code:
;; more kill line motions
;; kill whole line, regardless of position
;; kill backwards
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(global-set-key (kbd "C-S-k") 'backward-kill-line)

;; equivalent to vim dd
(global-set-key (kbd "M-k") 'kill-whole-line)

;; definition for equivalent to vim yy
(defun copy-line (ARG)
  "Copy lines (as many as prefix argument `ARG`) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
  (interactive "p")
  (let ((beg (line-beginning-position))
	(end (line-end-position ARG)))
    (when mark-active
      (if (> (point) (mark))
	  (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
	(setq end (save-excursion (goto-char (mark)) (line-end-position)))))
    (if (eq last-command 'copy-line)
	(kill-append (buffer-substring beg end) (< end beg))
      (kill-ring-save beg end)))
  (kill-append "\n" nil)
  (beginning-of-line (or (and ARG (1+ ARG)) 2))
  (if (and ARG (not (= 1 ARG))) (message "%d lines copied" ARG)))

(global-set-key (kbd "C-c C-k") 'copy-line)

;; kill under position
(defun my-kill-thing-at-point (thing)
  "Kill the `thing-at-point' for the specified kind of THING."
  (let ((bounds (bounds-of-thing-at-point thing)))
    (if bounds
        (kill-region (car bounds) (cdr bounds))
      (error "No %s at point" thing))))

(defun my-kill-word-at-point ()
  "Kill the word at point."
  (interactive)
  (my-kill-thing-at-point 'word))

(global-set-key (kbd "C-c k") 'my-kill-word-at-point)

;;;; keybibdings for plugins

;; neotree
(global-set-key (kbd "C-c n") 'neotree-toggle)

;; multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; swiper
(global-set-key (kbd "C-s") 'swiper)

(provide 'keybindings)
;;; keybindings.el ends here
