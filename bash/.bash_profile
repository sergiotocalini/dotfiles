alias emacs="emacs -nw"

# Loading SSH keys
OS_FAMILY=`uname -s`
if [[ ${OS_FAMILY} == "Darwin" ]]; then
   find -E ~/.ssh/keys -regex '.*.(id_rsa|id_dsa)' | xargs keychain --agents ssh --inherit any
else
   find ~/.ssh/keys -regex ".*.\(id_rsa\|id_dsa\)" | xargs keychain --agents ssh --inherit any
fi
. ~/.keychain/$HOSTNAME-sh

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

# Load pyenv automatically by appending
# the following to ~/.bash_profile:
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
[ -f "${HOME}/google-cloud-sdk/path.bash.inc" ] && . "${HOME}/google-cloud-sdk/path.bash.inc"

# The next line enables shell command completion for gcloud.
[ -f "${HOME}/google-cloud-sdk/completion.bash.inc" ] && . "${HOME}/google-cloud-sdk/completion.bash.inc"

git_branch() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

export BASH_SILENCE_DEPRECATION_WARNING=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PS1="\u@\h:\w\[\033[\$((COLUMNS-10))G\] $RED[\t]\n$ "
