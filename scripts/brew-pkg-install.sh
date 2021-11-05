#!/bin/sh

pkg_name="${1}"
packages=(
    ansible
    awscli
    azure-cli
    bash
    dbeaver-community
    emacs
    flake8
    gimp
    git
    google-cloud-sdk
    gpg-suite
    helm
    hstr
    ipython
    isort
    istioctl
    iterm2
    keychain
    neofetch
    octant
    openssl
    pyenv
    pyenv-virtualenv
    pylint
    python
    readline
    rectangle
    shellcheck    
    sqlite3
    tfenv
    tflint
    tfsec
    the-unarchiver
    tree    
    tunnelblick
    vagrant
    wakatime-cli
    xz
    zlib
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
