;;; init-org.el --- Configure the org  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package org-superstar
  :ensure t
  :hook
  (org-mode . org-superstar-mode))


(provide 'init-org)
;;; init-org.el ends here
