#  ==========================================================================  #

#
# $HOME/.zshrc
#
# The following script is executed whenever an interactive shell session is
# initiated.
#

#  ==========================================================================  #

export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.dotfiles/oh-my-zsh"

ZSH_THEME="colorless"

if [ -d $ZSH ] && [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi
