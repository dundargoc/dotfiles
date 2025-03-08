# --------------------------
# General configuration
# --------------------------

# Add paths and reorder them
if not type -q fish_add_path
    function fish_add_path
        contains $argv $fish_user_paths; or set -Ua fish_user_paths $argv
    end
end

fish_add_path $HOME/.bin
fish_add_path $HOME/.bin/*/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.luarocks/bin
fish_add_path $HOME/.local/bin

fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path /home/linuxbrew/.linuxbrew/sbin
set fish_complete_path $fish_complete_path /home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/llvm/bin

# --------------------------

# Define environment variables
if type -q nvim
    superset EDITOR nvim
    superset VISUAL nvim
    superset MANPAGER 'nvim +Man!'
else
    superset EDITOR vim
    superset VISUAL vim
end

superset XDG_CONFIG_HOME $HOME/.config
superset XDG_CACHE_HOME $HOME/.cache
superset XDG_DATA_HOME $HOME/.local/share
superset XDG_DATA_DIRS /usr/local/share:/usr/share
superset XDG_CONFIG_DIRS /etc/xdg

# Change ls colors. Possible colors schemes: ayu, jellybeans, molokai, snazzy, solarized-dark, solarized-light.
if type -q vivid
    set -gx LS_COLORS (vivid generate snazzy)
end

# Change capslock to control
#setxkbmap -option "ctrl:nocaps"

# Remove the start greeting
set -U fish_greeting

if test -e $HOME/.private-dotfiles
    source $HOME/.private-dotfiles/fish/conf.d/*
end

# Source nix if it exists
if test -e $HOME/.nix-profile/etc/profile.d/nix.sh
    bass source $HOME/.nix-profile/etc/profile.d/nix.sh
end

# Source home-manager if it exists
if test -e $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    bass source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
end

# Enable vi mode
fish_vi_key_bindings

# Accept autosuggestions with ctrl-space
bind -k nul -M insert accept-autosuggestion
bind -k nul -M normal accept-autosuggestion

# Make yy in normal mode copy the entire line to clipboard
bind yy fish_clipboard_copy

# --------------------------
# Alias
# --------------------------

# Define helper paths
set PROG $HOME/programs
set NVIM $PROG/neovim

# ls
if type -q eza
    alias ls eza
    alias la "eza -a"
    alias ll "eza -l"
else
    alias la "ls -A"
    alias ll "la -l"
end

# -------------------------------------------------------------------------
# OS specific commands
# -------------------------------------------------------------------------

if ! test -e /etc/os-release
    # Assume mac
    alias install "brew install"
    alias show "brew info"
    alias search "brew search"
    alias remove "brew remove"
    alias prune "brew autoremove && brew cleanup"
else if grep -iq ubuntu /etc/os-release
    alias install "sudo apt install"
    alias show "apt show"
    alias search "apt search"
    alias remove "sudo apt purge"
    function prune
        sudo apt-get autoremove --yes
        if type -q brew
            brew autoremove
            brew cleanup
        end
    end
else if grep -iq tumbleweed /etc/os-release
    alias install "sudo zypper install"
    alias show "zypper info"
    alias search "zypper search"
    alias remove "sudo zypper remove --clean-deps"
else
    # Assume manjaro

    if type -q paru
        set installer paru
    else if type -q yay
        set installer yay
    else
        set installer "sudo pacman"
    end

    alias install "$installer -S --needed --removemake"
    alias show "$installer -Si"
    alias search "$installer -Ss"
    alias remove "$installer -Rs"
    alias prune "sudo paccache -ruk0; $installer -Scc --noconfirm"
    alias fsearch "$installer -F"
    alias mirror "sudo pacman-mirrors -id"
    alias orphan '$installer --clean'
    alias listgit "list | rg '\-git'"
end

# -------------------------------------------------------------------------
# git
# -------------------------------------------------------------------------

alias ga="git add -A"
alias gac="git add -A; git commit"
alias gaf="git add -f"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete --force"
alias gbm="git branch --move"
alias gbu="git branch --unset-upstream"
alias gc="git commit"
alias gcb="git checkout -b"
alias gd="git diff"
alias gdw="git diff --word-diff"
alias gdc="git diff --cached"
alias gdcw="git diff --cached --word-diff"
alias gcd "cd (git rev-parse --show-toplevel)"
alias gclc="git clean -fd :/"
alias gcn="git commit --no-verify"
alias gco="git checkout"
alias gcoh="git checkout --ours ."
alias gcom="git checkout --theirs ."
alias gcp="git cherry-pick"
alias gf="git add -A; git commit -m 'fixup: quick update, squash later'"
alias gib="git switch -"
alias gk="gitk"
alias gfn="git add -A; git commit --no-verify -m 'fixup: quick update, squash later'"
alias gt="git add -A; git commit -m 'fixup: TEST COMMIT THAT WILL DELETED'"
alias gl="git log --graph --full-history --pretty --oneline"
alias gl1="git log --oneline"
alias gla="gl --all"
alias glp="git log -p"
alias glpd="git log -p --word-diff"
alias gpa="git push --all"
alias gp="git push --quiet"
alias gpl="git pull --rebase"
alias gpf='git push --force-with-lease --quiet'
alias gpt="git push --tags"
alias gr="git remote"
alias grec="git rebase --continue || git revert --continue"
alias groot="git rebase --root -i"
alias gs="git status"
alias gsh="git show"
alias gshw="git show --word-diff"

alias abs "ga; git absorb --and-rebase --force"

alias ame "ga; git commit --amend --no-verify --allow-empty --no-edit"
alias amend "git commit --amend --no-verify --allow-empty"
alias ameno "git commit --amend --no-verify --allow-empty --no-edit; gpf"

alias good "git bisect good"
alias bad "git bisect bad"
alias old "git bisect old"
alias new "git bisect new"
alias bisect "git bisect start"

alias fork "gh repo fork --default-branch-only"

alias stash "git stash"
alias pop "git stash pop"
alias apply "git stash apply"

alias gset='git remote set-head origin -a'
alias git-add-upstream "git remote add upstream"

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
alias cda="cd (git rev-parse --show-toplevel)/.github/actions"
alias cdi="cd (git rev-parse --show-toplevel)/.github/workflows"
alias cdb="cd $HOME/books"

# Neovim
alias cdn="cd $PROG/neovim"
alias cddep="cd $PROG/neovim/cmake.deps/cmake"
alias cdna="cd $PROG/neovim/.github/actions"
alias cdnd="cd $PROG/neovim/runtime/doc"
alias cdni="cd $PROG/neovim/.github/workflows"
alias cdnis="cd $PROG/neovim/.github/scripts"
alias cdnl="cd $PROG/neovim/runtime/lua/vim"
alias cdnc="cd $PROG/neovim/scripts"
alias cdnr="cd $PROG/neovim/runtime"
alias cdnn="cd $PROG/neovim/src/nvim"
alias cdns="cd $PROG/neovim/src"
alias cdnt="cd $PROG/neovim/test"
alias cdnot="cd $PROG/notdundargoc/neovim"
alias cdorg="cd $PROG/dundar-organization/neovim"
alias cdl "cd $HOME/.local/share/nvim/lazy"
alias cdt="cd $PROG/tree-sitter"

alias cdu="cd $PROG/uncrustify"
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
alias db="cd $HOME/.bin"
alias dp="cd $HOME/.private-dotfiles"

# -------------------------------------------------------------------------
# config
# -------------------------------------------------------------------------
alias ali="$EDITOR $XDG_CONFIG_HOME/fish/conf.d/alias.fish"
alias brc="$EDITOR $HOME/.bashrc"
alias frc="$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
alias zenv="$EDITOR $HOME/.zshenv"
alias unrc="$EDITOR $PROG/neovim/src/uncrustify.cfg"
alias bsprc="$EDITOR $XDG_CONFIG_HOME/bspwm/bspwmrc"
alias sxhrc="$EDITOR $XDG_CONFIG_HOME/sxhkd/sxhkdrc"
alias trc="$EDITOR $HOME/.tmux.conf"
alias grc="$EDITOR $HOME/.gitconfig"
alias lsprc="$EDITOR $XDG_CONFIG_HOME/nvim/plugin/lsp.lua"
alias treerc="$EDITOR $XDG_CONFIG_HOME/nvim/plugin/treesitter.lua"
alias n="$EDITOR $XDG_CONFIG_HOME/home-manager/home.nix"

if type -q nvim
    alias vimrc="$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"
else
    alias vimrc="$EDITOR $HOME/.vimrc"
end

# reload current shell
alias reload="exec fish"

# wifi
alias wifi="sudo nmtui"

alias mkdir="mkdir -p"

# xclip
alias clip="xclip -sel clip <"

# rmdir
alias rmd="rmdir * 2>/dev/null"

# Restore dotfiles
alias restore="git -C $HOME checkout .; reload"

# Brightness
alias x="brightnessctl set"
alias x+="brightnessctl set +3%"
alias x-="brightnessctl set 3%-"
alias xmax="brightnessctl set 100%"
alias xmin="brightnessctl set 1%"

# Make commands human-readable.
alias du="du -h"
alias df="df -h"
alias free="free -h"

# Fast tmux
alias t="tmux"

# Print human-readable PATH
#alias path='echo $PATH | tr " " "\n"'

alias logout="loginctl terminate-user dundar"

alias ch="reset; shellcheck -a -x -e SC2086"

alias rename="perl-rename -i"

alias detox="detox -s lower"

alias scc='scc --no-complexity --no-cocomo'

alias codespell="reset; command codespell -H --config $HOME/.codespellrc --ignore-words=$HOME/.codespell-ignorewords"
alias typos="reset; command typos --config $HOME/.config/typos.toml"

alias lt "reset; languagetool --autoDetect --disable DASH_RULE,COMMA_PARENTHESIS_WHITESPACE,ARROWS,UNLIKELY_OPENING_PUNCTUATION,WHITESPACE_RULE,FILE_EXTENSIONS_CASE,PLUS_MINUS,UPPERCASE_SENTENCE_START"

# Use full screen when using diff
alias diff "diff -W (tput cols)"

# npm
alias gpm "sudo npm -g"

# Clean trash
alias cleantrash "rm -rf $HOME/.local/share/Trash/{files,info}/*"

# Benchmark fish shell startup
alias fish-benchmark 'hyperfine --warmup 3 "exec fish"'

# Run custom built fish
alias fi "$PROG/fish-shell/bin/fish"

alias ag "rg --ignore-case --hidden --glob '!.git'"

# -------------------------------------------------------------------------
# neovim development
# -------------------------------------------------------------------------

alias clint='$PROG/neovim/src/clint.py'
alias un='uncrustify -c $PROG/neovim/src/uncrustify.cfg --replace --no-backup'
alias bun='$PROG/uncrustify/build/uncrustify -c $PROG/neovim/src/uncrustify.cfg --replace --no-backup'
alias fun='$PROG/uncrustify/build/uncrustify -c config.cfg -f test.cpp'
alias dun='$PROG/uncrustify/build/uncrustify -c config.cfg -f test.cpp -p output.p -L A 2>output.A'
alias vun='uncrustify -c $PROG/vim/src/uncrustify.cfg --replace --no-backup'
alias vunrc="$EDITOR $PROG/vim/src/uncrustify.cfg"
alias unc-update='uncrustify -c $PROG/neovim/src/uncrustify.cfg --update-config-with-doc -o $PROG/neovim/src/uncrustify.cfg'
alias bunc-update='$PROG/uncrustify/build/uncrustify -c $PROG/neovim/src/uncrustify.cfg --update-config-with-doc -o $PROG/neovim/src/uncrustify.cfg'
alias vunc-update='uncrustify -c $PROG/vim/src/uncrustify.cfg --update-config-with-doc -o $PROG/vim/src/uncrustify.cfg'
alias swapdel "rm -rf /home/dgoc/.local/share/nvim/swap/*"
alias clean "rm -rf $PROG/neovim/build"
alias vimclean "find $PROG/neovim -type f -name '*.rej' -delete; find $PROG/neovim -maxdepth 1 -type f -name '*.patch' -delete; make -C $PROG/neovim/src/nvim/testdir clean"
alias cvim "nvim --clean"
alias v '$HOME/programs/vim/bin/vim'
alias forma "form --all"

# cmake
alias cb "$PROG/CMake/build/bin/cmake"
alias cm="$EDITOR CMakeLists.txt"
alias cmd="$EDITOR $NVIM/cmake.deps/CMakeLists.txt"
alias cnd="$EDITOR $NVIM/src/nvim/CMakeLists.txt"
alias cnr="$EDITOR $NVIM/runtime/CMakeLists.txt"

alias nukepodman "podman image prune --all --external; podman system reset"
alias nukedocker "docker system prune -a -f --volumes"

alias hos="home-manager switch"
alias nukenix="nix-collect-garbage -d; $HOME/.misc/nix/home-manager-install"

alias cbuildrelease "cbuild -DCMAKE_BUILD_TYPE=Release"

alias ts "tree-sitter"
alias tsp "tree-sitter generate && tree-sitter parse"
