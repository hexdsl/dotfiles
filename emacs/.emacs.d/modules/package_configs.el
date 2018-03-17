;;; package_configs.el --- module with ocnfigs for installed packages

;;; Commentary:
;; this file is called from init.el
;; it contains options for all downloaded packages

;;; Code:
;; projectile
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-dired)

;; neotree
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq neo-smart-open t)

;; powerline
(powerline-default-theme)

;; multiple cursors
;; (multiple-cursors)

;; autocomplete
(ac-config-default)

;; rainbow delimeters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; counsel
(counsel-mode 1)
(ivy-set-actions
      'counsel-find-file
      '(("d" delete-file "delete")))

;; flychek
(global-flycheck-mode)
