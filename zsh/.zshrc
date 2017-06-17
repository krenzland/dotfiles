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

PATH=/usr/local/cuda-8.0/bin:$HOME/.cargo/bin:/home/lukas/bin/anaconda2/bin:/home/lukaskrenz/anaconda2/bin:$PATH

export EDITOR="emacsclient -nw --alternate-editor= "

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

if [[ ! -a fortune ]]; then
    fortune
fi


# added by travis gem
[ -f /home/lukas/.travis/travis.sh ] && source /home/lukas/.travis/travis.sh

# Fix strange bug with matlab (otherwise plots don't work!)
alias matlab="LD_PRELOAD=/usr/lib64/libstdc++.so.6 ~/bin/matlab/bin/matlab -desktop"  

# Add CUDA-Header
export CPATH=/usr/include/cuda/

if module avail 2>&1 | grep -q "openmpi"; then
   module load "mpi/openmpi-x86_64" -s
fi
