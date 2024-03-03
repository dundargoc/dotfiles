function ghlist
    gh api repos/neovim/neovim/actions/workflows | jq -cM '.workflows[] | [.id, .name, .path]'
end
