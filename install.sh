#!/bin/sh
ACTION="${1:-ALL}"
SCRIPT_PATH=$( cd "$(dirname $0)" && pwd )
OS_FAMILY=$(uname -s)
if [ ${OS_FAMILY} == "Darwin" ]; then
    [[ ${ACTION} =~ ALL|brew  ]] && "${SCRIPT_PATH}/scripts/brew-pkg-install.sh"
    [[ ${ACTION} =~ ALL|emacs ]] && "${SCRIPT_PATH}/scripts/emacs-pkg-install.sh"
    
    ln -sf  "${SCRIPT_PATH}/bash/.bash_profile"  ~/.bash_profile
    ln -sf  "${SCRIPT_PATH}/ssh/config"          ~/.ssh/config
    ln -sfn "${SCRIPT_PATH}/git"                 ~/.config/git
    ln -sfn "${SCRIPT_PATH}/emacs"               ~/.emacs.d
fi

ln -sf ~/.bash_profile ~/.bashrc
