function gis --wraps "git switch"
    if count $argv >/dev/null
        set branch $argv
    else
        set branch (gh-default-branch)
    end

    if string match -r -q -- "^origin/" $branch
        set branch (string split -m1 "/" $branch)[2]
    end
    git switch --quiet "$branch"
    git submodule update
end
