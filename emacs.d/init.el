;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(let ((basedir "~/.emacs.d/themes/"))
  (dolist (f (directory-files basedir))
    (if (and (not (or (equal f ".") (equal f "..")))
      (file-directory-p (concat basedir f)))
    (add-to-list 'custom-theme-load-path (concat basedir f)))))

(load-theme 'jbeans t)

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a1e99cb36d6235abbe426a0a96fc26c006306f6b9d2a64c2435363350a987b4c" "b9a9204174c09936593d7c6e69ba300486b58999cae067d4af5d5cb180784b42" "848b9a2c0d51fcbfec3ea1259653087c9643a6fc38b86ec87d50cedfc7f7acfb" "019e6b238b15887d2f0b92461b3e18d8e057773cb057d0867d1da71d47acd1f6" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "fe20c1ea61a2836a5cea69963865b5b8df8c480ccaf3f11ad7f2e1f543f6c274" default)))
 '(global-linum-mode nil)
 '(package-selected-packages (quote (elpy)))
 '(wakatime-cli-path "/usr/local/bin/wakatime")
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'wakatime-mode)
(global-wakatime-mode)

(global-set-key [home]		'move-beginning-of-line)
(global-set-key [end]		'move-end-of-line)
(global-set-key [PageUp]	'scroll-down)
(global-set-key [PageDown]	'scroll-up)
