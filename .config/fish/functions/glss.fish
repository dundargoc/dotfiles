function glss
    set default (gh-default-branch)
    set current (git branch --show-current)
    set ancestor (git merge-base $default $current)

    if [ $default != $current ]
        git diff $ancestor...$current --stat $argv
    end
end
