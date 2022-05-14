#!/bin/sh

pkg_name="${1}"
packages=(
    ansible
    awscli
    azure-cli
    bash
    bash-completion
    curl
    dbeaver-community
    dotnet
    emacs
    flake8
    gimp
    git
    gitversion
    go
    google-cloud-sdk
    gpg-suite
    helm
    hstr
    ipython
    isort
    istioctl
    iterm2
    jenv
    jq
    keychain
    kubectl
    mysql-shell
    neofetch
    octant
    odbc-manager
    orange
    openssl
    putty
    pyenv
    pyenv-virtualenv
    pylint
    python
    readline
    rectangle
    royal-tsx
    shellcheck    
    sqlite3
    tfenv
    tflint
    tfsec
    the-unarchiver
    tree
    trivy
    tunnelblick
    unixodbc
    vagrant
    wakatime-cli
    wget
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
