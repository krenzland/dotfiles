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
PATH=${PATH}:$HOME/.local/bin/:$HOME/.cargo/bin:/home/lukas/bin/anaconda3/bin:/home/lukas/bin/intel/bin
#PATH=${PATH}:/usr/local/cuda-8.0/bin:$HOME/.cargo/bin:/home/lukas/bin/anaconda3/bin:/home/lukas/bin/intel/bin

export EDITOR="emacsclient -nw --alternate-editor= "

ZGEN_RESET_ON_CHANGE=("${HOME}/.zshrc")
source "${HOME}/bin/zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
#    zgen oh-my-zsh plugins/dnf
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
export CPATH=/usr/include/cuda/${CPATH}

# VTK
export LD_LIBRARY_PATH=/home/lukas/src/vtkbuild/lib:${LD_LIBRARY_PATH}
#export PYTHONPATH=/home/lukas/src/VTKBlender:/home/lukas/src/vtkbuild/Wrapping/Python:/home/lukas/src/vtkbuild/lib:${PYTHONPATH}
alias python3=/home/lukas/bin/anaconda3/bin/python3
alias jupyter3=/home/lukas/bin/anaconda3/bin/jupyter
alias jupyter2=/home/lukas/bin/anaconda2/bin/jupyter

if module avail 2>&1 | grep -q "openmpi"; then
   module load "mpi/openmpi-x86_64" -s
fi

# Used functions
function ownip() {
    command curl --silent 'https://httpbin.org/ip' | command grep -o -e '[0-9\.]*' 
}

# Intel compilers:
LIBRARY_PATH=/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/intel64:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/intel64/gcc4.7:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/intel64:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/intel64/gcc4.7:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/ia32:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/ia32/gcc4.7:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/ia32:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/ia32/gcc4.7:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/intel64:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/intel64/gcc4.7:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/ia32:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/ia32/gcc4.7:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/../tbb/lib/ia32_lin/gcc4.4

LD_LIBRARY_PATH=/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/intel64:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mpi/intel64/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mpi/mic/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/intel64:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/intel64/gcc4.7:/home/lukas/bin/intel/debugger_2017/iga/lib:/home/lukas/bin/intel/debugger_2017/libipt/intel64/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mpi/intel64/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mpi/mic/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/intel64:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/intel64/gcc4.7:/home/lukas/bin/intel/debugger_2017/iga/lib:/home/lukas/bin/intel/debugger_2017/libipt/intel64/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/ia32:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/ia32/gcc4.7:/home/lukas/bin/intel/debugger_2017/iga/lib:/home/lukas/bin/intel/debugger_2017/libipt/intel64/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/ia32:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/ia32/gcc4.7:/home/lukas/bin/intel/debugger_2017/iga/lib:/home/lukas/bin/intel/debugger_2017/libipt/intel64/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mpi/intel64/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mpi/mic/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/intel64:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/intel64/gcc4.7:/home/lukas/bin/intel/debugger_2017/iga/lib:/home/lukas/bin/intel/debugger_2017/libipt/intel64/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/intel64_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/ipp/lib/ia32:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/compiler/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/mkl/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/tbb/lib/ia32/gcc4.7:/home/lukas/bin/intel/debugger_2017/iga/lib:/home/lukas/bin/intel/debugger_2017/libipt/intel64/lib:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/lib/ia32_lin:/home/lukas/bin/intel/compilers_and_libraries_2017.4.196/linux/daal/../tbb/lib/ia32_lin/gcc4.4:${LD_LIBRARY_PATH}
