;;; init-git.el --- Setup the git  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :commands (magit-status)
  :bind (("C-c gs" . magit-status)
	 ("C-c gc" . magit-commit-create)
	 ("C-c ga" . magit-commit-amend)
	 ("C-c g s" . magit-stage)))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))

(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)


(provide 'init-git)
;;; init-git.el ends here
