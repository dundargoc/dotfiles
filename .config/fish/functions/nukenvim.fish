function nukenvim
    echo "Are you sure?"
    read answer

    if [ $answer = y ]
        rm -rf $HOME/.config/nvim $HOME/.local/share/nvim $HOME/.local/state/nvim $HOME/.cache/nvim
    end
end
