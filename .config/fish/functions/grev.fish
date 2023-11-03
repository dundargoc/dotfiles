function grev
    set default_branch (gh-default-branch)
    set ancestor (git merge-base HEAD $default_branch)
    git revert --no-edit "$ancestor"..HEAD
end
