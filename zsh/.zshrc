# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9999999
SAVEHIST=9999999
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lukas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PATH=/home/lukas/bin/anaconda2/bin:$PATH

export EDITOR="emacsclient -nw"

ZGEN_RESET_ON_CHANGE=("${HOME}/.zshrc")
source "${HOME}/bin/zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/dnf
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/colorize
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh themes/blinks
    zgen save

fi
