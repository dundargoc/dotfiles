# --------------------------
# Add paths and reorder them
# --------------------------
if not type -q fish_add_path
    function fish_add_path
        contains $argv $fish_user_paths; or set -Ua fish_user_paths $argv
    end
end

fish_add_path $HOME/.bin
fish_add_path $HOME/.bin/*/bin
fish_add_path $HOME/.cargo/bin
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
