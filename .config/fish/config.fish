# Define environment variables
superset EDITOR nvim
superset VISUAL nvim
superset MANPAGER 'nvim +Man!'

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
setxkbmap -option "ctrl:nocaps"

# Change "paragraph" symbol to escape. Only works on the terminal for now.
xmodmap -e "keycode 49 = Escape"

# Remove the start greeting
set -U fish_greeting

# Add folders to path
fish_add_path "$HOME/.bin"
fish_add_path $HOME/.private-dotfiles/*/bin

source $HOME/.private-dotfiles/fish/conf.d/*

for i in $HOME/.private-dotfiles/bin/*
    fish_add_path $i
end

# Source nix if it exists
if test -e $HOME/.nix-profile/etc/profile.d/nix.sh
    bass source $HOME/.nix-profile/etc/profile.d/nix.sh
end

# Add brew to path if it exists
if test -e /home/linuxbrew/.linuxbrew/bin/brew
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
end

# Enable vi mode
fish_vi_key_bindings

# Accept autosuggestions with ctrl-space
bind -k nul -M insert accept-autosuggestion
bind -k nul -M normal accept-autosuggestion

# Make yy in normal mode copy the entire line to clipboard
bind yy fish_clipboard_copy
