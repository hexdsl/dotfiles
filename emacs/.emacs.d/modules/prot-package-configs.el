;;; prot-package-configs.el --- init module with configs for installed packages

;;; Commentary:
;; this file is called from init.el
;; contains options for all downloaded packages

;;; Code:

;; install `use-package' if missing
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; use-package
(eval-when-compile
  (require 'use-package))

;; by default install missing packages
(setq use-package-always-ensure t)

;;;; package declarations with `use-package'

;; ace-jump-mode
(use-package ace-jump-mode
  :bind (("C-c SPC" . ace-jump-mode)
	 ("C-x SPC" . ace-jump-mode-pop-mark)))

;; multiple cursors
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
	 ("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)))

;; magit
(use-package magit
  :bind ("C-x g" . magit-status))

;; expand region
(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; auto-complete
(use-package auto-complete
  :config (ac-config-default))

;; rainbow delimeters
(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; ivy
(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

;; swiper
(use-package swiper
  :bind ("C-s" . swiper))

;; counsel
(use-package counsel
  :config
  (counsel-mode 1)
  (ivy-set-actions
   'counsel-find-file
   '(("d" delete-file "delete"))))

;; flychek
(use-package flycheck
  :config (global-flycheck-mode))

;; wc-mode
(use-package wc-mode)

;; markdown-mode
(use-package markdown-mode)

;; focus
(use-package focus
  :bind ("C-c f" . focus-mode))

;;visual-regexp
(use-package visual-regexp
  :bind (("C-c r" . vr/replace)
	 ("C-c q" . vr/query-replace)))

(provide 'prot-package-configs)
;;; prot-package-configs.el ends here
