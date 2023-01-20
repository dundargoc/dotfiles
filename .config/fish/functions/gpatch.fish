# Create a patch for a specific commit. Unsure if git has a builtin way of
# doing this, but couldn't find anything.

function gpatch
    git format-patch $argv~1..$argv
end
