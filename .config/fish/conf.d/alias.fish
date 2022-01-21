#ls
if type -q exa
  alias ls "exa"
end
alias la="ls -a"
alias ll="la -l"

alias ag "rg --ignore-case --hidden"

if grep -iq ubuntu /etc/os-release
  alias install "sudo apt install"
  alias show "apt show"
  alias search "apt search"
  alias remove "sudo apt remove"
  alias prune "sudo apt autoremove"
else
  alias install "$HOME/.bin/install-arch-package"
  alias show "paru -Si"
  alias search "paru -Ss"
  alias remove "paru -Rs"
  alias prune "sudo paccache -ruk0; paru -Scc --noconfirm"
end

alias upgrade "topgrade"

alias fsearch "paru -F"
alias mirror "sudo pacman-mirrors -id"
alias orphan 'paru --clean'
alias gitlist "list | rg '\-git'"

# git
alias amend "git commit --amend --no-verify --allow-empty"
alias ameno "git commit --amend --no-verify --allow-empty --no-edit"
alias good "git bisect good"
alias bad "git bisect bad"
alias bisect "git bisect start"

function fix --argument-names 'commit'
	git add -A
	git commit --no-verify --allow-empty --fixup="$commit"
end

alias gac="git add -A; git commit"
alias gaf="git add -f"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete"
alias gbD="git branch -D"
alias gbu="git branch --unset-upstream"
alias gc="git commit"
alias gcb="git checkout -b"
alias check "gh pr checkout"
alias gd="git diff"
alias gdw="git diff --word-diff"
alias gdc="git diff --cached"
alias gdcw="git diff --cached --word-diff"
alias gdm "git diff master...(git branch --show-current)" 
alias gcd "cd (git rev-parse --show-toplevel)" 
alias gcl1="git clone --depth=1"
alias gclc="git clean -fd :/"
alias gcn="git commit --no-verify"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gf="git add -A; git commit -m 'chore: quick update, squash later'"
alias gfn="git add -A; git commit --no-verify -m 'chore: quick update, squash later'"
alias gt="git add -A; git commit -m 'chore: test commit, will likely delete after'"
alias gl="git log --graph --full-history --pretty --oneline"
alias gla="gl --all"
alias glp="git log -p"
alias gls="git log --stat --oneline"
alias gpa="git push --all"
alias gpl="git pull --rebase"
alias gpf='git push --force-with-lease --quiet'
alias gpt="git push --tags"
alias gr="git remote"
alias gre="git rebase"
alias grec="git rebase --continue"
alias groot="git rebase --root -i"
alias gres="git restore"
alias gs="git status"
alias gsh="git show"
alias gshw="git show --word-diff"
alias gl1="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias git-add-upstream "git remote add upstream"
alias s="hub sync"

# vim
alias vi '$EDITOR'
alias vid "vi -d"
alias svi 'sudo $EDITOR'
alias view 'vi -M'

# goto
alias cdd="cd $HOME/Downloads"
alias cdp="cd $HOME/programs"
alias cdf="cd $HOME/programs/fish-shell"
alias cdfc="cd $HOME/programs/fish-shell/share/completions"
alias cdn="cd $HOME/programs/neovim"
alias cdnd="cd $HOME/programs/neovim/runtime/doc"
alias cdni="cd $HOME/programs/neovim/.github/workflows"
alias cdnl="cd $HOME/programs/neovim/runtime/lua/vim"
alias cdnc="cd $HOME/programs/neovim/scripts"
alias cdnci="cd $HOME/programs/neovim/ci"
alias cdnr="cd $HOME/programs/neovim/runtime"
alias cdnn="cd $HOME/programs/neovim/src/nvim"
alias cdns="cd $HOME/programs/neovim/src"
alias cdl="cd $HOME/programs/nvim-lspconfig"
alias cdli="cd $HOME/programs/nvim-lspconfig/.github/workflows"
alias cds="cd $HOME/programs/services/src"
alias cdsv="cd $HOME/programs/services/src/services/victoria/ui"
alias cdsva="cd $HOME/programs/services/src/services/victoria/ui/ui/components/Activity"
alias cdv="cd $HOME/programs/vim/src"
alias cdu="cd $HOME/programs/uncrustify"

# Goto dotfiles
alias dfi="cd $HOME/.config/fish"
alias dfc="cd $HOME/.config/fish/completions"
alias dfd="cd $HOME/.config/fish/conf.d"
alias dff="cd $HOME/.config/fish/functions"
alias dm="cd $HOME/.misc"
alias dn="cd $HOME/.config/nvim"
alias dnp="cd $HOME/.config/nvim/plugin"
alias c="cd $HOME/.config"
alias ft="cd $HOME/ftplugin"
alias db="cd $HOME/.bin"
alias dp="cd $HOME/.private-dotfiles"

#config
alias ali="$EDITOR $HOME/.config/fish/conf.d/alias.fish"
alias prc="$EDITOR $HOME/.config/nvim/plugin/packer.lua"
alias rc="$EDITOR $HOME/.config/fish/config.fish"
alias brc="$EDITOR $HOME/.bashrc"
alias frc="$EDITOR $HOME/.config/fish/config.fish"
alias zenv="$EDITOR $HOME/.zshenv"
alias unrc="$EDITOR $HOME/programs/neovim/src/uncrustify.cfg"
alias vimrc="$EDITOR $HOME/.config/nvim/init.vim"
alias lsp="$EDITOR $XDG_CONFIG_HOME/nvim/plugin/lsp.lua"
alias ts="$EDITOR $XDG_CONFIG_HOME/nvim/plugin/treesitter.lua"
alias bsprc="$EDITOR $HOME/.config/bspwm/bspwmrc"
alias sxhrc="$EDITOR $HOME/.config/sxhkd/sxhkdrc"
alias trc="$EDITOR $HOME/.tmux.conf"
alias grc="$EDITOR $HOME/.gitconfig"

# reload current shell
alias reload="exec fish"

# Exec new shell
alias z="exec zsh -o NO_GLOBAL_RCS"
alias b="exec bash"
alias f="exec fish"

# reset
if set -q TMUX
	alias reset="clear; tmux clearhist"
else
	alias reset="tput reset"
end

# wifi
alias wifi="sudo nmtui"

# Make "dangerous" operations interactive
alias rm="rm -i"

alias mkdir="mkdir -p"

# xclip
alias clip="xclip -sel clip <"

# rmdir
alias rmd="rmdir * 2>/dev/null"

# Restore dotfiles
alias restore="git -C $HOME checkout .; reload"

# Download youtube as mp3
alias yget="youtube-dl --extract-audio --audio-format mp3"

# Brightness
alias x="brightnessctl set"
alias x+="brightnessctl set +3%"
alias x-="brightnessctl set 3%-"
alias xmax="brightnessctl set 100%"
alias xmin="brightnessctl set 1%"

# Use make without printing the input and automatically use parallel jobs.
alias make="make -s"

# Make commands human-readable.
alias du="du -h"
alias df="df -h"
alias free="free -h"

# Fast tmux
alias t="tmux"

# Print human-readable PATH and FPATH
alias path='echo $PATH | tr " " "\n" | sort'

alias logout="loginctl terminate-user dundar"

alias ch="reset; shellcheck -a -x -e SC2086"
alias chs="ch -S style"
alias chi="ch -S info"
alias chw="ch -S warning"
alias che="ch -S error"

alias q="shellcheck -f diff"

alias fo="shfmt -w -s"

alias rename="perl-rename -i"

alias detox="detox -s lower"

alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

alias scc='scc --no-complexity --no-cocomo'

alias black="black -C"

alias cl='clang-format -i'
alias un='uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --replace --no-backup'
alias clint='$HOME/programs/neovim/src/clint.py'
alias unc-update='uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --update-config-with-doc -o $HOME/programs/neovim/src/uncrustify.cfg'

alias codespell="codespell -H --config $HOME/.codespellrc --ignore-words=$HOME/.codespell-ignorewords"

alias lint "make -C $HOME/programs/neovim lint"

alias bi "$HOME/programs/neovim/bin/nvim"
alias asan "UBSAN_OPTIONS=print_stacktrace=1 ASAN_OPTIONS=log_path=/tmp/nvim_asan $HOME/programs/neovim/bin/nvim"

alias asan-log "vi /tmp/nvim_asan"

alias lt "reset; languagetool --autoDetect --disable DASH_RULE,COMMA_PARENTHESIS_WHITESPACE,ARROWS,UNLIKELY_OPENING_PUNCTUATION,WHITESPACE_RULE,FILE_EXTENSIONS_CASE,PLUS_MINUS,UPPERCASE_SENTENCE_START"

alias gen "$HOME/programs/neovim/scripts/gen_vimdoc.py; rm -f $HOME/programs/neovim/runtime/doc/*.mpack"

alias diff "diff -W (tput cols)"

alias fd "fd --hidden"

# nix alias
alias nix-upgrade "nix-channel --update; nix-env -iA nixpkgs.nix nixpkgs.cacert"
alias nix-install "nix-env -i"
alias nix-remove "nix-env -e"
alias nix-search "nix-env -qa"

# npm
alias gpm "sudo npm -g"

# Clean trash
alias cleantrash "rm -rf $HOME/.local/share/Trash/{files,info}/*"

# Benchmark fish shell startup
alias fish-benchmark 'hyperfine --warmup 3 "exec fish"'

# Upgrade neovim from commandline
alias up "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"
