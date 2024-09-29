;;; init-git.el --- Setup the git  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :commands (magit-status)
  :bind (("C-x g" . magit-status)))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))


(provide 'init-git)
;;; init-git.el ends here
