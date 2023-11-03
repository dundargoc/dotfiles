function grim
    set default_branch (gh-default-branch)
    set ancestor (git merge-base HEAD $default_branch)
    git rebase -i $ancestor
end
