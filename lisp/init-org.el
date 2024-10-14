;;; init-org.el --- Configure the org  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package org-superstar
  :ensure t
  :hook
  (org-mode . org-superstar-mode))

(setq org-agenda-files '("~/org/org-roam/20241010145810-gtd.org"))
(setq org-agenda-span 'day)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org/org-roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(setq org-roam-db-location "~/org/org-roam/org-roam.db")

(provide 'init-org)
;;; init-org.el ends here
