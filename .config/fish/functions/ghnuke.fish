function ghnuke
    gh api repos/neovim/neovim/actions/workflows/$argv/runs --paginate | jq '.workflow_runs[] | .id' | xargs -n1 -t -I% gh api repos/neovim/neovim/actions/runs/% -X DELETE
end
