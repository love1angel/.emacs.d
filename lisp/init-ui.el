;;; init-ui.el --- Setup the UI  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "JetBrainsMonoNL Nerd Font Mono"))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package doom-modeline
  :ensure t
  :after nerd-icons
  :init
  (doom-modeline-mode 1))

(add-hook 'window-setup-hook #'toggle-frame-maximized)


(provide 'init-ui)
;;; init-ui.el ends here
