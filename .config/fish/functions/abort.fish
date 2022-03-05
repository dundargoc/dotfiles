function abort
    git bisect reset &>/dev/null
    git rebase --abort &>/dev/null
    git revert --abort &>/dev/null
end
