######################################################
# General options

setopt auto_cd        # Allow .. without getting "Permission denied".
setopt extendedglob   # Add additional features for identifying files.

######################################################
# History

setopt bang_hist                # Treat the '!' character specially during expansion.
setopt extended_history         # Write the history file in the ':start:elapsed;command' format.
setopt share_history            # Share history between all sessions.
setopt hist_expire_dups_first   # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups         # Do not record an event that was just recorded again.
setopt hist_ignore_all_dups     # Delete an old recorded event if a new event is a duplicate.
setopt hist_find_no_dups        # Do not display a previously found event.
setopt hist_ignore_space        # Do not record an event starting with a space.
setopt hist_save_no_dups        # Do not write a duplicate event to the history file.
setopt hist_verify              # Do not execute immediately upon history expansion.

# ----------------------------------------------------------------------
# Other

bindkey '^[[1;5C' forward-word    # [Ctrl-RightArrow] - move forward one word.
bindkey '^[[1;5D' backward-word   # [Ctrl-LeftArrow] - move backward one word.

# Automatically attach tmux session named ssh-tmux. If it doesn't exist then just create a new one.
if [[ -n $PS1 ]] && [[ -z $TMUX ]] && [[ -n $SSH_CONNECTION ]]; then
	export TERM=xterm-256color # Set the term variable if I'm using SSH so my terminal (kitty) doesn't break.
	tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi

# Force unique paths only
typeset -U path

# ----------------------------------------------------------------------
# Plugins

if test -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
bindkey '^ ' autosuggest-accept

if test -f /usr/share/zsh/functions/Prompts/prompt_pure_setup; then
source /usr/share/zsh/functions/Prompts/prompt_pure_setup
fi

for i in $HOME/.zsh/*; do
  source "$i"
done

# ----------------------------------------------------------------------
# Aliases and functions

source ~/.aliases.sh

# Automatically run ls after using cd.
chpwd() {
	la
}

alias rc='$EDITOR $HOME/.zshrc'
