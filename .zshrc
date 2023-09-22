# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Oh My Zsh

export ZSH="$HOME/.oh-my-zsh"

# The name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(archlinux git)

source $ZSH/oh-my-zsh.sh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Aliases

alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

alias rm="rm -rf"
alias mkdir="mkdir -p"
alias la="ls -alF"

alias v="nvim"
alias vim="nvim"

alias g="git"
alias l="less"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Zsh Plugin Manager (zplug)

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "hlissner/zsh-autopair"
zplug "esc/conda-zsh-completion"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins that have not been installed
if ! zplug check; then
    zplug install
fi

zplug load
