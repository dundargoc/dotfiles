function ghclean
    set merged_branches (git branch --merged upstream/master | grep -v '*' | grep -v (gh-default-branch))

    for branch in $merged_branches
        gbdd (string trim $branch)
    end

end
