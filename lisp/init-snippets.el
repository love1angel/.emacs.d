;;; init-snippets.el --- Setup the snippets  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package yasnippet
  :ensure t
  :config
  (define-key yas-minor-mode-map [(tab)]        nil)
  (define-key yas-minor-mode-map (kbd "TAB")    nil)
  (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  :bind
  (:map yas-minor-mode-map ("M-*" . yas-expand))
  :hook (after-init . yas-global-mode))


(provide 'init-snippets)
;;; init-snippets.el ends here
