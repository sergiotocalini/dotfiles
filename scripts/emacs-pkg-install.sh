#!/bin/bash
#
# I wrapped the code constructed in
#
# http://hacks-galore.org/aleix/blog/archives/2013/01/08/install-emacs-packages-from-command-line
#
# in a single bash script, so I would a single code snippet.
#

# Package to be installed
pkg_name="${1}"
packages=(
    better-defaults
    csharp-mode
    csproj-mode
    dotnet
    elpy
    elpygen
    flycheck
    go-complete
    go-mode
    jbeans-theme
    json-mode
    kubernetes
    lsp-java
    lsp-treemacs
    magit
    magit-gitflow
    omnisharp
    powerline
    powershell
    pyenv-mode
    python-isort
    sass-mode
    shanty-themes
    terraform-mode
    treemacs-evil
    treemacs-icons-dired
    treemacs-magit
    treemacs-persp
    treepy
    twilight-theme
    use-package
    vdiff-magit
    wakatime-mode
    yaml-mode
    zenburn-theme
)

# Elisp script is created as a temporary file, to be removed after installing 
# the package
elisp_script_name=$(mktemp /tmp/emacs-pkg-install-el.XXXXXX)
elisp_code="
;;
;; Install package from command line. Example:
;;
;;   $ emacs --batch --eval \"(define pkg-to-install '(magit))\" -l emacs-pkg-install.el
;;
(require 'package)
(add-to-list 'package-archives '(\"melpa\" . \"https://melpa.org/packages/\") t)

(package-initialize)
(package-refresh-contents)

(dolist (p pkg-to-install)
  (unless (package-installed-p p))
    (package-install p))"

echo "$elisp_code" > $elisp_script_name

# if [ $# -ne 1 ]; then
#   echo "Usage: `basename $0` <package>"
#   exit 1
# fi

if [[ -z ${pkg_name} ]]; then
    pkgs=$(printf "%s " ${packages[@]})
else
    pkgs=${pkg_name}
fi
[[ -z ${pkgs} ]] || emacs --batch --eval "(defvar pkg-to-install '(${pkgs}))" -l $elisp_script_name

# Remove tmp file
rm "$elisp_script_name"
