#!/bin/sh

pkg_name="${1}"
packages=( 
    awscli
    azure-cli
    bash
    emacs
    flake8
    git
    google-cloud-sdk
    helm
    hstr
    ipython
    istioctl
    iterm2
    keychain
    pyenv
    pylint
    python
    shellcheck
    terraform
    tree
    pyenv-virtualenv
    wakatime-cli
)

function brew_install_or_upgrade {
    if brew ls --versions "$1" >/dev/null; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "$1"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 brew install "$1"
    fi
}

if [[ -z ${pkg_name} ]]; then
    for p in ${packages[@]}; do
	brew_install_or_upgrade "${p}"
    done
else
    brew_install_or_upgrade "${pkg_name}"
fi
