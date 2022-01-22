function grim
    set default_branch (git rev-parse --abbrev-ref origin/HEAD | sed 's|origin/||')
    set current_branch (git branch --show-current)
    set ancestor (git merge-base "$current_branch" $default_branch)
    git rebase -i $ancestor
end
