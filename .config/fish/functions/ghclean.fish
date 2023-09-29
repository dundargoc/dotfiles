function ghclean
    set default_branch (gh-default-branch)
    set merged_branches (git branch --merged origin/$default_branch | grep -v '*' | grep -v $default_branch)

    for branch in $merged_branches
        gbdd (string trim $branch)
    end
end
