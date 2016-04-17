#!/usr/bin/env bash
set -o errexit
set -o nounset

install-dotfiles() {
    printf "Installing dotfiles!\n"
    stow emacs
}

install-dependencies() {
    printf "Feature install-dependencies currently not supported!.\n"
}

show-help() {
    cat <<EOF
Welcome to my configuration installer.
Usage:
-d | --dependencies    Install programs that I use often.
-c | --config          Install my dotfiles.
-h | --help            Show this document.
EOF
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

if [[ $# -eq 0 ]]; then
    show-help
fi

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -d|--dependencies)
    installDep=true
    ;;
    -c|--config)
    installDot=true
    ;;
    -h|--help)
    show-help
    exit 1
    ;;
    *)
    printf "Unknown argument $1\n"
    show-help
    exit 1
    ;;
esac
shift
done

main $installDep $installDot
