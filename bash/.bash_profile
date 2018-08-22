alias emacs="emacs-26.1 -nw"

# Loading SSH keys
find -E ~/.ssh/keys -regex '.*.(id_rsa|id_dsa)' | xargs keychain --agents ssh --inherit any
. ~/.keychain/$HOSTNAME-sh
