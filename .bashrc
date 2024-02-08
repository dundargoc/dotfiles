#!/bin/bash

ex() {
        # # ex - archive extractor
        # # usage: ex <file>
        if [[ -f $1 ]]; then
                case $1 in
                *.tar.bz2) tar xjf "$1" ;;
                *.tar.gz) tar xzf "$1" ;;
                *.bz2) bunzip2 "$1" ;;
                *.rar) unrar x "$1" ;;
                *.gz) gunzip "$1" ;;
                *.tar) tar xf "$1" ;;
                *.tbz2) tar xjf "$1" ;;
                *.tgz) tar xzf "$1" ;;
                *.zip) unzip "$1" ;;
                *.Z) uncompress "$1" ;;
                *.7z) 7z x "$1" ;;
                *) echo "'$1' cannot be extracted via ex()" ;;
                esac
        else
                echo "'$1' is not a valid file"
        fi
}

EnableColors() {
        local use_color=true

        # Set colorful PS1 only on colorful terminals.
        # dircolors --print-database uses its own built-in database
        # instead of using /etc/DIR_COLORS.  Try to use the external file
        # first to take advantage of user additions.  Use internal bash
        # globbing instead of external grep binary.
        local safe_term=${TERM//[^[:alnum:]]/?} # sanitize TERM
        local match_lhs=""
        [[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
        [[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
        [[ -z ${match_lhs} ]] &&
                type -P dircolors >/dev/null &&
                match_lhs=$(dircolors --print-database)
        [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

        if ${use_color}; then
                # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
                if type -P dircolors >/dev/null; then
                        if [[ -f ~/.dir_colors ]]; then
                                eval "$(dircolors -b ~/.dir_colors)"
                        elif [[ -f /etc/DIR_COLORS ]]; then
                                eval "$(dircolors -b /etc/DIR_COLORS)"
                        fi
                fi

                if [[ ${EUID} == 0 ]]; then
                        PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
                else
                        PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
                fi

                alias ls='ls --color=auto'
                alias grep='grep --colour=auto'
                alias egrep='egrep --colour=auto'
                alias fgrep='fgrep --colour=auto'
        else
                if [[ ${EUID} == 0 ]]; then
                        # show root@ when we don't have colors
                        PS1='\u@\h \W \$ '
                else
                        PS1='\u@\h \w \$ '
                fi
        fi
}

ChangeWindowTitle() {

        # Change the window title of X terminals
        case ${TERM} in
        xterm* | rxvt* | Eterm* | aterm | kterm | gnome* | interix | konsole*)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
                ;;
        screen*)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
                ;;
        esac

}

main() {
        # Exit if shell isn't interactive
        [[ $- != *i* ]] && return

        ChangeWindowTitle
        EnableColors

        xhost +local:root >/dev/null 2>&1

        complete -cf sudo

        # Bash won't get SIGWINCH if another process is in the foreground.
        # Enable checkwinsize so that bash will check the terminal size when
        # it regains control.  #65623
        # http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
        shopt -s checkwinsize

        shopt -s expand_aliases

        shopt -s autocd # Allow .. without getting "command not found"

        # export QT_SELECT=4

        # Enable history appending instead of overwriting.  #139609
        shopt -s histappend

        source ~/.aliases.sh

        # Source nix if it exists
        if test -e $HOME/.nix-profile/etc/profile.d/nix.sh; then
                source $HOME/.nix-profile/etc/profile.d/nix.sh
        fi

        set -o vi

        alias rc='$EDITOR $HOME/.bashrc'
}

main
