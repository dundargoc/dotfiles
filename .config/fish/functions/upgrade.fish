function upgrade
    if type -q brew
        brew update
        brew upgrade
    end

    if type -q apt
        sudo apt update
        sudo apt upgrade -y
    end

    if type -q nvim
        nvim --headless -c 'autocmd User PackerComplete quitall' -c PackerSync
    end
end
