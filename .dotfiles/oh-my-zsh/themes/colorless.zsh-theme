# colorless.zsh-theme

ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%1~$(git_prompt_info) %# '
RPROMPT='%(?..[$?])'

# vim: ft=sh
