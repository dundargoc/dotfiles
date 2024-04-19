function up
    git -C $HOME pull
    git -C $HOME/.private-dotfiles pull

    if type -q brew
        brew update
        brew upgrade --fetch-HEAD
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

    if type -q home-manager
        home-manager switch
    end
end
