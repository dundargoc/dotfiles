function ghclean
    set default_branch (gh-default-branch)
    for remote in (git remote)
        set merged_branches (git branch --merged $remote/$default_branch | grep -v '*' | grep -v $default_branch)

        for branch in $merged_branches
            gbdd (string trim $branch)
        end
    end

end
