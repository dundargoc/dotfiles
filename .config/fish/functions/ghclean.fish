function ghclean
    for remote in (git remote)
        set merged_branches (git branch --merged $remote/master | grep -v '*' | grep -v (gh-default-branch))

        for branch in $merged_branches
            gbdd (string trim $branch)
        end
    end

end
