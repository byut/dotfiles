#  ==========================================================================  #

#
# $HOME/.zshrc
#
# The following script is executed whenever an interactive shell session is
# initiated.
#

#  ==========================================================================  #

export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH/custom"

ZSH_THEME="robbyrussell"

if [ -d $ZSH ] && [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi
