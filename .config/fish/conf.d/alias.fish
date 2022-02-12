# Define helper paths
set PROG $HOME/programs

# ls
if type -q exa
    alias ls exa
end
alias la="ls -a"
alias ll="la -l"

# -------------------------------------------------------------------------
# OS specific commands
# -------------------------------------------------------------------------

if grep -iq ubuntu /etc/os-release
    alias install "sudo apt install"
    alias show "apt show"
    alias search "apt search"
    alias remove "sudo apt purge"
    alias prune "sudo apt-get autoremove --yes"
else
    # Assume manjaro

    alias install "paru -S --needed --removemake"
    alias show "paru -Si"
    alias search "paru -Ss"
    alias remove "paru -Rs"
    alias prune "sudo paccache -ruk0; paru -Scc --noconfirm"
    alias fsearch "paru -F"
    alias mirror "sudo pacman-mirrors -id"
    alias orphan 'paru --clean'
    alias listgit "list | rg '\-git'"
end

alias upgrade topgrade


# -------------------------------------------------------------------------
# git
# -------------------------------------------------------------------------

alias gac="git add -A; git commit"
alias gaf="git add -f"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete"
alias gbdf="git branch --delete --force"
alias gbm="git branch --move"
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
alias gclc="git clean -fd :/"
alias gcn="git commit --no-verify"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gf="git add -A; git commit -m 'chore: quick update, squash later'"
alias gk="gitk"
alias gfn="git add -A; git commit --no-verify -m 'chore: quick update, squash later'"
alias gt="git add -A; git commit -m 'chore: test commit, will likely delete after'"
alias gl="git log --graph --full-history --pretty --oneline"
alias gla="gl --all"
alias glp="git log -p"
alias glpd="git log -p --word-diff"
alias gls="git log --stat --oneline"
alias gpa="git push --all"
alias gpl="git pull --rebase"
alias gpf='git push --force-with-lease --quiet'
alias gpt="git push --tags"
alias gr="git remote"
alias gre="git rebase"
alias grec="git rebase --continue"
alias groot="git rebase --root -i"
alias gs="git status"
alias gsh="git show"
alias gshw="git show --word-diff"
alias gl1="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

alias amend "git commit --amend --no-verify --allow-empty"
alias ameno "git commit --amend --no-verify --allow-empty --no-edit"

alias good "git bisect good"
alias bad "git bisect bad"
alias old "git bisect old"
alias new "git bisect new"
alias bisect "git bisect start"

alias create "gh pr create --fill"
alias createdraft "gh pr create --fill --draft"

alias stash "git stash"
alias pop "git stash pop"

function fix --argument-names commit
    git add -A
    git commit --no-verify --allow-empty --fixup="$commit"
end

alias git-add-upstream "git remote add upstream"
alias s="hub sync"

# -------------------------------------------------------------------------
# vim
# -------------------------------------------------------------------------
alias vi '$EDITOR'
alias vimdiff "vi -d"
alias svi 'sudo $EDITOR'
alias view 'vi -M'

# -------------------------------------------------------------------------
# goto
# -------------------------------------------------------------------------
alias cdd="cd $HOME/Downloads"
alias cdp="cd $PROG"
alias cdf="cd $PROG/fish-shell"
alias cdfc="cd $PROG/fish-shell/share/completions"
alias cdn="cd $PROG/neovim"
alias cdnd="cd $PROG/neovim/runtime/doc"
alias cdni="cd $PROG/neovim/.github/workflows"
alias cdnl="cd $PROG/neovim/runtime/lua/vim"
alias cdnc="cd $PROG/neovim/scripts"
alias cdnci="cd $PROG/neovim/ci"
alias cdnr="cd $PROG/neovim/runtime"
alias cdnn="cd $PROG/neovim/src/nvim"
alias cdns="cd $PROG/neovim/src"
alias cdnt="cd $PROG/neovim/test"
alias cdnot="cd $PROG/notdundargoc/neovim"
alias cdorg="cd $PROG/dundar-organization/neovim/.github/workflows"
alias cds="cd $PROG/services/src"
alias cdsr="cd $PROG/services/src/services/chain/execute/runner"
alias cdt="cd $PROG/nvim-treesitter"
alias cdsv="cd $PROG/services/src/services/victoria/ui"
alias cdsva="cd $PROG/services/src/services/victoria/ui/ui/components/Activity"
alias cdv="cd $PROG/vim/src"

# -------------------------------------------------------------------------
# goto dotfiles
# -------------------------------------------------------------------------
alias dfi="cd $XDG_CONFIG_HOME/fish"
alias dfc="cd $XDG_CONFIG_HOME/fish/completions"
alias dfd="cd $XDG_CONFIG_HOME/fish/conf.d"
alias dff="cd $XDG_CONFIG_HOME/fish/functions"
alias dm="cd $HOME/.misc"
alias dn="cd $XDG_CONFIG_HOME/nvim"
alias dnp="cd $XDG_CONFIG_HOME/nvim/plugin"
alias c="cd $XDG_CONFIG_HOME"
alias ft="cd $HOME/ftplugin"
alias db="cd $HOME/.bin"
alias dp="cd $HOME/.private-dotfiles"

# -------------------------------------------------------------------------
# config
# -------------------------------------------------------------------------
alias ali="$EDITOR $XDG_CONFIG_HOME/fish/conf.d/alias.fish"
alias prc="$EDITOR $XDG_CONFIG_HOME/nvim/plugin/packer.lua"
alias rc="$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
alias brc="$EDITOR $HOME/.bashrc"
alias frc="$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
alias zenv="$EDITOR $HOME/.zshenv"
alias unrc="$EDITOR $PROG/neovim/src/uncrustify.cfg"
alias vimrc="$EDITOR $XDG_CONFIG_HOME/nvim/init.vim"
alias bsprc="$EDITOR $XDG_CONFIG_HOME/bspwm/bspwmrc"
alias sxhrc="$EDITOR $XDG_CONFIG_HOME/sxhkd/sxhkdrc"
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

# Print human-readable PATH
alias path='echo $PATH | tr " " "\n"'

alias logout="loginctl terminate-user dundar"

alias ch="reset; shellcheck -a -x -e SC2086"

alias rename="perl-rename -i"

alias detox="detox -s lower"

alias scc='scc --no-complexity --no-cocomo'

alias black="black -C"

alias codespell="codespell -H --config $HOME/.codespellrc --ignore-words=$HOME/.codespell-ignorewords"

alias lt "reset; languagetool --autoDetect --disable DASH_RULE,COMMA_PARENTHESIS_WHITESPACE,ARROWS,UNLIKELY_OPENING_PUNCTUATION,WHITESPACE_RULE,FILE_EXTENSIONS_CASE,PLUS_MINUS,UPPERCASE_SENTENCE_START"

# Use full screen when using diff
alias diff "diff -W (tput cols)"

alias fd "fd --hidden"

# npm
alias gpm "sudo npm -g"

# Clean trash
alias cleantrash "rm -rf $HOME/.local/share/Trash/{files,info}/*"

# Benchmark fish shell startup
alias fish-benchmark 'hyperfine --warmup 3 "exec fish"'

# Run custom built fish
alias fi "$PROG/fish-shell/bin/fish"

alias ag "rg --ignore-case --hidden"

# -------------------------------------------------------------------------
# neovim development
# -------------------------------------------------------------------------

# Upgrade neovim from commandline
alias up "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"

# Generate documentation
alias gen "$PROG/neovim/scripts/gen_vimdoc.py; rm -f $PROG/neovim/runtime/doc/*.mpack"

alias clint='$PROG/neovim/src/clint.py'
alias un='uncrustify -c $PROG/neovim/src/uncrustify.cfg --replace --no-backup'
alias unc-update='uncrustify -c $PROG/neovim/src/uncrustify.cfg --update-config-with-doc -o $PROG/neovim/src/uncrustify.cfg'
alias bi "$PROG/neovim/bin/nvim"
alias asan "UBSAN_OPTIONS=print_stacktrace=1 ASAN_OPTIONS=log_path=/tmp/nvim_asan $PROG/neovim/bin/nvim"
alias asan-log "vi /tmp/nvim_asan"
