function upgrade
    if type -q brew
        brew update
        brew upgrade
    end

    if type -q apt
        sudo apt update
        sudo apt upgrade -y
    end

    if type -q paru
        paru -Syu --noconfirm
    end

    if type -q nvim
    end

    git -C $HOME pull
    git -C $HOME/.private-dotfiles pull
end
