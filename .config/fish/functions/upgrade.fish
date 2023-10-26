function upgrade
    if type -q brew
        brew update
        brew upgrade
    end

    if type -q apt
        if test (uname) != Darwin
            sudo apt update
            sudo apt upgrade -y
        end
    end

    if type -q zypper
        sudo zypper update -y
    end

    if type -q paru
        paru -Syu --noconfirm
    end

    if type -q nvim
        nvim --headless "+Lazy! sync" +qa
    end

    git -C $HOME pull
    git -C $HOME/.private-dotfiles pull
end
