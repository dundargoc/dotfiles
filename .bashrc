#!/bin/bash

main() {
        # Exit if shell isn't interactive
        [[ $- != *i* ]] && return

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
        if test -e $HOME/.nix-profile/etc/profile.d/nix.sh; then
                source $HOME/.nix-profile/etc/profile.d/nix.sh
        fi

        # FIXME: Doesn't seem to work for some reason
        # set -o vi

        alias rc='$EDITOR $HOME/.bashrc'
}

main
