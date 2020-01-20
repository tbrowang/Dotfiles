export ZSH="/home/drigin/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

#-------------------------------------------------------------------

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_arch_icon dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_CUSTOM_ARCH_ICON="echo  "
POWERLEVEL9K_CUSTOM_ARCH_ICON_BACKGROUND=069
POWERLEVEL9K_CUSTOM_ARCH_ICON_FOREGROUND=015
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

#--------------------------------------------------------------------

plugins=(git autojump colored-man-pages)

#--------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------

alias open="xdg-open"
alias cat="bat"
alias ls="lsd"
alias cls="clear && ls"
alias cl="clear"
alias gl="git --no-pager log --graph --decorate --oneline"
alias gs="git status -unormal"
alias gsa="git status -uall"
alias gcm="git commit -m"
alias gg="gcc -Wall -Wextra -Werror"
alias vim="nvim"
#--------------------------------------------------------------------

# cd then ls
function cd() { builtin cd "$*" && ls; }

#--------------------------------------------------------------------
neofetch
