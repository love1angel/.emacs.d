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

(use-package doom-modeline
  :ensure t
  :after nerd-icons
  :init
  (doom-modeline-mode 1))


(provide 'init-ui)
;;; init-ui.el ends here
