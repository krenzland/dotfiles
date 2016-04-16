#!/usr/bin/env bash
set -o errexit
set -o nounset

install-dotfiles() {
    printf "Installing dotfiles!\n"
}

install-dependencies() {
    printf "Currently unsupported.\n"
}

show-help() {
    printf "Welcome to Lukas' dotfiles. \n"
    printf "Command line options:\n"
}

main() {
    if [ "$1" = true ]; then
        install-dependencies
    fi
    if [ "$2" = true ]; then
        install-dotfiles
    fi

}

installDep=false
installDot=false

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -d|--dependencies)
    echo "-d"
    installDep=true
    ;;
    -c|--config)
    echo "-c"
    installDot=true
    ;;
    -h|--help)
    show-help
    ;;
    *)
    printf "Unknown argument $1"\n
    ;;
esac
shift
done

main $installDep $installDot
