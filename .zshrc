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

DISABLE_AUTO_TITLE="true"

if [ -d $ZSH ] && [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi

#  ==========================================================================  #

alias sc="source $HOME/.zshrc"

alias ctest="env GTEST_COLOR=1 ctest --output-on-failure"

alias g="git"
alias l="less"
alias v="nvim"

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

alias ls="ls --color=auto -Fh"
alias ll="ls -l"
alias la="ls -lA"
alias lsa="ls -A"

alias tma="(tmux attach-session || tmux new-session -s $USER -c ~) &> /dev/null"

alias config="git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME"
config config --local status.showUntrackedFiles no
