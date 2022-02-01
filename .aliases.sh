#!/bin/bash

DOT="$HOME"/.dotfiles
PROGRAMS="$HOME"/programs
NEOVIM="$PROGRAMS"/neovim

if command -v exa &>/dev/null; then
	alias ls="exa"
fi

install() {
	$HOME/.bin/install-arch-package "$@"
}

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
alias sync="hub sync"

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
alias cdu="cd $PROGRAMS/uncrustify"
alias cdus="cd $PROGRAMS/uncrustify/src"
alias d="cd $DOT"
alias n="cd .config/nvim"
alias c="cd .config"

#config
alias ali="$EDITOR $HOME/.aliases.sh"
alias prc="$EDITOR .config/nvim/plugin/packer.lua"
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

# zsh-only aliases (mostly global aliases)
if [ -n "$ZSH_VERSION" ]; then
	alias -g A="| ack -i"
	alias -g R="| rg -i"
	alias -g C="| xclip -selection clipboard"
	alias -g L="| less"
	alias -g NE="2> /dev/null"
	alias -g NUL="&> /dev/null"

	# Remove first dollar in commands
	alias \$=''
fi

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

# Download youtube as mp3
alias yget="youtube-dl --extract-audio --audio-format mp3"

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

# Use make without printing the input and automatically use parallel jobs.
alias make="make -s"

# So ag doesn't print "Permission denied"
alias ag="ag --hidden --smart-case --silent --ignore .git"

# Make commands human-readable.
alias du="du -h"
alias df="df -h"
alias free="free -h"

# Fast tmux
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

alias logout="loginctl terminate-user dundar"

alias hook="cd .git/hooks"

alias ch="reset; shellcheck -x -e SC2086"
alias chs="ch -S style"
alias chi="ch -S info"
alias chw="ch -S warning"
alias che="ch -S error"

alias q="shellcheck -f diff"

chr() {
	reset
	find . -name "*.sh" -exec shellcheck -x -W 0 -e SC2086 "$@" {} \;
}

chra() {
	reset
	find . -type f -exec shellcheck -x -W 0 -e SC2086 "$@" {} \;
}

alias fo="shfmt -w -s"

lower() {
	for filename in "$@"; do
		filename_lower=$(echo $filename | tr '[:upper:]' '[:lower:]')
		mv -n $filename $filename_lower
	done
}

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

mp4copy() {
	ffmpeg -i $1 -c copy ${1%.*}.mp4
}

alias scc='scc --no-complexity --no-cocomo'

nuke() {
	if [[ $(pwd) != /home/dundar/programs/nvim-typo ]]; then
		echo "RUNNING DANGEROUS COMMAND OUTSITE OF TESTING AREA. ABORT"
		return 1
	fi

	while read -r branch; do
		[[ -n $branch ]] || continue

		git push origin --delete "$branch"
	done <<<"$(git branch --remotes | grep -v "main" | grep -v "master" | grep -v "HEAD" | sed 's|origin/||')"

	while read -r branch; do
		[[ -n $branch ]] || continue

		git branch -D "$branch"
	done <<<"$(git branch | grep -v main | grep -v master)"
}

gooo() {
	#nuke
	#branch="$*"
	#gcbb "$branch"
	#git commit --allow-empty -m "$branch"
	#gp
	#gh pr create --fill
	#gis master

	nuke
	branch="$*"
	gcbb "$branch"
	sed -i "s|$branch||g" src/nvim/highlight.c
	git add -A
	git commit -m "$branch"
	git push
	gh pr create --fill
	gh pr edit --add-label typo
	git switch master
}

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

build-uncrustify() {
	local uncrustify_build_path="$PROGRAMS/uncrustify/build"

	mkdir -p $uncrustify_build_path

	(
		cd $uncrustify_build_path >/dev/null

		git reset --hard 0dfafb27

		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release ..
		cmake --build .
	)
}

build-uncrustify-latest() {
	local uncrustify_build_path="$PROGRAMS/uncrustify/build"

	mkdir -p $uncrustify_build_path

	(
		cd $uncrustify_build_path >/dev/null

		git pull

		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release ..
		cmake --build .
	)

	command cp -f $PROGRAMS/uncrustify/build/compile_commands.json $PROGRAMS/uncrustify/
}

build-uncrustify-current() {
	local uncrustify_build_path="$PROGRAMS/uncrustify/build"

	mkdir -p $uncrustify_build_path

	(
		cd $uncrustify_build_path >/dev/null

		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release ..
		cmake --build .
	)
}

