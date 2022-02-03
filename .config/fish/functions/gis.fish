function gis --wraps "git switch"
    if count $argv >/dev/null
        git switch $argv
    else
        git switch (gh-default-branch)
    end
end
