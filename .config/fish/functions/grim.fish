function grim
    set default_branch (gh-default-branch)
    set current_branch (git branch --show-current)
    set ancestor (git merge-base "$current_branch" $default_branch)
    git rebase -i $ancestor
end
