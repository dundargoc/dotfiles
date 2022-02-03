# Get default branch from github. There's likely some edge case that this fails
# on, but it works well so far.

# May need to use once `git remote set-head origin -a` beforehand if this
# doesn't work.

function gh-default-branch
    git rev-parse --abbrev-ref origin/HEAD | sed 's|origin/||'
end
