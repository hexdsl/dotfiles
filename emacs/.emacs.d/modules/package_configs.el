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
