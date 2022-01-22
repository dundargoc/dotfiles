function gps
    if git remote | grep -w review
        git push review
    else
        set current_branch (git rev-parse --abbrev-ref HEAD)
        git push --set-upstream origin "$current_branch"
    end
end
