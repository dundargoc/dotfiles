function gis --wraps "git switch"
    if count $argv >/dev/null
        set branch $argv
    else
        set branch (gh-default-branch)
    end
    git switch --quiet "$branch"
    git submodule update
end
