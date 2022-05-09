function gdm
    set default (gh-default-branch)
    set current (git branch --show-current)
    set ancestor (git merge-base $default $current)

    git diff $ancestor...$current $argv
end