build-vim() (
	local vim_path="$PROGRAMS/vim"

	cd $vim_path >/dev/null
	touch src/**/*
	bear -- make -j
)

alias black="black -C"

alias cl='clang-format -i'
#alias un='uncrustify -c $NEOVIM/src/uncrustify.cfg --replace --no-backup'
#alias bun='$PROGRAMS/uncrustify/build/uncrustify -c $NEOVIM/src/uncrustify.cfg --replace --no-backup'
alias un='$PROGRAMS/uncrustify/build/uncrustify -c $NEOVIM/src/uncrustify.cfg --replace --no-backup'
alias clint='$NEOVIM/src/clint.py'
#alias unc-update='uncrustify -c $NEOVIM/src/uncrustify.cfg --update-config-with-doc -o $NEOVIM/src/uncrustify.cfg'
#alias bunc-update='$PROGRAMS/uncrustify/build/uncrustify -c $NEOVIM/src/uncrustify.cfg --update-config-with-doc -o $NEOVIM/src/uncrustify.cfg'
alias unc-update='$PROGRAMS/uncrustify/build/uncrustify -c $NEOVIM/src/uncrustify.cfg --update-config-with-doc -o $NEOVIM/src/uncrustify.cfg'

form() (
	setopt null_glob
	nvim_path="$NEOVIM/src/nvim"
	cd "$nvim_path" >/dev/null

	unc-update

	format_files=(**/*.{c,h})

	for i in "${format_files[@]}"; do
		un "$i" &
	done
	wait
)

tidy() {
	for i in "$@"; do
		clang-tidy --config-file "$HOME/.clang-tidy" "$i"
	done
}

alias codespell="codespell --config $HOME/.codespellrc"

vs() {
	while read -r file; do rg -iH "Maintainer:.*$@" $file; done <<<$(codespell | awk -F: '{print $1}' | sort -u)
}

pre-commit-enable() {
	root=$(git rev-parse --show-toplevel)
	hook_path=$root/.git/hooks
	mv $hook_path/pre-commit-disable $hook_path/pre-commit
}

pre-commit-disable() {
	root=$(git rev-parse --show-toplevel)
	hook_path=$root/.git/hooks
	mv $hook_path/pre-commit $hook_path/pre-commit-disable
}

countcast() {
	for i in char char_u; do
		rg "\((const)? *$i *\**\)" --stats --quiet **/*.c **/*.h | head -n2
	done | grep . | awk '{print $1}' | paste -sd+ | bc
}

vp1() {
	file="$1"
	file_basename="$(basename "$1")"

	if [[ $file_basename != *.c && $file_basename != *.h ]]; then
		return
	fi

	rm -f after.c before.c

	cp -f $file after.c
	un after.c

	git uncommit

	cp -f $file before.c
	un before.c

	diff -Naur before.c after.c >vim-patch

	sed -i "s|before.c|a/src/nvim/$file_basename|" vim-patch
	sed -i "s|after.c|b/src/nvim/$file_basename|" vim-patch

	mv -f vim-patch $NEOVIM

	(
		cd $NEOVIM
		patch -l -p1 -N -t --no-backup-if-mismatch <vim-patch
	)
}

vp() {
	rm -f **/*.rej *.patch
	version="$1"
	scripts/vim-patch.sh -p "$version"

	patch -l -p1 -N -t --no-backup-if-mismatch <*.patch

	(
		cd .vim-src
		git checkout "$version"

		while read -r file; do
			git checkout "$version"
			vp1 "$file"
		done <<<"$(git diff-tree --no-commit-id --name-only -r $version)"

		git checkout master
	)

	rm -f vim-patch **/*.orig
}

profile() {
	flamegraph --open $NEOVIM/bin/nvim "$@"
}

build-asan() (
	cd $NEOVIM

	make CMAKE_INSTALL_PREFIX=$NEOVIM CMAKE_EXTRA_FLAGS="-DCMAKE_C_COMPILER=clang -DCLANG_ASAN_UBSAN=1" CMAKE_BUILD_TYPE=RelWithDebInfo
	make install
)

asan() {
	UBSAN_OPTIONS=print_stacktrace=1 ASAN_OPTIONS=log_path=/tmp/nvim_asan $NEOVIM/bin/nvim "$@"
}

asan-log() {
	vi /tmp/nvim_asan
}

alias dvi="$NEOVIM/bin/nvim"
