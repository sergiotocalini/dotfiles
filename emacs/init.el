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

(load-theme 'sanityinc-tomorrow-night t)

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

(global-linum-mode t)              ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")  ;; format line number spacing
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; turn off ring bell
(setq ring-bell-function 'ignore)

;; turn on visible bell
(setq visible-bell t)

(setq-default
 js-indent-level 2
 js2-basic-offset 2
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(unless package-archive-contents
  (package-refresh-contents))

(require 'wakatime-mode)
(global-wakatime-mode)
(load-file (expand-file-name
            (cond ((eq system-type 'windows-nt) "system-windows-nt.el")
                  ((eq system-type 'gnu/linux) "system-gnu-linux.el")
                  ((eq system-type 'darwin) "system-darwin.el")
                  (t "system-default.el"))
            user-emacs-directory))


(require 'pyenv-mode)
(require 'python-isort)
(add-hook 'python-mode-hook 'python-isort-on-save-mode)

(add-hook 'sh-mode-hook 'flycheck-mode)

;;; C-f in the magit status buffer invokes the magit-gitflow popup. If you
;;; would like to use a different key, set the magit-gitflow-popup-key variable
;;; before loading magit-gitflow
(setq magit-gitflow-popup-key "C-n")

(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
 
;;(global-set-key (kbd "C-SPC")     'set-mark-command)
(global-set-key [home]		  'move-beginning-of-line)
(global-set-key [end]		  'move-end-of-line)
(global-set-key [PageUp]	  'scroll-down)
(global-set-key [PageDown]	  'scroll-up)
(global-set-key (kbd "C-<down>")  'enlarge-window)
(global-set-key (kbd "C-<up>")    'shrink-window)
(global-set-key (kbd "C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key [f1]		  'eshell)
(global-set-key [f2]		  'magit-status)
(global-set-key [f3]		  'elpy-check)
(global-set-key [f4]              'comment-or-uncomment-region)
(global-set-key [f8]              'treemacs)

(defun dos2unix ()
  "Not exactly but it's easier to remember"
  (interactive)
  (set-buffer-file-coding-system 'unix 't) )

;; (setq url-proxy-services '(("http" . "force-proxy-eur.pac.schneider-electric.com:80")("https" . "force-proxy-eur.pac.schneider-electric.com:80")))

(require 'use-package)
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   1
          treemacs-indentation-string            (propertize "⫶" 'face 'font-lock-comment-face)
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
	  treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         40
	  treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;; (treemacs-resize-icons 10) ;; compile emacs with imagemagic
    
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
    :bind
    (:map global-map
          ("M-0"       . treemacs-select-window)
          ("C-x t 1"   . treemacs-delete-other-windows)
          ("C-x t t"   . treemacs)
          ("C-x t B"   . treemacs-bookmark)
          ("C-x t C-t" . treemacs-find-file)
          ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

;; Projectile integration
(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview)
  :config
  (setq kubernetes-poll-frequency 3600
        kubernetes-redraw-frequency 3600))

(use-package markdown-preview-mode
  :ensure t
  :if (boundp 'mdcommand)
  :init
  (setq markdown-preview-auto-open nil)
  :custom
  (markdown-preview-host "0.0.0.0")
  (markdown-preview-http-host "0.0.0.0"))

(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
      (pyenv-mode-unset))))

(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)
(put 'downcase-region 'disabled nil)

(elpy-enable)
(use-package elpy
  :ensure t
  :config (setq python-shell-interpreter "python3")
  :init
  (elpy-enable))

(setenv "PYTHONIOENCODING" "utf-8")
(add-to-list 'process-coding-system-alist '("python" . (utf-8 . utf-8)))
(add-to-list 'process-coding-system-alist '("elpy" . (utf-8 . utf-8)))
(add-to-list 'process-coding-system-alist '("flake8" . (utf-8 . utf-8)))

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(require 'go-complete)
(add-hook 'completion-at-point-functions 'go-complete-at-point)
