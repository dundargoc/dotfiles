# Create a patch for a specific commit. Unsure if git has a builtin way of
# doing this, but couldn't find anything.

function gpatch
    if count $argv >/dev/null
        git format-patch $argv~1..$argv
    else
        git format-patch HEAD~1..HEAD
    end
end
