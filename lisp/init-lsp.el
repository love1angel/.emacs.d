;;; init-lsp.el --- Configure the lsp  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(provide 'init-lsp)
;;; init-lsp.el ends here
