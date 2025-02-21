function gitcompare
    if count $argv >/dev/null
        set branch $argv
    else
        set branch (gh-default-branch)
    end
    git log --right-only --topo-order --cherry-pick --oneline --no-merges HEAD...$branch $argv
end
