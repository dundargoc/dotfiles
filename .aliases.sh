#!/bin/bash

if command -v nvim &>/dev/null; then
        export EDITOR=vim
fi
DOT="$HOME"/.dotfiles
PROGRAMS="$HOME"/programs
NEOVIM="$PROGRAMS"/neovim

if command -v exa &>/dev/null; then
	alias ls="exa"
fi

alias show="yay -Si"
alias search="yay -Ss"
alias fsearch="yay -F"
alias remove="yay -Rs"
alias mirror="sudo pacman-mirrors -id"
alias orphan='yay -Qdtq | yay -Rs -'

# git
alias abort="git rebase --abort"
alias amend="git commit --amend --no-verify --allow-empty"
alias good="git bisect good"
alias bad="git bisect bad"
alias bisect="git bisect start"
fix() {
	git add -A
	git commit --no-verify --allow-empty --fixup="$@"
}
alias ga="git add -A"
alias gac="git add .; git commit"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete"
gbdr() {
	git push origin --delete "$@"
}
gbdd() {
	git push origin --delete "$@"
	git branch -D "$@"
}
alias gbD="git branch -D"
alias gbu="git branch --unset-upstream"
alias gc="git commit"
alias gcb="git checkout -b"
gcbb() {
	git checkout -b "$@"
	git push --set-upstream origin "$@"
}
gcd() {
	root_path="$(git rev-parse --show-toplevel)" || return
	cd "$root_path"
}
gcf() {
	modified_file_full_path="$(git status --porcelain | awk '{print $2}')"
	modified_file="$(basename $modified_file_full_path)"
	git add -A
	git commit -m "$modified_file"
}
alias gd="git diff"
alias gdw="git diff --word-diff-regex='\w*'"
alias gdc="git diff --cached"
alias gdcw="git diff --cached --word-diff-regex='\w*'"
gdm() {
	git diff master..."$(git branch --show-current)" "$@"
}

gcl() {
	gh repo clone "$@" -- --recursive
}

fork() {
	gh repo fork --clone=true "$@"
}

gcl1() {
	gh repo clone "$@" -- --depth=1
}

alias gclc="git clean -fd :/"
alias gch="git cherry-pick"
alias gcn="git commit --no-verify"
alias gco="git checkout"
alias gis="git switch"
alias gf="git add .; git commit -m 'chore: quick update, squash later'"
alias gfn="git add .; git commit --no-verify -m 'chore: quick update, squash later'"
alias gt="git add .; git commit -m 'chore: test commit, will likely delete after'"
alias gk="gitk"
alias gl="git log --graph --full-history --pretty --oneline"
alias gla="gl --all"
alias gls="git log --stat --oneline"
alias gp="git push --quiet"
gps() {
	current_branch=$(git rev-parse --abbrev-ref HEAD)
	git push --set-upstream origin "$current_branch"
}
alias gpa="git push --all"
alias gpl="git pull"
alias gpla="git pull --all"
alias gpf='git push --force-with-lease --quiet'
alias gpf!='git push --force'
alias gpt="git push --tags"
alias gr="git remote"
alias grr="git remote remove"
alias gre="git rebase"
alias grea="git rebase --abort"
alias grec="git rebase --continue"
alias grem="git rebase master"
alias groot="git rebase --root -i"
alias gres="git restore"
gri() {
	git rebase -i HEAD~"${1:-10}"
}
grim() {
	current_branch="$(git branch --show-current)"
	ancestor="$(git merge-base "$current_branch" master)"
	git rebase -i $ancestor
}
alias gs="git status"
alias gopen="git open"

alias gl1="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

# vim
alias vi='$EDITOR'
alias svi='sudo $EDITOR'

#ls
alias la="ls -a"
alias ll="la -l"

# goto
alias cdf="cd .config/fish"
alias cdd="cd $HOME/Downloads"
alias cdn="cd $NEOVIM"
alias cdni="cd $NEOVIM/.github/workflows"
alias cdnc="cd $NEOVIM/contrib"
alias cdnd="cd $NEOVIM/runtime/doc"
alias cdnr="cd $NEOVIM/runtime"
alias cdnn="cd $NEOVIM/src/nvim"
alias cdns="cd $NEOVIM/src"
alias cdp="cd $PROGRAMS"
alias cdv="cd $PROGRAMS/vim/src"
alias d="cd $DOT"
alias n="cd .config/nvim"
alias c="cd .config"

