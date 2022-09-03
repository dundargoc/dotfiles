function grem --wraps "git switch"
    if count $argv >/dev/null
        git rebase -X ours $argv
    else
        git rebase -X ours (gh-default-branch)
    end
end
