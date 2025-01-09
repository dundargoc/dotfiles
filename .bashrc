#!/bin/bash

main() {
        # Exit if shell isn't interactive
        [[ $- != *i* ]] && return

        unameOut="$(uname -s)"
        home=$HOME
        case "${unameOut}" in
            Linux*)
                ;;
            Darwin*)
                ;;
            CYGWIN*)
                home=$(cygpath --mixed $HOME)
                set -o igncr # Ignore line endings
                ;;
        esac

        xhost +local:root >/dev/null 2>&1

        # Bash won't get SIGWINCH if another process is in the foreground.
        # Enable checkwinsize so that bash will check the terminal size when
        # it regains control.  #65623
        # http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
        shopt -s checkwinsize
        shopt -s expand_aliases
        shopt -s autocd # Allow .. without getting "command not found"
        shopt -s histappend # Enable history appending instead of overwriting.  #139609

        source ~/.aliases.sh

        # Source nix if it exists
        if test -e $home/.nix-profile/etc/profile.d/nix.sh; then
                source $home/.nix-profile/etc/profile.d/nix.sh
        fi

        set -o vi

        alias rc='$EDITOR $home/.bashrc'
}

main
