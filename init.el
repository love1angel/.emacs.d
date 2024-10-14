;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 ;; '(cursor-type '(bar . 5))
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(delete-selection-mode t)
 '(electric-pair-mode t)
 '(global-auto-revert-mode t)
 '(global-display-line-numbers-mode t)
 '(global-hl-line-mode t)
 ;; '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(auctex consult corfu dashboard diff-hl doom-modeline dracula-theme
	    embark embark-consult evil-leader magit marginalia
	    orderless org-roam org-superstar ox-hugo pdf-tools vertico
	    yasnippet))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMonoNL Nerd Font Mono" :foundry "nil" :slant normal :weight regular :height 140 :width normal)))))

;; (toggle-frame-maximized)

;; Sarasa Mono CL 15

(require 'package)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; (when (not package-archive-contents)
;;   (package-refresh-contents))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-ui)
(require 'init-org)
(require 'init-git)

(require 'init-snippets)
(require 'init-completion)
(require 'init-lsp)
(require 'init-cpp)

;; mini buffer
(package-install 'vertico)
(vertico-mode t)

(package-install 'orderless)
(setq completion-styles '(orderless))

;; minubuffer annotation
(package-install 'marginalia)
(marginalia-mode t)

;; minibuffer action context menu
(package-install 'embark)
(global-set-key (kbd "C-;") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)


(package-install 'consult)
(global-set-key (kbd "C-s") 'consult-line)

;; consult-imenu

(global-set-key (kbd "C-x b") 'consult-buffer)

(use-package consult
  :ensure t
  :bind (("C-c ff" . consult-fd)
	 ("C-c fc" . consult-ripgrep)))

(package-install 'embark-consult)

;; add pdflatex
(setenv "PATH" (concat "/Library/TeX/texbin:" (getenv "PATH")))
(setq exec-path (append '("/Library/TeX/texbin") exec-path))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (evil-mode)

  ;; https://emacs.stackexchange.com/questions/46371/how-can-i-get-ret-to-follow-org-mode-links-when-using-evil-mode
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "RET") nil))
  )

(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "rg" 'consult-ripgrep
  "fd" 'consult-fd
  )
(global-evil-leader-mode)


(defun my-get-core ()
  (string-to-number (string-trim (shell-command-to-string "nproc"))))

(defun my-compile-and-run ()
  (interactive)
  (let* ((worker (/ (my-get-core) 2))
         (target (or (and (boundp 'my-compile-target) my-compile-target)
                          "./build/main")))
    (compile (format "cmake --build build --parallel %d && %s" worker target))))

(defun my-configure-build-directory ()
  (interactive)
    (shell-command "cmake -S . -B build -DCMAKE_CXX_COMPILER=/opt/homebrew/opt/llvm/bin/clang++ -DCMAKE_C_COMPILER=/opt/homebrew/opt/llvm/bin/clang -G Ninja"))

(defun my-remove-build-directory ()
  (interactive)
  (when (yes-or-no-p "Are you sure you want to remove the 'build' directory? ")
    (shell-command "rm -rf build")
    (message "Build directory removed.")))

(add-hook 'c++-mode-hook
          (lambda ()
            (evil-leader/set-key
              "p r" 'my-compile-and-run
	      "p c" 'my-remove-build-directory
	      "p b" 'my-configure-build-directory
	      )))

(setq display-buffer-alist
      '(("\\*compilation\\*"
         (display-buffer-in-side-window)
         (side . bottom)      ;; 在底部显示
         (window . 0.4))))

;(defun close-compilation-buffer-after-delay (buf exit-status)
;  "Close the compilation buffer BUF after a 3 second delay.
;EXIT-STATUS is the status of the compilation process."
;  (when (get-buffer buf)
;    (run-at-time "3 sec" nil
;                 (lambda ()
;                   (when (get-buffer buf)
;                     (delete-window (get-buffer-window buf)))))))

;(add-hook 'compilation-finish-functions 'close-compilation-buffer-after-delay)
