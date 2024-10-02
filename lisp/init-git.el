;;; init-git.el --- Setup the git  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :commands (magit-status)
  :bind (("C-x gs" . magit-status)
	 ("C-x gc" . magit-commit-create)
	 ("C-x ga" . magit-commit-amend)
	 ("C-x g." . magit-stage)))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))

(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)


(provide 'init-git)
;;; init-git.el ends here
