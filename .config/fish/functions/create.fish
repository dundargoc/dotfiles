function create
    set current_branch (git rev-parse --abbrev-ref HEAD)
    set default_branch (gh-default-branch)

    if [ $current_branch != $default_branch ]
        gps
        gh pr create --fill --draft
    else
        echo "Current branch is master. Abort."
    end
end
