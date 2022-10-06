function gps
    set current_branch (git branch --show-current)
    git push --set-upstream origin "$current_branch"
end
