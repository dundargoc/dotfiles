function upgrade
    if type -q brew
        brew update
        brew upgrade
    end

    if type -q apt
        sudo apt update
        sudo apt upgrade -y
    end

    if type -q zypper
        sudo zypper update -y
    end

    if type -q paru
        paru -Syu --noconfirm
    end

    if type -q nix
        nix profile upgrade '.*'
    end

    if type -q nvim
        nvim --headless "+Lazy! sync" +qa
    end

    git -C $HOME pull
    git -C $HOME/.private-dotfiles pull
end
