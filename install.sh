#!/bin/bash
ACTION="${1:-ALL}"
SCRIPT_PATH=$( cd "$(dirname $0)" && pwd )
OS_FAMILY=$(uname -s)
if [[ ${OS_FAMILY} == "Darwin" ]]; then
    [[ ${ACTION} =~ ALL|xcode ]] && xcode-select --install
    [[ ${ACTION} =~ ALL|brew  ]] && "${SCRIPT_PATH}/scripts/brew-pkg-install.sh"
    [[ ${ACTION} =~ ALL|emacs ]] && "${SCRIPT_PATH}/scripts/emacs-pkg-install.sh"
    if [[ ${ACTION} =~ ALL|configs ]]; then
	defaults write com.apple.finder ShowPathbar -bool true
	defaults write com.apple.finder ShowStatusBar -bool true
	defaults write com.apple.screencapture location ~/Screenshots
	defaults write com.apple.dock no-bouncing -bool FALSE
    fi
elif [[ ${OS_FAMILY} == "Linux" ]]; then
    sudo apt install emacs-nox git
    [[ ${ACTION} =~ ALL|emacs ]] && "${SCRIPT_PATH}/scripts/emacs-pkg-install.sh"
fi

if [[ ${ACTION} =~ ALL|configs ]]; then
   ln -sf  "${SCRIPT_PATH}/ssh/config"          ~/.ssh/config
   ln -sfn "${SCRIPT_PATH}/neofetch"            ~/.config/neofetch
   ln -sfn "${SCRIPT_PATH}/tmux"                ~/.config/tmux
   ln -sfn "${SCRIPT_PATH}/git"                 ~/.config/git
   ln -sfn "${SCRIPT_PATH}/emacs"               ~/.emacs.d
   ln -sf  "${SCRIPT_PATH}/bash/.bash_profile"  ~/.bash_profile
   ln -sf ~/.bash_profile ~/.bashrc
fi
