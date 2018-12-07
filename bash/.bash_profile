alias emacs="emacs-26.1 -nw"

if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
  . $(brew --prefix)/opt/mcfly/mcfly.bash
fi

# Loading SSH keys
OS_FAMILY=`uname -s`
if [[ ${OS_FAMILY} == "Darwin" ]]; then
   find -E ~/.ssh/keys -regex '.*.(id_rsa|id_dsa)' | xargs keychain --agents ssh --inherit any
else
   find ~/.ssh/keys -regex ".*.\(id_rsa\|id_dsa\)" | xargs keychain --agents ssh --inherit any
fi
. ~/.keychain/$HOSTNAME-sh