#config
alias ali="$EDITOR $HOME/.aliases.sh"
alias rc="$EDITOR $HOME/.zshrc"
alias brc="$EDITOR $HOME/.bashrc"
alias frc="$EDITOR .config/fish/config.fish"
alias zenv="$EDITOR $HOME/.zshenv"
alias unrc="$EDITOR $NEOVIM/src/uncrustify.cfg"
alias vimrc="$EDITOR $HOME/.config/nvim/init.lua"
alias bsprc="$EDITOR $HOME/.config/bspwm/bspwmrc"
alias sxhrc="$EDITOR $HOME/.config/sxhkd/sxhkdrc"
alias trc="$EDITOR $HOME/.tmux.conf"
alias gconf="$EDITOR $HOME/.gitconfig"

# reload current shell
if [ -n "$ZSH_VERSION" ]; then
	alias reload="exec zsh -o NO_GLOBAL_RCS"
else
	alias reload="exec bash"
fi

# Exec new shell
alias z="exec zsh -o NO_GLOBAL_RCS"
alias b="exec bash"
alias f="exec fish"

# reset
if [[ "$TMUX" ]]; then
	alias reset="clear; tmux clearhist"
else
	alias reset="tput reset"
fi

# wifi
alias wifi="sudo nmtui"

# Safe/verbose ops
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"
alias mkdir="mkdir -pv"

# xclip
alias clip="xclip -sel clip <"

# web
fire() {
	firefox "$1" NUL
}
chrome() {
	google-chrome-stable "$1" NUL
}

# rmdir
alias rmd="rmdir * 2>/dev/null"

# Restore dotfiles
alias restore="pushd -q && cd -q $DOT && git checkout . && popd -q && reload"

# Don't record in history.
alias vlc=" vlc"

# Screenshot
ss() {
	gnome-screenshot NUL -d "${1:-2}" &
}

# Brightness
alias x="brightnessctl set"
alias x+="brightnessctl set +3%"
alias x-="brightnessctl set 3%-"
alias xmax="brightnessctl set 100%"
alias xmin="brightnessctl set 1%"

# Use make without printing the input
alias make="make -s"

# So ag doesn't print "Permission denied"
alias ag="ag --hidden --smart-case --silent --ignore .git"

alias t="tmux"

# Print human-readable PATH and FPATH
alias path="tr ':' '\n' <<< $PATH"
alias fpath="tr ':' '\n' <<< $FPATH"

# allow sudo to expand aliases as well as run anything in $PATH
alias sudo='sudo env PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"	'

# Function for quick virtual environment activation.
activate() {
	activate_file="$(find . -type f -name "activate")"
	number_of_files=$(echo $activate_file | wc -l)

	if ((number_of_files == 0)); then
		echo "No activate file found. Exiting."
		return 1
	elif ((number_of_files > 1)); then
		echo "Multiple activate files found:"
		echo "$activate_file"
		echo "Exiting."
		return 1
	fi

	source $activate_file
}

alias fo="shfmt -w -s"

alias rename="perl-rename -i"

alias detox="detox -s lower"

vmprof() {
	python -m vmprof --lines -o results.dat pre-commit
	vmprofshow --lines results.dat | less
	rm -f results.dat
}

alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

mpv() {
	command mpv ${@:-*}
}

alias scc='scc --no-complexity --no-cocomo'

cleanbuild() (
	cd $NEOVIM
	reset

	rm -rf build
	make CMAKE_INSTALL_PREFIX=$NEOVIM

	command cp -f build/compile_commands.json .
)

build() {
	make -C $NEOVIM CMAKE_INSTALL_PREFIX=$NEOVIM

	command cp -f $NEOVIM/build/compile_commands.json $NEOVIM/
}

buildinstall() {
	make -C $NEOVIM CMAKE_INSTALL_PREFIX=$NEOVIM CMAKE_BUILD_TYPE=RelWithDebInfo
	make -C $NEOVIM install
}

build-vim() (
	local vim_path="$PROGRAMS/vim"

	cd $vim_path >/dev/null
	touch src/**/*
	bear -- make -j
)

alias cl='clang-format -i'
alias un='$PROGRAMS/uncrustify/build/uncrustify -c $NEOVIM/src/uncrustify.cfg --replace --no-backup'
alias clint='$NEOVIM/src/clint.py'
alias unc-update='$PROGRAMS/uncrustify/build/uncrustify -c $NEOVIM/src/uncrustify.cfg --update-config-with-doc -o $NEOVIM/src/uncrustify.cfg'
