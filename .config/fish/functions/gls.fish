function gls
    set default (gh-default-branch)
    set current (git branch --show-current)
    set ancestor (git merge-base $default $current)

    if [ $default = $current ]
        git log --stat --oneline
    else
        git log --stat --oneline $ancestor...$current $argv
    end
end
