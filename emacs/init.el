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

(global-linum-mode t)              ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")  ;; format line number spacing
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
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "ebbd4bbb0f017cb09f7a3b1363b83dfde0c5f4970cda2705419457366cd2de91" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "5b20570781c33819c0b4bcb009305dbe5a9ed12fcedca10e29f1703b5b9d3f96" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "0542fbd0a5a636ff3000d77c5ddf5da6c375976c921efb83960f425e4b399a99" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "4c98274d8b42189a2f4c2b791f79cc4ed593fb9120a77b2da5a5d80cb6c84d87" "a2afb83e8da1d92f83543967fb75a490674a755440d0ce405cf9d9ae008d0018" "980f0adf3421c25edf7b789a046d542e3b45d001735c87057bccb7a411712d09" "a1e99cb36d6235abbe426a0a96fc26c006306f6b9d2a64c2435363350a987b4c" "b9a9204174c09936593d7c6e69ba300486b58999cae067d4af5d5cb180784b42" "848b9a2c0d51fcbfec3ea1259653087c9643a6fc38b86ec87d50cedfc7f7acfb" "019e6b238b15887d2f0b92461b3e18d8e057773cb057d0867d1da71d47acd1f6" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "fe20c1ea61a2836a5cea69963865b5b8df8c480ccaf3f11ad7f2e1f543f6c274" default)))
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (powerline better-defaults magit elpy)))
 '(tool-bar-mode nil)
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

(elpy-enable)
;; (setq python-shell-interpreter "ipython"
;;      python-shell-interpreter-args "-i --simple-prompt")

(global-set-key [home]		  'move-beginning-of-line)
(global-set-key [end]		  'move-end-of-line)
(global-set-key [PageUp]	  'scroll-down)
(global-set-key [PageDown]	  'scroll-up)
(global-set-key [f1]		  'eshell)
(global-set-key (kbd "C-<down>")  'enlarge-window)
(global-set-key (kbd "C-<up>")    'shrink-window)
(global-set-key (kbd "C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
