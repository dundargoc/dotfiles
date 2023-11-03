function gdm
    set default (gh-default-branch)
    set ancestor (git merge-base $default HEAD)

    git diff $ancestor...HEAD $argv
end
