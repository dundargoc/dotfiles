function gitcompare
    set default_branch (gh-default-branch)
    git log --right-only --topo-order --cherry-pick --oneline HEAD...$default_branch $argv
end
