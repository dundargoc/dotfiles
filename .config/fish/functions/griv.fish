function griv
    set default (gh-default-branch)
    set current (git branch --show-current)
    set ancestor (git merge-base $default $current)

    git revert --no-edit $ancestor...$current $argv
end
