function s
    set repo_path (git rev-parse --show-toplevel)
    set repo_name (basename $repo_path)
    if count $argv >/dev/null
        set branch $argv
    else
        set branch (gh-default-branch)
    end

    git -C $repo_path fetch origin --tags --force --prune
    git -C $repo_path pull

    if git ls-remote --exit-code upstream &>/dev/null
        git -C $repo_path fetch upstream $branch --tags --force --prune
        git -C $repo_path rebase upstream/$branch $branch
    end
end
