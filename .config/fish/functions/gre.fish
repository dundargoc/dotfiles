function gre --wraps "git switch"
    if count $argv >/dev/null
        git rebase $argv
    else
        git rebase (gh-default-branch)
    end
end
