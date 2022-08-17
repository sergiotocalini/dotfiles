[ -n "$TERM" ] && export TERM=xterm 

COLOR_OFF="\[$(tput sgr0)\]"
COLOR_BOLD="\[$(tput bold)\]"
COLOR_BLINK="\[$(tput blink)\]"
COLOR_RED="\[$(tput setaf 1)\]"
COLOR_GREEN="\[$(tput setaf 2)\]"
COLOR_YELLOW="\[$(tput setaf 3)\]"
COLOR_BLUE="\[$(tput setaf 4)\]"
COLOR_MAGENTA="\[$(tput setaf 5)\]"
COLOR_CYAN="\[$(tput setaf 6)\]"

alias emacs="emacs -nw"
alias ll="ls -alFh"
alias myip="curl \"ipinfo.io/ip\""
alias k="kubectl"
alias t="tmux attach || tmux new-session"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH="/opt/homebrew/bin:$PATH"

# Loading SSH keys
OS_FAMILY=`uname -s`
if [[ ${OS_FAMILY} == "Darwin" ]]; then
    find -E ~/.ssh/keys/* -regex '.*.(id_rsa|id_dsa)' 2>/dev/null | xargs -0 keychain --agents ssh --inherit any
else
    find ~/.ssh/keys/* -regex ".*.\(id_rsa\|id_dsa\)" 2>/dev/null | xargs -0 keychain --agents ssh --inherit any
    . ~/.keychain/${HOSTNAME}-sh
fi

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

# Load jenv automatically by appending
# the following to ~/.bash_profile
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Load pyenv automatically by appending
# the following to ~/.bash_profile:
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
# The next line enables shell command completion for gcloud.
GOOGLE_SDK="/usr/local/Caskroom/google-cloud-sdk/latest"
[ -f "${GOOGLE_SDK}/google-cloud-sdk/path.bash.inc"       ] && . "${GOOGLE_SDK}/google-cloud-sdk/path.bash.inc"
[ -f "${GOOGLE_SDK}/google-cloud-sdk/completion.bash.inc" ] && . "${GOOGLE_SDK}/google-cloud-sdk/completion.bash.inc"

# MySQL client
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

get_workspace() {
    output=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    [ -n "${output}" ] && echo "(${output}) "
}

export BASH_SILENCE_DEPRECATION_WARNING=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PS1="\n\u@${COLOR_BOLD}${COLOR_RED}\h${COLOR_OFF}:${COLOR_GREEN}\w${COLOR_OFF}\[\033[\$((COLUMNS-12))G\] $(tput setab 7)$(tput setaf 0)[ \t ]${COLOR_OFF}\n${COLOR_BLINK}${COLOR_YELLOW}\$(get_workspace)${COLOR_OFF}$ "

if [ -t 0 ]; then
   neofetch
fi
