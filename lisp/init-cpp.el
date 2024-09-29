;;; init-cpp.el --- Configure the cpp  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(add-to-list 'auto-mode-alist '("\\.cppm\\'" . c++-mode))

(setq exec-path (append exec-path '("/opt/homebrew/opt/llvm/bin")))

(load "/opt/homebrew/opt/llvm/share/emacs/site-lisp/llvm/clang-format.el")
(require 'clang-format)

(setq clang-format-style-option "WebKit")

(defun my-c++-mode-setup ()
  ;; code format
  (setq c-default-style "linux"
	c-basic-offset 4)
  (setq indent-tabs-mode nil)

  ;; code format key
  (local-set-key (kbd "C-c i") 'clang-format-region)
  (local-set-key (kbd "C-c u") 'clang-format-buffer)

  (add-hook 'before-save-hook 'clang-format-buffer-on-save nil 'local)
  )

(defun clang-format-buffer-on-save ()
  (when (derived-mode-p 'c++-mode)
    (clang-format-buffer)))

(add-hook 'c++-mode-hook 'my-c++-mode-setup)

(add-hook 'before-save-hook 'delete-trailing-whitespace)


(provide 'init-cpp)
;;; init-cpp.el ends here
